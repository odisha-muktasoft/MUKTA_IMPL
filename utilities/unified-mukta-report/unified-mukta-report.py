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


tenantids = ["od.jatni","od.athagarh"]
estimateHost = "http://localhost:8082"
processInstanceHost = "http://localhost:8083"
expenseCalculatorHost =  "http://localhost:8085"
wmsHost = "http://localhost:9085"
mdmsHost = "http://localhost:8019"
piSearchHost = "http://localhost:8086"
expenseHost = "http://localhost:8087"
musterRollHost = "http://localhost:8091"
projectHost = "http://localhost:8081"
contractHost = "http://localhost:8084"
individualHost = "http://localhost:8093"



def convert_epoch_to_indian_time(epoch_time):
    # Convert epoch time to seconds
    epoch_time_seconds = epoch_time / 1000
    
    # Define the timezone for India
    india_tz = pytz.timezone('Asia/Kolkata')
    
    # Convert epoch time to datetime object
    dt = datetime.fromtimestamp(epoch_time_seconds, tz=india_tz)
    
    # Format the datetime object to "dd-mm-yyyy"
    formatted_time = dt.strftime('%d-%m-%Y')
    
    return formatted_time



def getWorkOrderData():
    data = []
    print("Getting WorkOrder Data")
    try:
        for tenantid in tenantids:
            print(tenantid)
            host = contractHost + "/contract/v1/_search"
            request_payload = {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}
            headers = {"Content-Type": "application/json"}
            api_limit = 100
            api_offset = 0
            while True:
                api_payload = {"tenantId": tenantid,"pagination": {"limit": api_limit,"offSet": api_offset},"RequestInfo": request_payload}
                response = requests.post(host,headers=headers,data=json.dumps(api_payload))
                api_offset = api_offset + api_limit
                if response and response.status_code and response.status_code in [200, 202]:
                    response = response.json()
                    if response and response['contracts'] and len(response['contracts'])>0:
                        for contract in response['contracts']:
                            temp = {}
                            temp['ULB'] = tenantid
                            temp['projectId'] = contract['additionalDetails']['projectId']
                            temp['CBO'] = contract['additionalDetails']['cboName']
                            temp['creation_Date'] = convert_epoch_to_indian_time(contract['auditDetails']['createdTime'])
                            temp['WorkOrderId'] = contract['contractNumber']
                            temp['wfStatus'] = contract['wfStatus']
                            temp['last_Modified_Date'] = convert_epoch_to_indian_time(contract['auditDetails']['lastModifiedTime'])
                            temp['valueOfWorkOrder'] = contract['totalContractedAmount']
                            data.append(temp)
                    else:
                        break
                else:
                    break
        return data
    except Exception as e:
        raise e


