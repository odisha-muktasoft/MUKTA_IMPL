import os
import json
import logging
import requests
import psycopg2
from psycopg2.extras import DictCursor, Json
from datetime import datetime

# ——— Configuration ——————————————————————————————————————————————
CONFIG = {
    "db": {
        "dsn": ""
    },
    "table": "eg_mukta_ifms_disburse" + "_decpt",   # <-- replace with your actual table
    "id_column": "id",            # <-- primary key column
    "json_column": "individual",  # <-- name of the JSONB column
    "decryption_api_url": "http://egov-enc-service.egov:8080/egov-enc-service/crypto/v1/_decrypt",
    "log_dir": "logs"
}

# ——— Prepare log file ——————————————————————————————————————————————
os.makedirs(CONFIG["log_dir"], exist_ok=True)
ts = datetime.now().strftime("%Y%m%d_%H%M%S")
logfile = os.path.join(CONFIG["log_dir"], f"decrypt_json_{ts}.log")

logger = logging.getLogger("decrypt_json")
logger.setLevel(logging.INFO)
fmt = logging.Formatter("%(asctime)s %(levelname)-8s %(message)s")
ch = logging.StreamHandler(); ch.setFormatter(fmt); logger.addHandler(ch)
fh = logging.FileHandler(logfile); fh.setFormatter(fmt); logger.addHandler(fh)


def decrypt_values(payload: dict) -> dict:
    """
    payload: { key1: encrypted_str1, key2: encrypted_str2, … }
    returns: { key1: plain1, key2: plain2, … }
    """
    if not payload:
        return {}

    try:
        resp = requests.post(
            CONFIG["decryption_api_url"],
            json=[payload],            # API expects a list of dicts
            headers={"Content-Type": "application/json"},
            timeout=10
        )
        resp.raise_for_status()
        result = resp.json()           # e.g. [ {key1: plain1}, {key2: plain2} ]
        out = {}
        for entry in result:
            out.update(entry)
        return out

    except Exception as e:
        logger.error("Decrypt API error for %r: %s", payload, e)
        return {}


def migrate_jsonb():
    table = CONFIG["table"]
    id_col = CONFIG["id_column"]
    jcol   = CONFIG["json_column"]

    select_sql = f"SELECT {id_col}, {jcol} FROM {table} WHERE {jcol} IS NOT NULL"

    with psycopg2.connect(CONFIG["db"]["dsn"]) as conn:
        with conn.cursor(cursor_factory=DictCursor) as cur:
            logger.info("Querying JSON rows: %s", select_sql)
            cur.execute(select_sql)
            rows = cur.fetchall()
            logger.info("Found %d rows with JSONB data", len(rows))

            for row in rows:
                pk = row[id_col]
                data = row[jcol] or {}
                if not isinstance(data, dict):
                    logger.warning("Row %s: JSON in unexpected format: %r", pk, data)
                    continue

                # pick out only the encrypted values (e.g. look for '|')
                encrypted_fields = {
                    k: v
                    for k, v in data.items()
                    if isinstance(v, str) and "|" in v
                }
                if not encrypted_fields:
                    logger.info("Row %s: no encrypted keys found, skipping", pk)
                    continue

                decrypted = decrypt_values(encrypted_fields)
                if not decrypted:
                    logger.error("Row %s: decryption failed, skipping update", pk)
                    continue

                # merge decrypted back into the JSON
                for k, plain in decrypted.items():
                    data[k] = plain

                # write back the JSONB
                update_sql = f"UPDATE {table} SET {jcol} = %s WHERE {id_col} = %s"
                cur.execute(update_sql, [Json(data), pk])
                logger.info("Row %s: JSON decrypted and updated keys %s", pk, list(decrypted))

            conn.commit()
            logger.info("All rows processed and committed.")


if __name__ == "__main__":
    logger.info("=== START JSONB decryption/migration ===")
    migrate_jsonb()
    logger.info("=== DONE ===")