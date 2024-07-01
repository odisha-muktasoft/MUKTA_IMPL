import csv
import pandas as pd
from numpy import *
import requests
import json
from dateutil import parser
import datetime as dt
import psycopg2
import logging
import calendar
import time
import os
import pytz
import pytz
from datetime import datetime
import re
from dotenv import load_dotenv

load_dotenv('.env')

DB_HOST = os.getenv('DB_HOST')
DB_PORT = os.getenv('DB_PORT')
DB_NAME = os.getenv('DB_NAME')
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')

# Connect to PostgreSQL
def connect_to_database():
    return psycopg2.connect(
        host=DB_HOST, port=DB_PORT, database=DB_NAME, user=DB_USER, password=DB_PASSWORD
    )

def search_disburse_from_program_service(payment_number, locaiton_code):
    try:
        program_service_host = os.getenv('PROGRAM_SERVICE_HOST')
        program_disburse_search = os.getenv('PROGRAM_DISBURSE_SEARCH')

        api_url = f"{program_service_host}/{program_disburse_search}"
        headers = {
            'Content-Type': 'application/json'
        }
        request = {
            "signature": None,
            "header": {
                "message_id": "123",
                "message_ts": "1708428280",
                "message_type": "disburse",
                "action": "search",
                "sender_id": os.getenv('PROGRAM_DISBURSE_UPDATE_SENDER_ID'),
                "receiver_id": os.getenv('PROGRAM_DISBURSE_UPDATE_RECEIVER_ID')
            },
            "message": {
                "location_code": locaiton_code,
                "target_id": payment_number,
                "pagination": {
                    "limit": 100,
                    "offset": 0
                }
            }
        }

        response = requests.post(api_url, json=request, headers=headers)
        disbursements = []
        if response.status_code == 200:
            response_data = response.json()
            # Assuming your response is stored in the variable 'response_data'
            disbursements.extend(response_data.get('disbursements', []))
        else:
            print(f"Failed to fetch data from the API. Status code: {response.status_code}")
            print(response.text)
        return disbursements
    except Exception as e:
        print("search_disburse_from_program_service : error {}".format(str(e)))
        raise e

def call_on_disburse_update_api(disburse):
    try:
        program_service_host = os.getenv('PROGRAM_SERVICE_HOST')
        program_disburse_update = os.getenv('PROGRAM_ON_DISBURSE_CREATE')

        api_url = f"{program_service_host}/{program_disburse_update}"
        headers = {
            'Content-Type': 'application/json'
        }
        request = {
            "signature": None,
            "header": {
                "message_id": disburse['id'],
                "message_ts": "1708428280",
                "message_type": "on-disburse",
                "action": "create",
                "sender_id": os.getenv('PROGRAM_DISBURSE_UPDATE_SENDER_ID'),
                "receiver_id": os.getenv('PROGRAM_DISBURSE_UPDATE_RECEIVER_ID')
            },
            "message": disburse
        }

        response = requests.post(api_url, json=request, headers=headers)
        if response.status_code == 200:
            print(f"Disbursement updated for payment number: {disburse['target_id']}")
        else:
            print(f"Failed to update disburse for {disburse['target_id']} from the API. Status code: {response.status_code}")
            print(response.text)
    except Exception as e:
        print("search_disburse_from_program_service : error {}".format(str(e)))
        raise e


def data_correction():
    print("Data correction started")

    # connect to postgreSQL
    connection = connect_to_database()
    cursor = connection.cursor()
    query = """select jp.tenantid, jp.muktareferenceid from eg_mukta_ifms_disburse as md inner join jit_payment_inst_details as jp on md.id = jp.id where md.status != jp.pistatus order by jp.pistatus;"""
    cursor.execute(query)

    results = cursor.fetchall()
    for row in results:
        # print(row)
        tenantid = row[0]
        muktareferenceid = row[1]
        disbursement = search_disburse_from_program_service(muktareferenceid, tenantid)

        if disbursement:
            call_on_disburse_update_api(disbursement[0])

    cursor.close()
    connection.close()

    print("Data correction finished")


if __name__ == '__main__':
    try:
        data_correction() 

    except Exception as ex:
        logging.error("Exception occured on main.", exc_info=True)
        raise(ex)