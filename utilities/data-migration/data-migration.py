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

def get_request_info():
    return {
        "apiId": "Rainmaker",
        "ver": None,
        "ts": None,
        "action": None,
        "did": None,
        "key": None,
        "msgId": "1686748436982|en_IN",
        "authToken": None,
        "correlationId": "ad773f43-7b52-45fa-b690-d08044455f1a",
        "plainAccessRequest": {
            "recordId": None,
            "plainRequestFields": None
        },
        "userInfo": {
            "id": 435,
            "userName": "KEERTHI",
            "name": "Keerthi",
            "type": "EMPLOYEE",
            "mobileNumber": "9998887771",
            "emailId": None,
            "roles": [
                {
                    "id": None,
                    "name": "BILL_ACCOUNTANT",
                    "code": "BILL_ACCOUNTANT",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "WORK_ORDER_VIEWER",
                    "code": "WORK_ORDER_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "HRMS Admin",
                    "code": "HRMS_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "BILL_VERIFIER",
                    "code": "BILL_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "ESTIMATE VERIFIER",
                    "code": "ESTIMATE_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "WORK ORDER CREATOR",
                    "code": "WORK_ORDER_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "ESTIMATE APPROVER",
                    "code": "ESTIMATE_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "Organization viewer",
                    "code": "ORG_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "WORK ORDER VERIFIER",
                    "code": "WORK_ORDER_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "PROJECT VIEWER",
                    "code": "PROJECT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "BILL_APPROVER",
                    "code": "BILL_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "MUSTER ROLL VERIFIER",
                    "code": "MUSTER_ROLL_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "OFFICER IN CHARGE",
                    "code": "OFFICER_IN_CHARGE",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "Employee Common",
                    "code": "EMPLOYEE_COMMON",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "PROJECT CREATOR",
                    "code": "PROJECT_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "BILL_VIEWER",
                    "code": "BILL_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "TECHNICAL SANCTIONER",
                    "code": "TECHNICAL_SANCTIONER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "BILL_CREATOR",
                    "code": "BILL_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "MUSTER ROLL APPROVER",
                    "code": "MUSTER_ROLL_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "ESTIMATE VIEWER",
                    "code": "ESTIMATE_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "WORK ORDER APPROVER",
                    "code": "WORK_ORDER_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "ESTIMATE CREATOR",
                    "code": "ESTIMATE_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "id": None,
                    "name": "MUKTA Admin",
                    "code": "MUKTA_ADMIN",
                    "tenantId": "pg.citya"
                }
            ],
            "tenantId": "pg.citya",
            "uuid": "5ec3feaa-1148-4462-9842-2896c866c349"
        }
    }

def search_payment_instruction_from_ifms_adapter(id):
    try:
        ifms_service_host = os.getenv('IFMS_HOST')
        ifms_pi_search = os.getenv('IFMS_PI_SEARCH')
        
        api_url = f"{ifms_service_host}/{ifms_pi_search}"
        headers = {
            'Content-Type': 'application/json'
        }
        request = {
            "RequestInfo": get_request_info(),
            "searchCriteria": {
                "ids": [id],
                "limit": "10000",
                "offset": "0",
                "sortBy": "createdTime",
                "order": "ASC"
            }
        }
        response = requests.post(api_url, json=request, headers=headers)
        paymentInstructions = []
        if response.status_code == 200:
            response_data = response.json()
            # Assuming your response is stored in the variable 'response_data'
            paymentInstructions.extend(response_data.get('paymentInstructions', []))
        else:
            print(f"Failed to fetch data from the API. Status code: {response.status_code}")
            print(response.text)
        return paymentInstructions
    except Exception as e:
        print("search_payment_instruction_from_ifms_adapter : error {}".format(str(e)))
        raise e

def search_disburse_from_program_service(id, locaiton_code):
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
                "ids": [id],
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