def getProjectData():
    data = []
    print("Getting Project Data")
    try:
        for tenantid in tenantids:
            print(tenantid)
            api_limit = 100
            api_offset = 0
            while True:
                host = projectHost + "/project/v1/_search?tenantId=" + tenantid + "&limit=" + str(api_limit) + "&offset=" + str(api_offset) + "&createdFrom=1680307200000"  # "&limit=1000&offset=0&createdFrom=1680307200000" 
                request_payload = {"apiId": "Rainmaker", "authToken": "e091dbec-959c-4268-ad07-ff6c8793a61a", "userInfo": {"id": 4747, "uuid": "71d23f7e-30c9-4ba4-b81b-e1862cd3fd9d", "userName": "SUPERUSERA", "name": "SUPERUSERA", "mobileNumber": "9000000006", "type": "EMPLOYEE", "roles": [{"name": "BILL_ACCOUNTANT", "code": "BILL_ACCOUNTANT", "tenantId": "pg.citya"}, {"name": "WORK ORDER VIEWER", "code": "WORK_ORDER_VIEWER", "tenantId": "pg.citya"}, {"name": "BILL_VERIFIER", "code": "BILL_VERIFIER", "tenantId": "pg.citya"}, {"name": "ESTIMATE VERIFIER", "code": "ESTIMATE_VERIFIER", "tenantId": "pg.citya"}, {"name": "OFFICER IN CHARGE", "code": "OFFICER_IN_CHARGE", "tenantId": "pg.citya"}, {"name": "PROJECT CREATOR", "code": "PROJECT_CREATOR", "tenantId": "pg.citya"}, {"name": "BILL_CREATOR", "code": "BILL_CREATOR", "tenantId": "pg.citya"}, {"name": "ESTIMATE VIEWER", "code": "ESTIMATE_VIEWER", "tenantId": "pg.citya"}, {"name": "MB_APPROVER", "code": "MB_APPROVER", "tenantId": "pg.citya"}, {"name": "MUKTA Admin", "code": "MUKTA_ADMIN", "tenantId": "pg.citya"}, {"name": "WORK ORDER CREATOR", "code": "WORK_ORDER_CREATOR", "tenantId": "pg.citya"}, {"name": "ESTIMATE APPROVER", "code": "ESTIMATE_APPROVER", "tenantId": "pg.citya"}, {"name": "MB_VERIFIER", "code": "MB_VERIFIER", "tenantId": "pg.citya"}, {"name": "WORK ORDER VERIFIER", "code": "WORK_ORDER_VERIFIER", "tenantId": "pg.citya"}, {"name": "MB_CREATOR", "code": "MB_CREATOR", "tenantId": "pg.citya"}, {"name": "PROJECT VIEWER", "code": "PROJECT_VIEWER", "tenantId": "pg.citya"}, {"name": "BILL_APPROVER", "code": "BILL_APPROVER", "tenantId": "pg.citya"}, {"name": "MUSTER ROLL VERIFIER", "code": "MUSTER_ROLL_VERIFIER", "tenantId": "pg.citya"}, {"name": "Employee Common", "code": "EMPLOYEE_COMMON", "tenantId": "pg.citya"}, {"name": "BILL_VIEWER", "code": "BILL_VIEWER", "tenantId": "pg.citya"}, {"name": "TECHNICAL SANCTIONER", "code": "TECHNICAL_SANCTIONER", "tenantId": "pg.citya"}, {"name": "MUSTER ROLL APPROVER", "code": "MUSTER_ROLL_APPROVER", "tenantId": "pg.citya"}, {"name": "WORK ORDER APPROVER", "code": "WORK_ORDER_APPROVER", "tenantId": "pg.citya"}, {"name": "ESTIMATE CREATOR", "code": "ESTIMATE_CREATOR", "tenantId": "pg.citya"}, {"name": "MB_VIEWER", "code": "MB_VIEWER", "tenantId": "pg.citya"}, {"name": "State Dashboard Admin", "code": "STADMIN", "tenantId": "pg.citya"}, {"name": "SUPER USER", "code": "SUPERUSER", "tenantId": "pg.citya"}], "tenantId": "pg.citya",}, "msgId": "1712148865295|en_IN", "plainAccessRequest": {}}
                headers = {"Content-Type": "application/json"}
                api_payload = {"Projects": [{"tenantId": tenantid,"createdFrom": 1680307200000}],"pagination": {"limit": api_limit,"offSet": api_offset},"RequestInfo": request_payload}
                response = requests.post(host,headers=headers,data=json.dumps(api_payload))
                api_offset = api_offset + api_limit
                print(api_offset)
                if response.status_code in [200, 202]:
                    response = response.json()
                    if response and response["Project"] and len(response["Project"])>0:
                        for project in response["Project"]: 
                            temp = {}
                            temp['ULB'] = project['tenantId']
                            temp['projectid'] = project['projectNumber']
                            data.append(temp)
                    else:
                        break        
                else:
                    break
        return data
    except Exception as e:
        raise e

def getBillData():
    data = []
    print("Getting Bill Data")
    try:
        for tenantid in tenantids:
            print(tenantid)
            host = expenseHost + "/expense/bill/v1/_search"
            request_payload = {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}
            headers = {"Content-Type": "application/json"}
            api_limit = 100
            api_offset = 0
            while True:
                api_payload = {"billCriteria": {"tenantId": tenantid, "isPaymentStatusNull": "false"},"pagination": {"limit": api_limit,"offSet": api_offset},"RequestInfo": request_payload}
                response = requests.post(host,headers=headers,data=json.dumps(api_payload))
                api_offset = api_offset + api_limit
                if response and response.status_code and response.status_code in [200, 202]:
                    response = response.json()
                    if response and response['bills'] and len(response['bills'])>0:
                        for bill in response['bills']:
                            temp = {}
                            temp['ULB'] = tenantid
                            temp['projectId'] = bill['additionalDetails']['projectId']
                            temp['billId'] = bill['billNumber']
                            temp['billType'] = bill['businessService']
                            temp['musterRollNumber'] = "NA"
                            if bill['businessService'] == "EXPENSE.WAGES":
                                temp['musterRollNumber'] = bill['billDetails'][0]['referenceId']
                            temp['billAmount'] = bill['totalAmount']
                            temp['creation_Date'] = convert_epoch_to_indian_time(bill['auditDetails']['createdTime'])
                            temp['wfStatus'] = bill['wfStatus']
                            temp['last_Modified_Date'] = convert_epoch_to_indian_time(bill['auditDetails']['lastModifiedTime'])
                            data.append(temp)
                    else:
                        break
                else:
                    break
        return data
    except Exception as e:
        raise e
    

