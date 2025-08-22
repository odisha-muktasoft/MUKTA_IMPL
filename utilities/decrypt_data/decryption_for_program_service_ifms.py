'''
    This script will be used for decryption of program service related database, 
    because they are not using encryption service so call the search api and do the decryption

    Run this twice Mukta program service, iFix program service
'''

import os
import time
import uuid
import logging
import requests
import psycopg2
from datetime import datetime
from psycopg2.extras import Json, DictCursor

# ——— Configuration ——————————————————————————————————————————————
CONFIG = {
    "db": {
        "dsn": ""
    },
    "table": "ifix.eg_program_disburse" + "_decpt",
    "api_url": "http://program-service.ifix:8080/ifms/program-service/v1/disburse/_search",
    "log_dir": "logs"
}

# ——— Prepare log directory & filename ——————————————————————————————
os.makedirs(CONFIG["log_dir"], exist_ok=True)
ts = datetime.now().strftime("%Y%m%d_%H%M%S")
logfile = os.path.join(CONFIG["log_dir"],
                       f"migrate_{CONFIG['table']}_{ts}.log")

logger = logging.getLogger("program_disburse_migrator")
logger.setLevel(logging.INFO)
fmt = logging.Formatter("%(asctime)s %(levelname)-8s %(message)s")
ch = logging.StreamHandler();   ch.setFormatter(fmt); logger.addHandler(ch)
fh = logging.FileHandler(logfile); fh.setFormatter(fmt); logger.addHandler(fh)


def call_disburse_search(parent_id: str, location_code: str) -> dict:
    """
    Calls the disburse/_search API for a single parent.
    Returns parsed JSON.
    """
    header = {
        "message_id": str(uuid.uuid4()),
        "message_ts": int(time.time()),
        "message_type": "disburse",
        "action": "search",
        "sender_id": "ifms@mukta",
        "receiver_id": "ifms@mukta"
    }
    payload = {
        "signature": None,
        "header": header,
        "message": {
            "ids": [parent_id],
            "location_code": location_code
        }
    }
    logger.info("Calling API for parent %s @ %s", parent_id, location_code)
    resp = requests.post(
        CONFIG["api_url"],
        json=payload,
        headers={"Content-Type": "application/json"},
        timeout=15
    )
    resp.raise_for_status()
    return resp.json()


def migrate_children(conn, children: list):
    """
    Given a list of child-disbursement dicts, update each in the DB.
    """
    table = CONFIG["table"]
    with conn.cursor() as cur:
        for child in children:
            cid = child.get("id")
            acct = child.get("account_code")
            indiv = child.get("individual")
            # build and execute the UPDATE
            sql = f"""
              UPDATE {table}
                 SET account_code = %s,
                     individual   = %s
               WHERE id = %s
            """
            cur.execute(sql, [acct, Json(indiv), cid])
            logger.info("  ➔ Updated child %s: account_code=%r", cid, acct)
        conn.commit()


def run_migration():
    table = CONFIG["table"]
    select_sql = f"""
      SELECT id,
             location_code
        FROM {table}
       WHERE parent_id IS NULL
    """

    with psycopg2.connect(CONFIG["db"]["dsn"]) as conn:
        with conn.cursor(cursor_factory=DictCursor) as cur:
            logger.info("Fetching parent rows: %s", select_sql.strip())
            cur.execute(select_sql)
            parents = cur.fetchall()
            logger.info("Found %d parent rows to process.", len(parents))

            for row in parents:
                pid = row["id"]
                loc = row["location_code"]
                try:
                    data = call_disburse_search(pid, loc)
                    # Response JSON has 'disbursements': [ { ..., children: [...] } ]
                    disbs = data.get("disbursements", [])
                    # find the matching parent entry
                    for d in disbs:
                        if d.get("id") == pid:
                            children = d.get("children") or []
                            logger.info(" Parent %s has %d children", pid, len(children))
                            if children:
                                migrate_children(conn, children)
                            break
                except Exception as e:
                    logger.exception("Failed processing parent %s: %s", pid, e)

    logger.info("=== Migration complete ===")


if __name__ == "__main__":
    logger.info("=== STARTING migration for `%s` ===", CONFIG["table"])
    run_migration()
    logger.info("=== FINISHED migration for `%s` ===", CONFIG["table"])