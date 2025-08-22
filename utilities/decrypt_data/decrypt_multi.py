'''
    Multi-table decryption script - handles multiple tables with their respective columns
'''
import os
import logging
import requests
import psycopg2
from psycopg2.extras import DictCursor
from datetime import datetime

# ——— Configuration ——————————————————————————————————————————————
CONFIG = {
    "db": {
        "dsn": ""
    },
    "tables": [
        {
            "table": "eg_user" + "_decpt",
            "key_columns": ["id"],
            "columns": [
                "name",
                "mobilenumber",
                "emailid",
                "username",
                "altcontactnumber",
            ]
        },
        {
            "table": "eg_user_address" + "_decpt",
            "key_columns": ["id"],
            "columns": [
                "address"
            ]
        },
        {
            "table": "eg_user_audit_table" + "_decpt",
            "key_columns": ["id", "auditcreatedtime"],
            "columns": [
                "username",
                "mobilenumber",
                "emailid",
                "name"
            ]
        },
        {
            "table": "eg_mukta_ifms_disburse" + "_decpt",
            "key_columns": ["id"],
            "columns": [
                "account_code"
            ]
        },
        {
            "table": "jit_beneficiary_details" + "_decpt",
            "key_columns": ["id"],
            "columns": [ "bankaccountcode"]   
        },
        {
            "table": "eg_org_contact_detail" + "_decpt",
            "key_columns": ["id"],
            "columns": ["contact_name", "contact_mobile_number", ]
        },
        {
            "table": "eg_bank_account_detail" + "_decpt",
            "key_columns": ["id"],
            "columns": ["account_holder_name", "account_number"]
        },
        {
            "table": "INDIVIDUAL" + "_decpt",
            "key_columns": ["id"],
            "columns": ["mobilenumber"]
        },
        {
            "table": "individual_identifier" + "_decpt",
            "key_columns": ["id"],
            "columns": ["identifierid"]
        }
        
        # Add more tables as needed:
        # {
        #     "table": "your_table" + "_decpt",
        #     "key_columns": ["id"],  # or ["id", "composite_key"] for composite keys
        #     "columns": [
        #         "encrypted_col1",
        #         "encrypted_col2"
        #     ]
        # }
    ],
    "decryption_api_url": "http://egov-enc-service.egov:8080/egov-enc-service/crypto/v1/_decrypt",
    "log_dir": "logs"
}

# ——— Prepare log directory & filename ——————————————————————————————
os.makedirs(CONFIG["log_dir"], exist_ok=True)
timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
log_filename = os.path.join(
    CONFIG["log_dir"],
    f"decryption_multi_tables_{timestamp}.log"
)

# ——— Logging Setup —————————————————————————————————————————————
logger = logging.getLogger("decryption_multi_tables")
logger.setLevel(logging.INFO)
formatter = logging.Formatter("%(asctime)s %(levelname)-8s %(message)s")

# Console handler
ch = logging.StreamHandler()
ch.setFormatter(formatter)
logger.addHandler(ch)
# File handler
fh = logging.FileHandler(log_filename, mode="a")
fh.setFormatter(formatter)
logger.addHandler(fh)


def decrypt_values(encrypted_fields: dict) -> dict:
    """
    Send only non‐empty fields to the decrypt API,
    return a dict of decrypted values.
    """
    to_send = {k: v for k, v in encrypted_fields.items() if v}
    if not to_send:
        logger.info("Nothing to decrypt for fields: %s", encrypted_fields)
        return {}

    try:
        logger.debug("Calling decrypt API for payload: %s", to_send)
        resp = requests.post(
            CONFIG["decryption_api_url"],
            json=[to_send],
            headers={"Content-Type": "application/json"},
            timeout=10
        )
        resp.raise_for_status()
        result_list = resp.json()
        decrypted = {}
        for item in result_list:
            decrypted.update(item)
        logger.info("Decrypted → %s", decrypted)
        return decrypted

    except requests.RequestException as e:
        logger.error("Decrypt API error for %s: %s", to_send, e)
        return {}


def update_decrypted_values_for_table(table_config):
    """Process decryption for a single table configuration"""
    key_cols = table_config["key_columns"]
    data_cols = table_config["columns"]
    table = table_config["table"]

    # Select both key columns + any non-null data columns
    select_cols_sql = ", ".join(key_cols + data_cols)
    where_data_not_null = " OR ".join(f"{c} IS NOT NULL" for c in data_cols)
    select_sql = f"SELECT {select_cols_sql} FROM {table} WHERE {where_data_not_null}"

    try:
        with psycopg2.connect(CONFIG["db"]["dsn"]) as conn:
            with conn.cursor(cursor_factory=DictCursor) as cur:
                logger.info("[%s] Fetching rows: %s", table, select_sql)
                cur.execute(select_sql)
                rows = cur.fetchall()
                logger.info("[%s] Found %d rows", table, len(rows))

                updated_count = 0
                for row in rows:
                    # Build composite key values
                    key_vals = {k: row[k] for k in key_cols}
                    key_desc = " & ".join(f"{k}={key_vals[k]!r}" for k in key_cols)

                    # Extract only the encrypted data columns
                    encrypted_data = {c: row[c] for c in data_cols}

                    logger.info("[%s] Processing row [%s]; encrypted cols: %s",
                                table, key_desc,
                                [c for c, v in encrypted_data.items() if v])

                    try:
                        decrypted = decrypt_values(encrypted_data)
                        if not decrypted:
                            logger.warning("[%s] Row [%s]: nothing decrypted, skipping", table, key_desc)
                            continue

                        # Build dynamic UPDATE statement
                        set_parts = []
                        params = []
                        for col, val in decrypted.items():
                            set_parts.append(f"{col} = %s")
                            params.append(val)
                        # Append composite key params in same order as key_cols
                        for k in key_cols:
                            params.append(key_vals[k])

                        where_clause = " AND ".join(f"{k} = %s" for k in key_cols)
                        update_sql = (
                            f"UPDATE {table} SET " +
                            ", ".join(set_parts) +
                            f" WHERE {where_clause}"
                        )

                        cur.execute(update_sql, params)
                        logger.info("[%s] Row [%s] updated", table, key_desc)
                        updated_count += 1

                    except Exception as row_err:
                        logger.exception("[%s] Row [%s] failed: %s", table, key_desc, row_err)

                conn.commit()
                logger.info("[%s] Processed %d rows; committed.", table, updated_count)
                return updated_count

    except psycopg2.DatabaseError as db_err:
        logger.exception("[%s] Database error: %s", table, db_err)
        return 0


def update_decrypted_values():
    """Process decryption for all configured tables"""
    total_updated = 0
    for i, table_config in enumerate(CONFIG["tables"], 1):
        table_name = table_config["table"]
        logger.info("===== Processing table %d/%d: %s =====", i, len(CONFIG["tables"]), table_name)
        
        try:
            updated = update_decrypted_values_for_table(table_config)
            total_updated += updated
            logger.info("===== Completed table %s: %d rows updated =====", table_name, updated)
        except Exception as e:
            logger.exception("===== Failed to process table %s: %s =====", table_name, e)
    
    logger.info("===== SUMMARY: %d total rows updated across %d tables =====", total_updated, len(CONFIG["tables"]))


if __name__ == "__main__":
    logger.info("===== START multi-table decryption for %d tables =====", len(CONFIG["tables"]))
    update_decrypted_values()
    logger.info("===== FINISHED multi-table decryption ====")