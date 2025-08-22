#!/usr/bin/env python3
"""
PostgreSQL to Excel Exporter

This script connects to a PostgreSQL database and exports all tables 
from both 'public' and 'ifix' namespaces to separate Excel files.

For public namespace: tablename.xlsx
For ifix namespace: ifix_tablename.xlsx

Required packages:
pip install psycopg2-binary pandas openpyxl

Usage:
python export_postgres_to_excel.py
"""

import os
import sys
import pandas as pd
import psycopg2
from psycopg2.extras import RealDictCursor
from psycopg2 import sql
from sqlalchemy import create_engine
from typing import List, Optional
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)


class PostgreSQLExporter:
    def __init__(self, dsn: str):
        """
        Initialize the PostgreSQL exporter.
        
        Args:
            dsn: PostgreSQL connection DSN string
        """
        self.dsn = dsn
        self.connection = None
        self.engine = None
        
    def connect(self) -> bool:
        """
        Establish connection to PostgreSQL database.
        
        Returns:
            bool: True if connection successful, False otherwise
        """
        try:
            self.connection = psycopg2.connect(self.dsn, cursor_factory=RealDictCursor)
            self.connection.autocommit = True
            self.engine = create_engine(self.dsn)
            logger.info("Successfully connected to database")
            logger.info("SQLAlchemy engine initialized for pandas")
            return True
        except Exception as e:
            logger.error(f"Error connecting to database: {e}")
            return False
    
    def disconnect(self):
        """Close database connection."""
        if getattr(self, 'engine', None) is not None:
            try:
                self.engine.dispose()
            except Exception:
                pass
            self.engine = None
        if self.connection:
            self.connection.close()
            logger.info("Database connection closed")
    
    def get_all_tables(self, schema: str = 'public') -> List[str]:
        """
        Get list of all tables in the specified schema.
        
        Args:
            schema: Database schema name (default: 'public')
            
        Returns:
            List of table names
        """
        try:
            cursor = self.connection.cursor()
            query = """
                SELECT table_name 
                FROM information_schema.tables 
                WHERE table_schema = %s 
                AND table_type = 'BASE TABLE'
                ORDER BY table_name;
            """
            cursor.execute(query, (schema,))
            tables = [row['table_name'] for row in cursor.fetchall()]
            cursor.close()
            logger.info(f"Found {len(tables)} tables in schema '{schema}'")
            return tables
        except Exception as e:
            logger.error(f"Error fetching table list: {e}")
            self.connection.rollback()
            return []
    
    def get_table_row_count(self, table_name: str, schema: str) -> int:
        """
        Get the total number of rows in a table.
        
        Args:
            table_name: Name of the table
            schema: Database schema name
            
        Returns:
            Number of rows in the table
        """
        try:
            cursor = self.connection.cursor()
            count_query = sql.SQL("SELECT COUNT(*) AS cnt FROM {}.{}").format(
                sql.Identifier(schema), sql.Identifier(table_name)
            )
            cursor.execute(count_query)
            row = cursor.fetchone()
            count = row.get('cnt') if isinstance(row, dict) else row[0]
            cursor.close()
            return count
        except Exception as e:
            logger.error(f"Error getting row count for {schema}.{table_name}: {e}")
            try:
                self.connection.rollback()
            except Exception:
                pass
            return -1
    
    def export_table_to_excel(self, table_name: str, schema: str, output_dir: str = 'exported_tables') -> dict:
        """
        Export a single table to Excel file with validation.
        
        Args:
            table_name: Name of the table to export
            schema: Database schema name
            output_dir: Directory to save Excel files
            
        Returns:
            dict: Export result with success status and record counts
        """
        result = {
            'success': False,
            'table': f"{schema}.{table_name}",
            'db_count': 0,
            'excel_count': 0,
            'filename': '',
            'error': None
        }
        
        try:
            os.makedirs(output_dir, exist_ok=True)
            
            # First, get the row count from database
            db_row_count = self.get_table_row_count(table_name, schema)
            result['db_count'] = db_row_count
            
            if db_row_count == -1:
                result['error'] = "Failed to get row count from database"
                return result
            
            if db_row_count == 0:
                logger.warning(f"Table {schema}.{table_name} is empty (0 rows)")
            
            # Use schema-qualified table name in query
            query_sql = sql.SQL("SELECT * FROM {}.{}").format(
                sql.Identifier(schema), sql.Identifier(table_name)
            )
            query = query_sql.as_string(self.connection)
            logger.info(f"Executing query: {query}")
            df = pd.read_sql_query(query, self.engine)
            
            # Verify row count matches
            excel_row_count = len(df)
            result['excel_count'] = excel_row_count
            
            # Generate filename based on schema
            if schema == 'ifix':
                excel_filename = os.path.join(output_dir, f"ifix_{table_name}.xlsx")
            else:
                excel_filename = os.path.join(output_dir, f"{table_name}.xlsx")
            
            result['filename'] = excel_filename
            
            # Export to Excel
            df.to_excel(excel_filename, index=False, engine='openpyxl')
            
            # Validate export
            if db_row_count != excel_row_count:
                error_msg = f"Row count mismatch: DB={db_row_count}, Excel={excel_row_count}"
                logger.error(f"[ERROR] {schema}.{table_name}: {error_msg}")
                result['error'] = error_msg
                result['success'] = False
            else:
                logger.info(f"[OK] {schema}.{table_name}: {excel_row_count} rows exported successfully -> {excel_filename}")
                result['success'] = True
            
            return result
            
        except Exception as e:
            error_msg = f"Error exporting table {schema}.{table_name}: {e}"
            logger.error(error_msg)
            result['error'] = str(e)
            try:
                self.connection.rollback()
            except Exception:
                pass
            return result
    
    def export_all_tables(self, schema: str = 'public', output_dir: str = 'exported_tables') -> dict:
        """
        Export all tables from a specific schema to Excel files.
        
        Args:
            schema: Database schema name (default: 'public')
            output_dir: Directory to save Excel files
            
        Returns:
            dict: Export summary with details of each table
        """
        tables = self.get_all_tables(schema)
        if not tables:
            logger.warning(f"No tables found in schema '{schema}'")
            return {'schema': schema, 'total_tables': 0, 'successful': 0, 'failed': 0, 'total_db_rows': 0, 'total_excel_rows': 0, 'results': []}
        
        successful_exports = 0
        failed_exports = []
        export_results = []
        total_db_rows = 0
        total_excel_rows = 0
        
        logger.info(f"Starting export of {len(tables)} tables from schema '{schema}'")
        
        for table in tables:
            result = self.export_table_to_excel(table, schema, output_dir)
            export_results.append(result)
            
            if result['success']:
                successful_exports += 1
                total_db_rows += result['db_count']
                total_excel_rows += result['excel_count']
            else:
                failed_exports.append(f"{schema}.{table}")
        
        schema_summary = {
            'schema': schema,
            'total_tables': len(tables),
            'successful': successful_exports,
            'failed': len(failed_exports),
            'total_db_rows': total_db_rows,
            'total_excel_rows': total_excel_rows,
            'results': export_results
        }
        
        logger.info(f"Schema '{schema}' export completed: {successful_exports}/{len(tables)} tables exported successfully")
        logger.info(f"Schema '{schema}' total rows: DB={total_db_rows}, Excel={total_excel_rows}")
        
        if failed_exports:
            logger.warning(f"Failed to export tables: {', '.join(failed_exports)}")
        
        return schema_summary
    
    def export_multiple_schemas(self, schemas: List[str], output_dir: str = 'exported_tables') -> dict:
        """
        Export all tables from multiple schemas to Excel files.
        
        Args:
            schemas: List of schema names to export
            output_dir: Directory to save Excel files
            
        Returns:
            dict: Complete export summary with validation results
        """
        all_results = []
        total_exported = 0
        total_db_rows = 0
        total_excel_rows = 0
        
        for schema in schemas:
            logger.info(f"Processing schema: {schema}")
            schema_result = self.export_all_tables(schema, output_dir)
            all_results.append(schema_result)
            total_exported += schema_result['successful']
            total_db_rows += schema_result['total_db_rows']
            total_excel_rows += schema_result['total_excel_rows']
        
        final_summary = {
            'total_schemas': len(schemas),
            'total_tables_exported': total_exported,
            'total_db_rows': total_db_rows,
            'total_excel_rows': total_excel_rows,
            'schemas': all_results,
            'data_integrity_check': total_db_rows == total_excel_rows
        }
        
        return final_summary
    
    def print_export_summary(self, summary: dict):
        """Print a detailed export summary report."""
        print("\n" + "=" * 70)
        print("EXPORT SUMMARY REPORT")
        print("=" * 70)
        
        print(f"Total Schemas Processed: {summary['total_schemas']}")
        print(f"Total Tables Exported: {summary['total_tables_exported']}")
        print(f"Total Database Rows: {summary['total_db_rows']:,}")
        print(f"Total Excel Rows: {summary['total_excel_rows']:,}")
        
        if summary['data_integrity_check']:
            print("[OK] DATA INTEGRITY: All database rows successfully exported to Excel")
        else:
            print("[WARN] DATA INTEGRITY: Row count mismatch detected!")
        
        print("\n" + "-" * 70)
        print("SCHEMA BREAKDOWN:")
        print("-" * 70)
        
        for schema_result in summary['schemas']:
            schema = schema_result['schema']
            print(f"\nSchema: {schema}")
            print(f"   Tables: {schema_result['successful']}/{schema_result['total_tables']} successful")
            print(f"   Rows: {schema_result['total_db_rows']:,} (DB) -> {schema_result['total_excel_rows']:,} (Excel)")
            
            if schema_result['failed'] > 0:
                print(f"   [WARN] Failed exports: {schema_result['failed']}")
        
        print("\n" + "-" * 70)
        print("DETAILED TABLE RESULTS:")
        print("-" * 70)
        
        for schema_result in summary['schemas']:
            for table_result in schema_result['results']:
                status = "OK" if table_result['success'] else "FAIL"
                table_name = table_result['table']
                db_count = table_result['db_count']
                excel_count = table_result['excel_count']
                
                print(f"{status} {table_name}: {db_count:,} -> {excel_count:,} rows")
                if table_result['error']:
                    print(f"     Error: {table_result['error']}")
        
        print("=" * 70)


