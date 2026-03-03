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
import json
def serialize_row(row):
    return {
        k: (json.dumps(v, ensure_ascii=False) if isinstance(v, (dict, list)) else v)
        for k, v in row.items()
    }

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
    
    def export_table_to_excel_chunked(self, table_name: str, schema: str, output_dir: str = 'exported_tables', chunk_size: int = 10000) -> dict:
        """
        Export a single table to Excel file with chunked processing to handle large tables.
        
        Args:
            table_name: Name of the table to export
            schema: Database schema name
            output_dir: Directory to save Excel files
            chunk_size: Number of rows to process per chunk
            
        Returns:
            dict: Export result with success status and record counts
        """
        result = {
            'success': False,
            'table': f"{schema}.{table_name}",
            'db_count': 0,
            'excel_count': 0,
            'filename': '',
            'error': None,
            'chunks_processed': 0
        }
        
        try:
            import gc
            os.makedirs(output_dir, exist_ok=True)
            
            # First, get the row count from database
            db_row_count = self.get_table_row_count(table_name, schema)
            result['db_count'] = db_row_count
            
            if db_row_count == -1:
                result['error'] = "Failed to get row count from database"
                return result
            
            if db_row_count == 0:
                logger.warning(f"Table {schema}.{table_name} is empty (0 rows)")
                # Create empty Excel file
                empty_df = pd.DataFrame()
                if schema == 'ifix':
                    excel_filename = os.path.join(output_dir, f"ifix_{table_name}.xlsx")
                else:
                    excel_filename = os.path.join(output_dir, f"{table_name}.xlsx")
                result['filename'] = excel_filename
                empty_df.to_excel(excel_filename, index=False, engine='openpyxl')
                result['success'] = True
                return result
            
            # Generate filename based on schema
            if schema == 'ifix':
                excel_filename = os.path.join(output_dir, f"ifix_{table_name}.xlsx")
            else:
                excel_filename = os.path.join(output_dir, f"{table_name}.xlsx")
            
            result['filename'] = excel_filename
            
            # Calculate number of chunks needed
            total_chunks = (db_row_count + chunk_size - 1) // chunk_size
            logger.info(f"Table {schema}.{table_name}: Processing {db_row_count:,} rows in {total_chunks} chunks of {chunk_size:,} rows each")
            
            # Use schema-qualified table name in query
            base_query_sql = sql.SQL("SELECT * FROM {}.{}").format(
                sql.Identifier(schema), sql.Identifier(table_name)
            )
            base_query = base_query_sql.as_string(self.connection)
            
            total_exported_rows = 0
            writer = None
            
            try:
                for chunk_num in range(total_chunks):
                    offset = chunk_num * chunk_size

                    # Add LIMIT and OFFSET to query
                    chunked_query = f"{base_query} LIMIT {chunk_size} OFFSET {offset}"
                    logger.info(f"Chunk {chunk_num + 1}/{total_chunks}: Fetching rows {offset:,} to {offset + chunk_size - 1:,}")

                    # Fetch rows using psycopg2 directly for serialization
                    cur = self.connection.cursor()
                    cur.execute(chunked_query)
                    rows = cur.fetchall()
                    safe_rows = [serialize_row(r) for r in rows]
                    chunk_df = pd.DataFrame(safe_rows)
                    cur.close()

                    if chunk_df.empty:
                        logger.warning(f"Chunk {chunk_num + 1} is empty, stopping")
                        break

                    # Handle Excel writing
                    if chunk_num == 0:
                        # First chunk: create new file with headers
                        with pd.ExcelWriter(excel_filename, engine='openpyxl', mode='w') as writer:
                            chunk_df.to_excel(writer, index=False, sheet_name='Sheet1')
                        logger.info(f"Chunk {chunk_num + 1}/{total_chunks}: Created Excel file with {len(chunk_df):,} rows")
                    else:
                        # Subsequent chunks: append without headers
                        from openpyxl import load_workbook

                        # Load existing workbook and append data
                        wb = load_workbook(excel_filename)
                        ws = wb.active

                        # Convert DataFrame to rows and append
                        for row in chunk_df.itertuples(index=False, name=None):
                            ws.append(row)

                        wb.save(excel_filename)
                        wb.close()
                        logger.info(f"Chunk {chunk_num + 1}/{total_chunks}: Appended {len(chunk_df):,} rows to Excel file")

                    total_exported_rows += len(chunk_df)
                    result['chunks_processed'] = chunk_num + 1

                    # Clear memory
                    del chunk_df
                    gc.collect()

                    # Progress update
                    progress = (chunk_num + 1) / total_chunks * 100
                    logger.info(f"Progress: {progress:.1f}% ({total_exported_rows:,}/{db_row_count:,} rows exported)")

                result['excel_count'] = total_exported_rows

                # Validate export
                if db_row_count != total_exported_rows:
                    error_msg = f"Row count mismatch: DB={db_row_count}, Excel={total_exported_rows}"
                    logger.error(f"[ERROR] {schema}.{table_name}: {error_msg}")
                    result['error'] = error_msg
                    result['success'] = False
                else:
                    logger.info(f"[OK] {schema}.{table_name}: {total_exported_rows:,} rows exported successfully in {result['chunks_processed']} chunks -> {excel_filename}")
                    result['success'] = True

                return result

            except Exception as chunk_error:
                logger.error(f"Error during chunked processing: {chunk_error}")
                result['error'] = f"Chunked processing failed: {str(chunk_error)}"
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
    
    def export_table_to_excel(self, table_name: str, schema: str, output_dir: str = 'exported_tables', use_chunking: bool = True, chunk_size: int = 10000) -> dict:
        """
        Export a single table to Excel file with optional chunked processing.
        
        Args:
            table_name: Name of the table to export
            schema: Database schema name
            output_dir: Directory to save Excel files
            use_chunking: Whether to use chunked processing for memory efficiency
            chunk_size: Number of rows to process per chunk (when chunking is enabled)
            
        Returns:
            dict: Export result with success status and record counts
        """
        if use_chunking:
            return self.export_table_to_excel_chunked(table_name, schema, output_dir, chunk_size)
        
        # Original single-query method (kept for backward compatibility)
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
    
    def export_all_tables(self, schema: str = 'public', output_dir: str = 'exported_tables', use_chunking: bool = True, chunk_size: int = 10000) -> dict:
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
            result = self.export_table_to_excel(table, schema, output_dir, use_chunking, chunk_size)
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
    
    def export_multiple_schemas(self, schemas: List[str], output_dir: str = 'exported_tables', use_chunking: bool = True, chunk_size: int = 10000) -> dict:
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
            schema_result = self.export_all_tables(schema, output_dir, use_chunking, chunk_size)
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
        },
        "export": {
            "use_chunking": True,         # Enable chunked processing for memory efficiency
            "chunk_size": 1000,            # Number of rows per chunk
            "memory_threshold": 10000      # Switch to chunking if table has more than this many rows
        }
    }
    
    # Output directory for Excel files
    OUTPUT_DIR = os.getenv('OUTPUT_DIR', 'exported_tables')
    
    # Schemas to export - both public and ifix
    SCHEMAS = ['public', 'ifix']
    
    print("PostgreSQL to Excel Exporter (Memory-Optimized)")
    print("=" * 60)
    print("Database DSN: [configured]")
    print(f"Schemas to export: {', '.join(SCHEMAS)}")
    print(f"Output Directory: {OUTPUT_DIR}")
    print(f"Chunked Processing: {'Enabled' if CONFIG['export']['use_chunking'] else 'Disabled'}")
    if CONFIG['export']['use_chunking']:
        print(f"Chunk Size: {CONFIG['export']['chunk_size']:,} rows")
        print(f"Memory Threshold: {CONFIG['export']['memory_threshold']:,} rows")
    print("=" * 60)
    print("File naming convention:")
    print("- public schema: tablename.xlsx")
    print("- ifix schema: ifix_tablename.xlsx")
    print("=" * 60)
    
    # Create exporter instance
    exporter = PostgreSQLExporter(CONFIG["db"]["dsn"])
    
    try:
        # Connect to database
        if not exporter.connect():
            sys.exit(1)
        
        # Export tables from both schemas with validation
        export_summary = exporter.export_multiple_schemas(
            SCHEMAS, 
            OUTPUT_DIR, 
            CONFIG['export']['use_chunking'], 
            CONFIG['export']['chunk_size']
        )
        
        # Print detailed summary report
        exporter.print_export_summary(export_summary)
        
        if export_summary['total_tables_exported'] > 0:
            if export_summary['data_integrity_check']:
                print(f"\nSUCCESS: Export completed successfully. All {export_summary['total_db_rows']:,} records exported to '{OUTPUT_DIR}' directory")
            else:
                print(f"\nWARNING: Export completed with data integrity issues. Please check the summary above.")
        else:
            print("\nERROR: No tables were exported")
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