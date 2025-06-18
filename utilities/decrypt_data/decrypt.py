import subprocess
import psycopg2
import json

# Configuration
CONFIG = {
    "db": {
        "host": "DB_hostname",
        "port": "DB_port_number",
        "dbname": "DB_name",
        "user": "DB_username",
        "password": "DB_password"
    },
    "table": "original_table",
    "columns": ["emailid", "mobilenumber", "username", "pan", "aadhaarnumber", "guardian", "name", "altcontactnumber"],  # List of encrypted columns
    "id_column": "id",
    "decryption_api_url": "http://localhost:8094/egov-enc-service/crypto/v1/_decrypt"
}

def decrypt_values(encrypted_dict):
    """
    Accepts a dictionary like {"emailid": "...", "mobilenumber": "..."} 
    and returns a dict with decrypted values using the API.
    """
    data = json.dumps([{k: v} for k, v in encrypted_dict.items() if v])
    cmd = [
        "curl", "--silent", "--location",
        CONFIG["decryption_api_url"],
        "--header", "Content-Type: application/json",
        "--data", data
    ]
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        response_list = json.loads(result.stdout)
        decrypted = {}
        for item in response_list:
            decrypted.update(item)
        return decrypted
    except Exception as e:
        print(f"Error during decryption: {e}")
        return {}

def update_decrypted_values():
    try:
        # Connect to DB
        conn = psycopg2.connect(
            host=CONFIG["db"]["host"],
            port=CONFIG["db"]["port"],
            dbname=CONFIG["db"]["dbname"],
            user=CONFIG["db"]["user"],
            password=CONFIG["db"]["password"]
        )
        cur = conn.cursor()

        # Build SELECT query for all columns + id
        select_columns = ", ".join([CONFIG["id_column"]] + CONFIG["columns"])
        cur.execute(f"SELECT {select_columns} FROM {CONFIG['table']}")
        rows = cur.fetchall()

        for row in rows:
            row_id = row[0]
            encrypted_data = dict(zip(CONFIG["columns"], row[1:]))

            if not any(encrypted_data.values()):
                continue

            decrypted_data = decrypt_values(encrypted_data)

            if decrypted_data:
                # Build SET clause dynamically
                set_clause = ", ".join([f"{col} = %s" for col in decrypted_data])
                update_query = f"""
                    UPDATE {CONFIG['table']}
                    SET {set_clause}
                    WHERE {CONFIG['id_column']} = %s
                """
                values = list(decrypted_data.values()) + [row_id]
                cur.execute(update_query, values)
                print(f"Updated ID {row_id}: {decrypted_data}")

        conn.commit()
        cur.close()
        conn.close()
        print("Decryption and update completed.")

    except Exception as db_err:
        print(f"Database error: {db_err}")

if __name__ == "__main__":
    update_decrypted_values()