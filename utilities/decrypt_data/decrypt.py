import logging
import requests
import psycopg2
from psycopg2.extras import DictCursor
from datetime import datetime
import os

# ——— Configuration ——————————————————————————————————————————————
CONFIG = {
    "db": {
        "dsn": ""
    },
    "table": "eg_user_audit_table" + "_decpt",
    "columns": [
        "username",
        "mobilenumber",
        "emailid",
        "name"
    ],
    "id_column": "id",
    "decryption_api_url": "http://egov-enc-service.egov:8080/egov-enc-service/crypto/v1/_decrypt",
    # optional: where to store your logs
    "log_dir": "logs"
}

# ——— Prepare rotating log directory & filename —————————————————————
os.makedirs(CONFIG["log_dir"], exist_ok=True)
table_name = CONFIG["table"]
timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
log_filename = os.path.join(
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

# File handler (per table + timestamp)
fh = logging.FileHandler(log_filename, mode="a")
fh.setFormatter(formatter)
logger.addHandler(fh)


def decrypt_values(encrypted_fields: dict) -> dict:
    """
    Send only non‐empty fields to the decrypt API,
    return a dict of decrypted values.
    """
    to_send = {
        k: v
        for k, v in encrypted_fields.items()
        if v is not None and str(v).strip()
    }
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
        logger.info("Decrypted for payload: %s → %s", to_send, decrypted)
        return decrypted

    except requests.RequestException as e:
        logger.error("Decryption API error for payload %s: %s", to_send, e)
        return {}


def update_decrypted_values():
    cols = CONFIG["columns"]
    id_col = CONFIG["id_column"]
    table = CONFIG["table"]

    where_clause = " OR ".join(f"{col} IS NOT NULL" for col in cols)
    select_cols = ", ".join([id_col] + cols)
    select_sql = f"SELECT {select_cols} FROM {table} WHERE {where_clause}"

    try:
        with psycopg2.connect(CONFIG["db"]["dsn"]) as conn:
            with conn.cursor(cursor_factory=DictCursor) as cur:
                logger.info("Fetching rows with: %s", select_sql)
                cur.execute(select_sql)
                rows = cur.fetchall()
                logger.info("Found %d rows in table `%s`", len(rows), table)

                for row in rows:
                    row_id = row[id_col]
                    encrypted_data = {col: row[col] for col in cols}

                    logger.info("Row %s: contains encrypted columns %s",
                                row_id,
                                [k for k, v in encrypted_data.items() if v])

                    try:
                        decrypted = decrypt_values(encrypted_data)
                        if not decrypted:
                            logger.warning("Row %s: nothing decrypted, skipping", row_id)
                            continue

                        # Build UPDATE...
                        set_clauses, params = [], []
                        for cname, cval in decrypted.items():
                            set_clauses.append(f"{cname} = %s")
                            params.append(cval)
                        params.append(row_id)

                        update_sql = (
                            f"UPDATE {table}\n"
                            f"   SET {', '.join(set_clauses)}\n"
                            f" WHERE {id_col} = %s"
                        )
                        cur.execute(update_sql, params)
                        logger.info("Row %s updated successfully", row_id)

                    except Exception as row_err:
                        logger.exception("Row %s: failed to decrypt/update: %s", row_id, row_err)

                conn.commit()
                logger.info("All rows processed; committed changes.")

    except psycopg2.DatabaseError as db_err:
        logger.exception("Database-level error: %s", db_err)


if __name__ == "__main__":
    logger.info("===== STARTING decryption for table `%s` =====", table_name)
    update_decrypted_values()
    logger.info("===== FINISHED decryption for table `%s` =====", table_name)