def getMusterRollData():
    data = []
    print("Getting MusterRoll Data")
    try:
        for tenantid in tenantids:
            print(tenantid)
            api_limit = 100
            api_offset = 0
            while True:
                host = musterRollHost + "/muster-roll/v1/_search" + "?tenantId=" + tenantid + "&limit=" + str(api_limit) + "&offset=" + str(api_offset)
                request_payload = {"apiId": "Rainmaker", "authToken": "b09a28f2-3bb4-4c9b-9731-b1cbd98d9018", "userInfo": {"id": 271, "uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11", "userName": "MUKTAUAT", "name": "MUKTAUAT", "mobileNumber": "9036774122", "type": "EMPLOYEE", "roles": [{"name": "ESTIMATE APPROVER", "code": "ESTIMATE_APPROVER", "tenantId": "od.testing"}, {"name": "WORK ORDER CREATOR", "code": "WORK_ORDER_CREATOR", "tenantId": "od.testing"}, {"name": "Organization viewer", "code": "ORG_VIEWER", "tenantId": "od.testing"}, {"name": "MB_VERIFIER", "code": "MB_VERIFIER", "tenantId": "od.testing"}, {"name": "ESTIMATE CREATOR", "code": "ESTIMATE_CREATOR", "tenantId": "od.testing"}, {"name": "MDMS Admin", "code": "MDMS_ADMIN", "tenantId": "od.testing"}, {"name": "MB_VIEWER", "code": "MB_VIEWER", "tenantId": "od.testing"}, {"name": "State Dashboard Admin", "code": "STADMIN", "tenantId": "od.testing"}, {"name": "MUKTA Admin", "code": "MUKTA_ADMIN", "tenantId": "od.testing"}, {"name": "Employee Common", "code": "EMPLOYEE_COMMON", "tenantId": "od.testing"}, {"name": "TECHNICAL SANCTIONER", "code": "TECHNICAL_SANCTIONER", "tenantId": "od.testing"}, {"name": "BILL_CREATOR", "code": "BILL_CREATOR", "tenantId": "od.testing"}, {"name": "BILL_ACCOUNTANT", "code": "BILL_ACCOUNTANT", "tenantId": "od.testing"}, {"name": "WORK_ORDER_VIEWER", "code": "WORK_ORDER_VIEWER", "tenantId": "od.testing"}, {"name": "BILL_VERIFIER", "code": "BILL_VERIFIER", "tenantId": "od.testing"}, {"name": "ESTIMATE VERIFIER", "code": "ESTIMATE_VERIFIER", "tenantId": "od.testing"}, {"name": "MUSTER ROLL APPROVER", "code": "MUSTER_ROLL_APPROVER", "tenantId": "od.testing"}, {"name": "ESTIMATE VIEWER", "code": "ESTIMATE_VIEWER", "tenantId": "od.testing"}, {"name": "WORK ORDER APPROVER", "code": "WORK_ORDER_APPROVER", "tenantId": "od.testing"}, {"name": "MB_APPROVER", "code": "MB_APPROVER", "tenantId": "od.testing"}, {"name": "MDMS CITY ADMIN", "code": "MDMS_CITY_ADMIN", "tenantId": "od.testing"}, {"name": "OFFICER IN CHARGE", "code": "OFFICER_IN_CHARGE", "tenantId": "od.testing"}, {"name": "PROJECT CREATOR", "code": "PROJECT_CREATOR", "tenantId": "od.testing"}, {"name": "BILL_VIEWER", "code": "BILL_VIEWER", "tenantId": "od.testing"}, {"name": "WORK ORDER VERIFIER", "code": "WORK_ORDER_VERIFIER", "tenantId": "od.testing"}, {"name": "PROJECT VIEWER", "code": "PROJECT_VIEWER", "tenantId": "od.testing"}, {"name": "BILL_APPROVER", "code": "BILL_APPROVER", "tenantId": "od.testing"}, {"name": "MB_CREATOR", "code": "MB_CREATOR", "tenantId": "od.testing"}, {"name": "MUSTER ROLL VERIFIER", "code": "MUSTER_ROLL_VERIFIER", "tenantId": "od.testing"}, {"name": "HRMS Admin", "code": "HRMS_ADMIN", "tenantId": "od.testing"}], "tenantId": "od.testing", "permanentCity": "Testing"}, "msgId": "1705558029324|en_IN", "plainAccessRequest": {}}
                headers = {"Content-Type": "application/json"}
                api_payload = {"pagination": {"limit": api_limit,"offSet": api_offset},"RequestInfo": request_payload}
                response = requests.post(host,headers=headers,data=json.dumps(api_payload))
                api_offset = api_offset + api_limit
                if response and response.status_code and response.status_code in [200, 202]:
                    response = response.json()
                    if response and response['musterRolls'] and len(response['musterRolls'])>0:
                        for roll in response['musterRolls']:
                            temp = {}
                            temp['ULB'] = tenantid
                            temp['projectId'] = roll['additionalDetails']['projectId']
                            temp['musterRollId'] = roll['musterRollNumber']
                            temp['startDate'] = convert_epoch_to_indian_time(roll['startDate'])
                            temp['endDate'] = convert_epoch_to_indian_time(roll['endDate'])
                            temp['creation_Date'] = convert_epoch_to_indian_time(roll['auditDetails']['createdTime'])
                            temp['musterRollStatus'] = roll['musterRollStatus']
                            temp['last_Modified_Date'] = convert_epoch_to_indian_time(roll['auditDetails']['lastModifiedTime'])
                            temp['No of Wage Seekers'] = len(roll['individualEntries'])
                            data.append(temp)
                    else:
                        break
                else:
                    break  
        return data
    except Exception as e:
        raise e

