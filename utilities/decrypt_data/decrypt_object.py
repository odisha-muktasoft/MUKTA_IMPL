'''
This is for mukta ifix adapter service table where individual details are encrypted using encryption service
table names which will get decrypted using this script is 

*   eg_mukta_ifms_disburse_decpt

'''

import os
import json
import logging
import requests
import psycopg2
from psycopg2.extras import DictCursor, Json
from psycopg2 import sql
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
        logger.debug("Empty payload provided for decryption")
        return {}

    logger.debug("Attempting to decrypt %d fields: %s", len(payload), list(payload.keys()))
    logger.debug("API URL: %s", CONFIG["decryption_api_url"])

    try:
        # Log the request payload (without showing sensitive data)
        logger.debug("Sending decrypt request with %d encrypted fields", len(payload))
        
        resp = requests.post(
            CONFIG["decryption_api_url"],
            json=[payload],            # API expects a list of dicts
            headers={"Content-Type": "application/json"},
            timeout=10
        )
        
        logger.debug("Decrypt API response status: %d", resp.status_code)
        resp.raise_for_status()
        
        result = resp.json()           # e.g. [ {key1: plain1}, {key2: plain2} ]
        logger.debug("Decrypt API returned %d result entries", len(result))
        
        out = {}
        for entry in result:
            out.update(entry)
        
        logger.info("Successfully decrypted %d fields: %s", len(out), list(out.keys()))
        return out

    except requests.exceptions.Timeout as e:
        logger.error("Decrypt API timeout after 10s for fields %s: %s", list(payload.keys()), e)
        return {}
    except requests.exceptions.RequestException as e:
        logger.error("Decrypt API request error for fields %s: %s", list(payload.keys()), e)
        return {}
    except json.JSONDecodeError as e:
        logger.error("Decrypt API returned invalid JSON for fields %s: %s", list(payload.keys()), e)
        return {}
    except Exception as e:
        logger.error("Unexpected decrypt API error for fields %s: %s", list(payload.keys()), e)
        return {}


def migrate_jsonb():
    table = CONFIG["table"]
    id_col = CONFIG["id_column"]
    jcol   = CONFIG["json_column"]

    select_sql = sql.SQL("SELECT {id_col}, {jcol} FROM {table} WHERE {jcol} IS NOT NULL FOR UPDATE SKIP LOCKED").format(
        id_col=sql.Identifier(id_col),
        jcol=sql.Identifier(jcol),
        table=sql.Identifier(table)
    )

    with psycopg2.connect(CONFIG["db"]["dsn"]) as conn:
        # Avoid waiting forever on locks / long queries
        with conn.cursor() as _c:
            _c.execute("SET SESSION lock_timeout = '5s';")
            _c.execute("SET SESSION statement_timeout = '60s';")
        with conn.cursor(cursor_factory=DictCursor) as cur:
            logger.info("Querying JSON rows: %s", select_sql)
            cur.execute(select_sql)
            rows = cur.fetchall()
            logger.info("Found %d rows with JSONB data", len(rows))

            for row in rows:
                logger.info("Processing row %s", row[id_col])
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
                update_sql = sql.SQL("UPDATE {table} SET {jcol} = %s WHERE {id_col} = %s").format(
                    table=sql.Identifier(table),
                    jcol=sql.Identifier(jcol),
                    id_col=sql.Identifier(id_col)
                )
                try:
                    cur.execute(
                        update_sql,
                        [
                            Json(data, dumps=lambda d: json.dumps(d, ensure_ascii=True, default=str)),
                            pk,
                        ],
                    )
                except Exception as e:
                    logger.error("Row %s: update failed (will skip): %s", pk, e)
                    conn.rollback()
                    continue
                logger.info("Row %s: JSON decrypted and updated keys %s", pk, list(decrypted))

            conn.commit()
            logger.info("All rows processed and committed.")


if __name__ == "__main__":
    logger.info("=== START JSONB decryption/migration ===")
    migrate_jsonb()
    logger.info("=== DONE ===")