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
    "table": "eg_mukta_ifms_disburse" + "_decpt",
    # Composite key columns instead of a single id
    "key_columns": ["id"],
    "columns": [
        "account_code"
    ],
    "decryption_api_url": "http://egov-enc-service.egov:8080/egov-enc-service/crypto/v1/_decrypt",
    "log_dir": "logs"
}

# ——— Prepare log directory & filename ——————————————————————————————
os.makedirs(CONFIG["log_dir"], exist_ok=True)
table_name = CONFIG["table"]
timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
log_filename = os.path.join(
    CONFIG["log_dir"],
    f"decryption_{table_name}_{timestamp}.log"
)

# ——— Logging Setup —————————————————————————————————————————————
logger = logging.getLogger(f"decryption_{table_name}")
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


def update_decrypted_values():
    key_cols = CONFIG["key_columns"]
    data_cols = CONFIG["columns"]
    table = CONFIG["table"]

    # Select both key columns + any non-null data columns
    select_cols_sql = ", ".join(key_cols + data_cols)
    where_data_not_null = " OR ".join(f"{c} IS NOT NULL" for c in data_cols)
    select_sql = f"SELECT {select_cols_sql} FROM {table} WHERE {where_data_not_null}"

    try:
        with psycopg2.connect(CONFIG["db"]["dsn"]) as conn:
            with conn.cursor(cursor_factory=DictCursor) as cur:
                logger.info("Fetching rows: %s", select_sql)
                cur.execute(select_sql)
                rows = cur.fetchall()
                logger.info("Found %d rows in `%s`", len(rows), table)

                for row in rows:
                    # Build composite key values
                    key_vals = {k: row[k] for k in key_cols}
                    key_desc = " & ".join(f"{k}={key_vals[k]!r}" for k in key_cols)

                    # Extract only the encrypted data columns
                    encrypted_data = {c: row[c] for c in data_cols}

                    logger.info("Processing row [%s]; encrypted cols: %s",
                                key_desc,
                                [c for c, v in encrypted_data.items() if v])

                    try:
                        decrypted = decrypt_values(encrypted_data)
                        if not decrypted:
                            logger.warning("Row [%s]: nothing decrypted, skipping", key_desc)
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
                        logger.info("Row [%s] updated", key_desc)

                    except Exception as row_err:
                        logger.exception("Row [%s] failed: %s", key_desc, row_err)

                conn.commit()
                logger.info("All rows processed; committed.")

    except psycopg2.DatabaseError as db_err:
        logger.exception("Database error: %s", db_err)


if __name__ == "__main__":
    logger.info("===== START decryption for `%s` =====", table_name)
    update_decrypted_values()
    logger.info("===== FINISHED decryption for `%s` =====", table_name)