def getbeneficiaryNameIND(id, tenantid):
    try:
        host = individualHost + "/individual/v1/_search" + "?tenantId=" + tenantid + "&limit=1" + "&offset=0"
        request_payload = {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}
        headers = {"Content-Type": "application/json"}
        api_payload = {"Individual":{"id": [id]},"RequestInfo": request_payload}
        response = requests.post(host,headers=headers,data=json.dumps(api_payload))
        if response and response.status_code and response.status_code in [200, 202]:
            response = response.json()
            if response and response['Individual'] and len(response['Individual'])>0:
                return response['Individual'][0]['name']['givenName']
            else:
                return "NA"
        else:
            return "NA"
    except Exception as e:
        raise e

def getProjectIdfromContract(contract_number, tenantid):
    try:
        host = contractHost + "/contract/v1/_search"
        request_payload = {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}
        headers = {"Content-Type": "application/json"}
        api_payload = {"tenantId": tenantid,"contractNumber": contract_number,"RequestInfo": request_payload}
        response = requests.post(host,headers=headers,data=json.dumps(api_payload))
        if response and response.status_code and response.status_code in [200, 202]:
            response = response.json()
            if response and response['contracts'] and len(response['contracts'])>0:
                return response['contracts'][0]['additionalDetails']['projectId']
            else:
                return "NA"
        else:
            return "NA"
    except Exception as e:
        raise e
    
def extract_contract_number(reference_id):
    # Define the regular expression pattern to match the contract number
    pattern = r'WO/\d{4}-\d{2}/\d{6}'
    match = re.search(pattern, reference_id)
    if match:
        return match.group(0)
    return None