def main():
    """Main function to run the export process."""
    
    # Database configuration - DSN string (same as decrypt_object.py)
    CONFIG = {
        "db": {
            "dsn": "postgresql://muktauat:postgres@localhost:5432/mukta_uat_db"  # Set your DSN string here
        }
    }
    
    # Output directory for Excel files
    OUTPUT_DIR = os.getenv('OUTPUT_DIR', 'exported_tables')
    
    # Schemas to export - both public and ifix
    SCHEMAS = ['public', 'ifix']
    
    print("PostgreSQL to Excel Exporter")
    print("=" * 50)
    print("Database DSN: [configured]")
    print(f"Schemas to export: {', '.join(SCHEMAS)}")
    print(f"Output Directory: {OUTPUT_DIR}")
    print("=" * 50)
    print("File naming convention:")
    print("• public schema: tablename.xlsx")
    print("• ifix schema: ifix_tablename.xlsx")
    print("=" * 50)
    
    # Create exporter instance
    exporter = PostgreSQLExporter(CONFIG["db"]["dsn"])
    
    try:
        # Connect to database
        if not exporter.connect():
            sys.exit(1)
        
        # Export tables from both schemas with validation
        export_summary = exporter.export_multiple_schemas(SCHEMAS, OUTPUT_DIR)
        
        # Print detailed summary report
        exporter.print_export_summary(export_summary)
        
        if export_summary['total_tables_exported'] > 0:
            if export_summary['data_integrity_check']:
                print(f"\nSUCCESS: Export completed successfully. All {export_summary['total_db_rows']:,} records exported to '{OUTPUT_DIR}' directory")
            else:
                print(f"\nWARNING: Export completed with data integrity issues. Please check the summary above.")
        else:
            print("\n❌ No tables were exported")
            sys.exit(1)
            
    except KeyboardInterrupt:
        print("\nWARNING: Export interrupted by user")
        sys.exit(1)
    except Exception as e:
        logger.error(f"Unexpected error: {e}")
        sys.exit(1)
    finally:
        exporter.disconnect()


if __name__ == "__main__":
    main()