def modify_disburse(disbursement, payment):
    disbursement['status'] = {
        'status_code': payment['piStatus'],
        'status_message': payment['piStatus']
    }
    if 'additionalDetails' in disbursement:
        disbursement['additionalDetails']['piStatus'] = payment['piStatus']
    
    for beneficiary in payment['beneficiaryDetails']:
        for child in disbursement['children']:
            if beneficiary['beneficiaryId'] == child['additionalDetails']['beneficiaryId']:
                child['additionalDetails']['beneficiaryStatus'] = beneficiary['paymentStatus']
                if beneficiary['paymentStatus'] == 'Payment Failed':
                    child['status']['status_code'] = 'FAILED'
                    child['status']['status_message'] = 'FAILED'
                elif beneficiary['paymentStatus'] == 'Payment Successful':
                    child['status']['status_code'] = 'SUCCESSFUL'
                    child['status']['status_message'] = 'SUCCESSFUL'
                elif beneficiary['paymentStatus'] == 'Payment In Process':
                    child['status']['status_code'] = 'INPROCESS'
                    child['status']['status_message'] = 'INPROCESS'
                elif beneficiary['paymentStatus'] == 'Payment Initiated':
                    child['status']['status_code'] = 'INITIATED'
                    child['status']['status_message'] = 'INITIATED'
                else:
                    child['status']['status_code'] = 'FAILED'
                    child['status']['status_message'] = 'FAILED'

    return disbursement

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

    ids = [
        "b98e9e9a-0ce2-4aa9-ba3c-c1abce6799b2",
        "082d3893-9a34-4ae0-bfc5-c464ae622696",
        "bc030664-2397-4edb-9821-d59bd73392ae",
        "ec681e60-2613-4122-a1a8-a785f48b07aa",
        "953347ac-a603-4550-b257-023056a611bb",
        "4d02e4de-e9e1-42e6-bca3-b810ba686712",
        "d71dc477-966d-426e-b878-cd0959947654",
        "fb0e97eb-8e23-432d-8330-6448b9242d74",
        "ee086a8e-ea4c-47af-b0d1-237e18cfd969",
        "9f5ea819-0fb4-4fb2-8c01-51e497714555",
        "de89c566-3562-4481-a8ae-20f70651ba01",
        "a4aff4e6-053e-492f-8a04-160b0c7e5870",
        "92e6a842-f491-4ed4-9c9a-20046ae2c322",
        "2eef14c6-155b-4ad1-a886-799979122c01",
        "3340e052-474c-4174-9694-39a7b0366965",
        "e3689a2f-48c3-431c-853f-7bbe8ce3bd0e",
        "224e13b9-ae41-4c7d-a837-0eb9dd7887d3",
        "40f4943b-dc28-4721-bb5c-30478dd3b59f",
        "b5eae7c3-05df-43b8-aa65-3ecb583dcb80",
        "23422679-2c29-4598-aa92-fdff739fe5e2",
        "fa57d100-f417-4df3-b0d3-af5b9953a619",
        "da56e7b5-bbf0-4213-bf05-354b56400bda",
        "118bfc9b-b71f-497b-b312-2adcc2e8377a",
        "abfe7a55-2ba3-4bf1-b1c8-ef9fa79d75c1",
        "9e4c388f-e630-494f-b5dc-f407eadfee67",
        "34718c2c-70ca-47b2-9d23-23eec488aa9b",
        "ef18d4cb-efeb-4eeb-9330-a1a8872e43b1",
        "ebf25eb9-5839-49ff-8ac6-f3ea022de50b",
        "adc95c3f-0322-4d5f-bed7-c62df18575f4",
        "bd9477b7-bdbb-4e9a-aef2-3f28b6f48644",
        "de78154b-005e-4627-98d0-b5030d7d6179",
        "ac56aa08-9e91-4e3c-a059-079a9b306991",
        "db771ab7-4283-47b3-b871-a3712ce63362",
        "63447c61-8021-4b4e-803e-292092110842",
        "ac55611e-f8c2-4a53-a29f-ac7823e9204e",
        "a95cb2f1-629a-41eb-8230-b00c78dfd3d9",
        "0824984b-c9a2-487a-b561-277efee2f491",
        "e01c0fb7-f240-47dd-bc06-48438540f1c5",
        "7bf0eb43-a0ce-42b9-97f7-d18b1efcc1d5",
        "a33056d4-9109-4b02-87d2-f6e1518e4dac",
        "e4a38612-f7e2-4de6-833a-a98468f25fc8",
        "525bd4d1-842b-41a6-b448-1a5a018257e7",
        "9dc0fe53-a70c-4dd4-9c21-8bc6e1882f5a",
        "e257b3a5-99c4-4a91-8052-7543e7216ab1",
        "1a213396-e702-47c7-8a7e-23b66a826c5f",
        "4d00bd72-be4e-41f6-b168-a8699adb8852",
        "62d2ae15-385c-4d5e-b120-94993e9a8abd",
        "37d1813f-d280-400c-9e18-8d3cd54426bd",
        "530050e4-bb45-4f08-9155-2f98fa91fff5",
        "262db5f5-73a6-44b8-ad89-ef4c33496e1e",
        "a8c4efb2-ebb3-4a01-8f92-8d31eaccd162",
        "03e0dda5-dca9-4751-b80d-51b0b8fcf4f9",
        "ff313d05-1262-44b4-8eea-b44bfea88bd0",
        "205a8dd4-5378-4e63-bba3-941979035c94",
        "db6a068a-9b06-47ef-b49e-811427962ccd",
        "5f6795a0-6a64-4cc4-8bc5-06614d839632",
        "ec46f6a6-883f-40cc-947f-5b2486a234f9",
        "3d710c4f-8408-4b97-9f21-4084456ed1a2",
        "21cff87e-e637-4e98-9d7d-d4148809299a",
        "8fbd7c82-6ebc-447d-92b4-e7330b6cda05",
        "fff55c11-ad8b-4232-a1c6-fb4a1065ee08",
        "69c2aa70-234b-4e35-af17-565908bde653",
        "ae05707f-5648-44ce-ac46-06f96740f680",
        "6e0e1fb1-7f13-45cb-a1be-386f2ab83e75",
        "0f61388c-9503-43a7-9f50-65bab4a214ea",
        "41325882-c221-42b9-b48a-fbbdda838557",
        "4e84bc6b-1d97-4b6c-8f94-cd61cfd240de",
        "fcecb2c7-6257-4662-befb-a59c6d72ebd5",
        "bf3eb4ce-e581-45e7-9e13-721ba075d84b",
        "300eeb38-0725-40e7-b2c8-76fa44a45bf0",
        "a80e0d63-54cf-49a7-9e06-b3b398a7d818",
        "47a6a65d-5178-4b13-a863-59915c2099f0",
        "07775cf5-e6e9-4ca9-ae7f-8b7931a1cef6",
        "7217eae6-d05f-4960-9607-5d394f6a8129",
        "77fb4201-c579-47a7-b892-da73f0aece58",
        "c21688b2-c376-40c2-95f0-8b1338ae4553",
        "8b155250-bbf3-45ae-b762-efe596789a2b",
        "aff34fc2-bf19-45c3-a69f-9800f1fd912e",
        "f2bc192f-6598-4224-84d6-46e187f54a10",
        "f7640e32-395d-4d02-ac4e-e438a9e73527",
        "5ba6bc92-4471-4989-a3b0-d24765f9ce05",
        "8d6aec24-61eb-406d-ba45-c875a62919f9",
        "17974b01-7b47-489c-8ce6-0f70e49bc78a",
        "6c29a890-762d-411d-a0c3-1523395607e7",
        "6277b5f6-e9ca-4ac9-9a0b-926d02683bf7",
        "071afd61-fced-4cb6-a085-a4f338e9f085",
        "3a620694-a645-40b5-97a7-2f5012d2ad97",
        "be693c48-5ef1-4564-8d89-5026bcd97de6",
        "7677e757-0371-4247-9833-fbf7be2a7e1c",
        "1296692d-62c8-4b7c-bb4b-4b06057c228c",
        "aff14000-116c-4845-b963-a9a3c3c89c04",
        "ba0ccf92-785b-48b1-bd2b-6f184596049a",
        "cecf628d-3ee3-483d-840f-73bd89dc9e0e",
        "63edd1b7-3e9d-4253-862f-f9efbb15cd36",
        "042c4ff6-a34d-4662-bd4a-89a8ba57f3c2",
        "ad5df9ff-14ef-4538-87dd-0d0ae46e838a",
        "8ef55728-5c7f-4f10-ad40-d07c00ca5c18",
        "6ce788b7-16ca-4568-b3e1-b936b6468091",
        "4f869d7f-784f-4edc-9b28-9a5c0ce95a46",
        "3e977032-a8b7-4ab1-ad9e-9e7588ac7f05",
        "f8025575-2717-478a-8fbe-e55d77b56a96",
        "c63d9f51-89d3-4a5a-87eb-bb4414672e89",
        "43c48a7a-041d-4462-9c36-ab02e5990a97"
        ]

    for id in ids:
        payments = search_payment_instruction_from_ifms_adapter(id)
        payment = payments[0]
        if payment:
            tenantid = payment.get('tenantId')
            disbursement = search_disburse_from_program_service(id, tenantid)
            if disbursement:
                disburse = modify_disburse(disbursement, payment)
                if disburse:
                    call_on_disburse_update_api(disburse)
            else:
                print(f"Disbursement not found for: {id}")
    print("Data migration finished")

if __name__ == '__main__':
    try:
        data_correction() 

    except Exception as ex:
        logging.error("Exception occured on main.", exc_info=True)
        raise(ex)