def getFailedPayments(payment_number):
    data = []
    try:
        host = piSearchHost + "/mukta-ifix-adapter/v1/pi/_search"
        request_payload = {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}
        headers = {"Content-Type": "application/json"}
        api_limit = 100
        api_offset = 0
        print("Getting Failed Payments")
        while True:
            api_payload = {"criteria": {"payment_number": payment_number},"pagination": {"limit": api_limit,"offSet": api_offset,"sortBy": "createdtime","order": "DESC"},"RequestInfo": request_payload}
            response = requests.post(host,headers=headers,data=json.dumps(api_payload))
            api_offset = api_offset + api_limit
            if response and response.status_code and response.status_code in [200, 202]:
                response = response.json()
                if response and response['paymentInstructions'] and len(response['paymentInstructions'])>0:
                    pi = response['paymentInstructions'][0]
                    tenantId = pi['tenantId']
                    contract_number = extract_contract_number(pi['additionalDetails']['referenceId'][0])
                    project_id = getProjectIdfromContract(contract_number, tenantId)
                    # Extract data from the PI level
                    pi_data = {
                        'ULB': pi['tenantId'],
                        'projectId': project_id,
                        'paymentInstructionId': pi['jitBillNo'],
                        'billId': pi['additionalDetails']['billNumber'][0],
                        'date': convert_epoch_to_indian_time(pi['auditDetails']['createdTime'])
                    }
                    for beneficiary in pi['beneficiaryDetails']:
                        beneficiary_name = 'NA'
                        if beneficiary['beneficiaryType'] == 'IND':
                            beneficiary_name = getbeneficiaryNameIND(beneficiary['beneficiaryId'], tenantId)
                        # if beneficiary['beneficiaryType'] == 'ORG':
                        #     beneficiary_name = getbeneficiaryNameORG(beneficiary['beneficiaryId'])
                        # Extract account number and IFSC code from bankAccountId
                        account_info = beneficiary['bankAccountId'].split('@')
                        account_number = account_info[0] if len(account_info) > 0 else ''
                        ifsc_code = account_info[1] if len(account_info) > 1 else ''

                        # Extract data from the beneficiary level
                        beneficiary_data = {
                            'beneficiaryId': beneficiary['beneficiaryNumber'],
                            'beneficiaryName': beneficiary_name,
                            'type': beneficiary['beneficiaryType'],
                            'accountNumber': account_number,
                            'ifscCode': ifsc_code    
                        }
                        # Combine PI data and beneficiary data
                        combined_data = {**pi_data, **beneficiary_data}
                        data.append(combined_data)
                else:
                    break
            else:
                break
        return data

    except Exception as e:
        raise e

def getFailedPaymentsDataFromExpense():
    data = []
    print("Getting Failed Payments Data")
    try:
        for tenantid in tenantids:
            print(tenantid)
            host = expenseHost + "/expense/payment/v1/_search"
            request_payload = {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}
            headers = {"Content-Type": "application/json"}
            api_limit = 10
            api_offset = 0
            while True:
                api_payload = {"paymentCriteria": {"tenantId": tenantid, "status": "FAILED"},"pagination": {"limit": api_limit,"offSet": api_offset},"RequestInfo": request_payload}
                response = requests.post(host,headers=headers,data=json.dumps(api_payload))
                api_offset = api_offset + api_limit
                if response and response.status_code and response.status_code in [200, 202]:
                    response = response.json()
                    if response and response['payments'] and len(response['payments'])>0:
                        for payment in response['payments']:
                            payment_number = payment['paymentNumber']
                            payment_data = getFailedPayments(payment_number)
                            data.extend(payment_data)
                    else:
                        break
                else:
                    break
        return data

    except Exception as e:
        raise e


def writeDataToCSV(data, filename):
    if not data:
        print("No data to write.")
        return
    with open(filename, mode='w', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=data[0].keys())
        writer.writeheader()
        writer.writerows(data)


if __name__ == '__main__':
    try:
        logging.info('Report Started Generating')

        directory = '/home/admin1/Music'
        if not os.path.exists(directory):
            os.makedirs(directory)
        
        # Get current date in ddmmyyyy format
        current_date = dt.datetime.now().strftime('%d%m%Y')
        
        # Generate filenames with the current date
        workOrder_filename = f'workOrder_{current_date}.csv'
        failedPayments_filename = f'failed_payments_{current_date}.csv'
        bill_filename = f'bill_{current_date}.csv'
        musterRoll_filename = f'musterRoll_{current_date}.csv'
        project_filename = f'project_{current_date}.csv'
        
        # Process work order data
        workOrder_data = getWorkOrderData()
        workOrder_file_path = os.path.join(directory, workOrder_filename)
        writeDataToCSV(workOrder_data, workOrder_file_path)
        
        # Process failed payments data
        failed_payments_data = getFailedPaymentsDataFromExpense()
        failed_payments_file_path = os.path.join(directory, failedPayments_filename)
        writeDataToCSV(failed_payments_data, failed_payments_file_path)
        
        # Process bill data
        bill_data = getBillData()
        bill_file_path = os.path.join(directory, bill_filename)
        writeDataToCSV(bill_data, bill_file_path)
        
        # Process muster roll data
        muster_Data = getMusterRollData()
        muster_file_path = os.path.join(directory, musterRoll_filename)
        writeDataToCSV(muster_Data, muster_file_path)
        
        # Process project data
        project_data = getProjectData()
        project_file_path = os.path.join(directory, project_filename)
        writeDataToCSV(project_data, project_file_path)

        logging.info('Report Generated Successfully')
        print(f"Reports saved in directory: {directory}")


    except Exception as ex:
        logging.error("Exception occured on main.", exc_info=True)
        raise(ex)