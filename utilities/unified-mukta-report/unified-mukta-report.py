import csv
import pandas as pd
from numpy import *
import requests
import json
from dateutil import parser
import datetime
import psycopg2
import logging
import calendar
import time


tenantids = ["od.jatni", "od.dhenkanal"]
finalData = []
finalMusterRollData = []
mdmsResponse = []
projectHost = "http://localhost:8081"
estimateHost = "http://localhost:8082"
processInstanceHost = "http://localhost:8083"
contractHost = "http://localhost:8084"
expenseCalculatorHost =  "http://localhost:8085"
wmsHost = "http://localhost:9085"
mdmsHost = "http://localhost:8019"


def getData():
    mdmsDataLabourCharges()
    for tenant in tenantids:
        #getMusterRollData(tenant)
        getProjectDetails(tenant)


def mdmsDataLabourCharges():
    host = mdmsHost + "/egov-mdms-service/v1/_search"
    api_payload = {"RequestInfo": {"apiId": "asset-services","ver": None,"ts": None,"action": None,"did": None,"key": None,"msgId": "search with from and to values","authToken": "1bfccbee-b982-4154-8ea2-3e0ad7ec1af4"},"MdmsCriteria": {"tenantId": "od","moduleDetails": [{"moduleName": "expense","masterDetails": [{"name": "LabourCharges"}]}]}}
    headers = {"Content-Type": "application/json"}
    response = requests.post(host,headers=headers,data=json.dumps(api_payload))
    if response and response.status_code and response.status_code == 200:
        response = response.json()
        global mdmsResponse
        mdmsResponse = response['MdmsRes']['expense']['LabourCharges']


def getProjectDetails(tenant):
    data = []
    try:
        host = projectHost + "/project/v1/_search?tenantId=" + tenant + "&limit=1000&offset=0&createdFrom=1680307200000"
        api_payload = {"Projects": [{"tenantId": tenant,"createdFrom": 1680307200000}],"RequestInfo": {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11","userName": "MUKTAUAT","name": "MUKTAUAT","mobileNumber": "9036774122","emailId": None,"locale": None,"type": "EMPLOYEE","roles": [{"name": "ESTIMATE APPROVER","code": "ESTIMATE_APPROVER","tenantId": "od.testing"},{"name": "WORK ORDER CREATOR","code": "WORK_ORDER_CREATOR","tenantId": "od.testing"},{"name": "Organization viewer","code": "ORG_VIEWER","tenantId": "od.testing"},{"name": "MB_VERIFIER","code": "MB_VERIFIER","tenantId": "od.testing"},{"name": "ESTIMATE CREATOR","code": "ESTIMATE_CREATOR","tenantId": "od.testing"},{"name": "MDMS Admin","code": "MDMS_ADMIN","tenantId": "od.testing"},{"name": "MB_VIEWER","code": "MB_VIEWER","tenantId": "od.testing"},{"name": "State Dashboard Admin","code": "STADMIN","tenantId": "od.testing"},{"name": "MUKTA Admin","code": "MUKTA_ADMIN","tenantId": "od.testing"},{"name": "Employee Common","code": "EMPLOYEE_COMMON","tenantId": "od.testing"},{"name": "TECHNICAL SANCTIONER","code": "TECHNICAL_SANCTIONER","tenantId": "od.testing"},{"name": "BILL_CREATOR","code": "BILL_CREATOR","tenantId": "od.testing"},{"name": "BILL_ACCOUNTANT","code": "BILL_ACCOUNTANT","tenantId": "od.testing"},{"name": "WORK_ORDER_VIEWER","code": "WORK_ORDER_VIEWER","tenantId": "od.testing"},{"name": "BILL_VERIFIER","code": "BILL_VERIFIER","tenantId": "od.testing"},{"name": "ESTIMATE VERIFIER","code": "ESTIMATE_VERIFIER","tenantId": "od.testing"},{"name": "MUSTER ROLL APPROVER","code": "MUSTER_ROLL_APPROVER","tenantId": "od.testing"},{"name": "ESTIMATE VIEWER","code": "ESTIMATE_VIEWER","tenantId": "od.testing"},{"name": "WORK ORDER APPROVER","code": "WORK_ORDER_APPROVER","tenantId": "od.testing"},{"name": "MB_APPROVER","code": "MB_APPROVER","tenantId": "od.testing"},{"name": "MDMS CITY ADMIN","code": "MDMS_CITY_ADMIN","tenantId": "od.testing"},{"name": "OFFICER IN CHARGE","code": "OFFICER_IN_CHARGE","tenantId": "od.testing"},{"name": "PROJECT CREATOR","code": "PROJECT_CREATOR","tenantId": "od.testing"},{"name": "BILL_VIEWER","code": "BILL_VIEWER","tenantId": "od.testing"},{"name": "WORK ORDER VERIFIER","code": "WORK_ORDER_VERIFIER","tenantId": "od.testing"},{"name": "PROJECT VIEWER","code": "PROJECT_VIEWER","tenantId": "od.testing"},{"name": "BILL_APPROVER","code": "BILL_APPROVER","tenantId": "od.testing"},{"name": "MB_CREATOR","code": "MB_CREATOR","tenantId": "od.testing"},{"name": "MUSTER ROLL VERIFIER","code": "MUSTER_ROLL_VERIFIER","tenantId": "od.testing"},{"name": "HRMS Admin","code": "HRMS_ADMIN","tenantId": "od.testing"}],"active": True,"tenantId": "od.testing","permanentCity": "Testing"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}}
        headers = {"Content-Type": "application/json"}
        response = requests.post(host,headers=headers,data=json.dumps(api_payload))
        if response and response.status_code and response.status_code == 200:
            response = response.json()
            if response and response['ResponseInfo'] and response['Project'] and len(response['Project'])>0:
                for project in response['Project']:
                    temp = {}
                    temp['ULB'] = project['tenantId']
                    temp['projectid'] = project['id']
                    temp['projectNumber'] = project['projectNumber']
                    temp['projectType'] = project['projectType']
                    data.append(temp)
        getEstimateDetails(tenant, data)
    except Exception as e:
        raise e


def getEstimateDetails(tenant, data):
    count = 0
    try:
        for datum in data:
            host = estimateHost + "/estimate/v1/_search?tenantId="+ tenant +"&projectId=" + datum['projectid']
            request_payload = {"RequestInfo": {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11","userName": "MUKTAUAT","name": "MUKTAUAT","mobileNumber": "9036774122","emailId": None,"locale": None,"type": "EMPLOYEE","roles": [{"name": "ESTIMATE APPROVER","code": "ESTIMATE_APPROVER","tenantId": "od.testing"},{"name": "WORK ORDER CREATOR","code": "WORK_ORDER_CREATOR","tenantId": "od.testing"},{"name": "Organization viewer","code": "ORG_VIEWER","tenantId": "od.testing"},{"name": "MB_VERIFIER","code": "MB_VERIFIER","tenantId": "od.testing"},{"name": "ESTIMATE CREATOR","code": "ESTIMATE_CREATOR","tenantId": "od.testing"},{"name": "MDMS Admin","code": "MDMS_ADMIN","tenantId": "od.testing"},{"name": "MB_VIEWER","code": "MB_VIEWER","tenantId": "od.testing"},{"name": "State Dashboard Admin","code": "STADMIN","tenantId": "od.testing"},{"name": "MUKTA Admin","code": "MUKTA_ADMIN","tenantId": "od.testing"},{"name": "Employee Common","code": "EMPLOYEE_COMMON","tenantId": "od.testing"},{"name": "TECHNICAL SANCTIONER","code": "TECHNICAL_SANCTIONER","tenantId": "od.testing"},{"name": "BILL_CREATOR","code": "BILL_CREATOR","tenantId": "od.testing"},{"name": "BILL_ACCOUNTANT","code": "BILL_ACCOUNTANT","tenantId": "od.testing"},{"name": "WORK_ORDER_VIEWER","code": "WORK_ORDER_VIEWER","tenantId": "od.testing"},{"name": "BILL_VERIFIER","code": "BILL_VERIFIER","tenantId": "od.testing"},{"name": "ESTIMATE VERIFIER","code": "ESTIMATE_VERIFIER","tenantId": "od.testing"},{"name": "MUSTER ROLL APPROVER","code": "MUSTER_ROLL_APPROVER","tenantId": "od.testing"},{"name": "ESTIMATE VIEWER","code": "ESTIMATE_VIEWER","tenantId": "od.testing"},{"name": "WORK ORDER APPROVER","code": "WORK_ORDER_APPROVER","tenantId": "od.testing"},{"name": "MB_APPROVER","code": "MB_APPROVER","tenantId": "od.testing"},{"name": "MDMS CITY ADMIN","code": "MDMS_CITY_ADMIN","tenantId": "od.testing"},{"name": "OFFICER IN CHARGE","code": "OFFICER_IN_CHARGE","tenantId": "od.testing"},{"name": "PROJECT CREATOR","code": "PROJECT_CREATOR","tenantId": "od.testing"},{"name": "BILL_VIEWER","code": "BILL_VIEWER","tenantId": "od.testing"},{"name": "WORK ORDER VERIFIER","code": "WORK_ORDER_VERIFIER","tenantId": "od.testing"},{"name": "PROJECT VIEWER","code": "PROJECT_VIEWER","tenantId": "od.testing"},{"name": "BILL_APPROVER","code": "BILL_APPROVER","tenantId": "od.testing"},{"name": "MB_CREATOR","code": "MB_CREATOR","tenantId": "od.testing"},{"name": "MUSTER ROLL VERIFIER","code": "MUSTER_ROLL_VERIFIER","tenantId": "od.testing"},{"name": "HRMS Admin","code": "HRMS_ADMIN","tenantId": "od.testing"}],"active": True,"tenantId": "od.testing","permanentCity": "Testing"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}}
            headers = {"Content-Type": "application/json"}
            response = requests.post(host,headers=headers,data=json.dumps(request_payload))
            if response and response.status_code and response.status_code == 200:
                response = response.json()
                if response['TotalCount']>0 and response['estimates'] and len(response['estimates'])>0 and response['estimates'][0]['wfStatus'] and response['estimates'][0]['wfStatus']=='APPROVED':
                    datum['EstimateValue'] = response['estimates'][0]['additionalDetails']['totalEstimatedAmount']
                    datum['EstimatePreparationDate'] = datetime.datetime.fromtimestamp((response['estimates'][0]['proposalDate']+19800000)/1000).strftime('%d-%m-%Y')
                    datum['EstimateNumber'] = response['estimates'][0]['estimateNumber']
                    datum['EstimateId'] = response['estimates'][0]['id']
            # else:
            # datum['EstimateValue'] = 'NA'
            # datum['EstimatePreparationDate'] = 'NA'
            # datum['TechnicalSanction'] = 'NA'
            # datum['AdministrativeApproval'] = 'NA'
            # datum['DateOfWo'] = 'NA'
            # datum['EstimateDuration'] = 'NA'
            # datum['DateOfAcceptanceOfWo'] = 'NA'
            # datum['DateOfActualWorkStarted'] = 'NA'
        getProcessInstanceByEstimate(tenant, data)
    except Exception as e:
        raise e

def getProcessInstanceByEstimate(tenant, data):
    try:
        for datum in data:
            if 'EstimateNumber' in datum and datum['EstimateNumber'] != None:
                host = processInstanceHost + "/egov-workflow-v2/egov-wf/process/_search?tenantId="+tenant+"&businessIds="+ datum['EstimateNumber'] +"&history=true"
                request_payload = {"RequestInfo": {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11","userName": "MUKTAUAT","name": "MUKTAUAT","mobileNumber": "9036774122","emailId": None,"locale": None,"type": "EMPLOYEE","roles": [{"name": "ESTIMATE APPROVER","code": "ESTIMATE_APPROVER","tenantId": "od.testing"},{"name": "WORK ORDER CREATOR","code": "WORK_ORDER_CREATOR","tenantId": "od.testing"},{"name": "Organization viewer","code": "ORG_VIEWER","tenantId": "od.testing"},{"name": "MB_VERIFIER","code": "MB_VERIFIER","tenantId": "od.testing"},{"name": "ESTIMATE CREATOR","code": "ESTIMATE_CREATOR","tenantId": "od.testing"},{"name": "MDMS Admin","code": "MDMS_ADMIN","tenantId": "od.testing"},{"name": "MB_VIEWER","code": "MB_VIEWER","tenantId": "od.testing"},{"name": "State Dashboard Admin","code": "STADMIN","tenantId": "od.testing"},{"name": "MUKTA Admin","code": "MUKTA_ADMIN","tenantId": "od.testing"},{"name": "Employee Common","code": "EMPLOYEE_COMMON","tenantId": "od.testing"},{"name": "TECHNICAL SANCTIONER","code": "TECHNICAL_SANCTIONER","tenantId": "od.testing"},{"name": "BILL_CREATOR","code": "BILL_CREATOR","tenantId": "od.testing"},{"name": "BILL_ACCOUNTANT","code": "BILL_ACCOUNTANT","tenantId": "od.testing"},{"name": "WORK_ORDER_VIEWER","code": "WORK_ORDER_VIEWER","tenantId": "od.testing"},{"name": "BILL_VERIFIER","code": "BILL_VERIFIER","tenantId": "od.testing"},{"name": "ESTIMATE VERIFIER","code": "ESTIMATE_VERIFIER","tenantId": "od.testing"},{"name": "MUSTER ROLL APPROVER","code": "MUSTER_ROLL_APPROVER","tenantId": "od.testing"},{"name": "ESTIMATE VIEWER","code": "ESTIMATE_VIEWER","tenantId": "od.testing"},{"name": "WORK ORDER APPROVER","code": "WORK_ORDER_APPROVER","tenantId": "od.testing"},{"name": "MB_APPROVER","code": "MB_APPROVER","tenantId": "od.testing"},{"name": "MDMS CITY ADMIN","code": "MDMS_CITY_ADMIN","tenantId": "od.testing"},{"name": "OFFICER IN CHARGE","code": "OFFICER_IN_CHARGE","tenantId": "od.testing"},{"name": "PROJECT CREATOR","code": "PROJECT_CREATOR","tenantId": "od.testing"},{"name": "BILL_VIEWER","code": "BILL_VIEWER","tenantId": "od.testing"},{"name": "WORK ORDER VERIFIER","code": "WORK_ORDER_VERIFIER","tenantId": "od.testing"},{"name": "PROJECT VIEWER","code": "PROJECT_VIEWER","tenantId": "od.testing"},{"name": "BILL_APPROVER","code": "BILL_APPROVER","tenantId": "od.testing"},{"name": "MB_CREATOR","code": "MB_CREATOR","tenantId": "od.testing"},{"name": "MUSTER ROLL VERIFIER","code": "MUSTER_ROLL_VERIFIER","tenantId": "od.testing"},{"name": "HRMS Admin","code": "HRMS_ADMIN","tenantId": "od.testing"}],"active": True,"tenantId": "od.testing","permanentCity": "Testing"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}}
                headers = {"Content-Type": "application/json"}
                response = requests.post(host,headers=headers,data=json.dumps(request_payload))
                if response and response.status_code and response.status_code == 200:
                    response = response.json()
                    if 'ProcessInstances' in response and len(response['ProcessInstances'])>0:
                        for instance in response['ProcessInstances']:
                            if instance['businessService'] == 'ESTIMATE' and instance['action'] == 'TECHNICALSANCTION':
                                datum['TechnicalSanction'] = datetime.datetime.fromtimestamp((instance['auditDetails']['lastModifiedTime']+19800000)/1000).strftime('%d-%m-%Y')
                            if instance['businessService'] == 'ESTIMATE' and instance['action'] == 'APPROVE':
                                datum['AdministrativeApproval'] = datetime.datetime.fromtimestamp((instance['auditDetails']['lastModifiedTime']+19800000)/1000).strftime('%d-%m-%Y')
        getWoDetails(tenant, data)
    except Exception as e:
        raise e


def getWoDetails(tenant, data):
    try:
        for datum in data:
            if 'EstimateId' in datum:
                host = contractHost + "/contract/v1/_search?tenantId="+ tenant
                request_payload = {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11","userName": "MUKTAUAT","name": "MUKTAUAT","mobileNumber": "9036774122","emailId": None,"locale": None,"type": "EMPLOYEE","roles": [{"name": "ESTIMATE APPROVER","code": "ESTIMATE_APPROVER","tenantId": "od.testing"},{"name": "WORK ORDER CREATOR","code": "WORK_ORDER_CREATOR","tenantId": "od.testing"},{"name": "Organization viewer","code": "ORG_VIEWER","tenantId": "od.testing"},{"name": "MB_VERIFIER","code": "MB_VERIFIER","tenantId": "od.testing"},{"name": "ESTIMATE CREATOR","code": "ESTIMATE_CREATOR","tenantId": "od.testing"},{"name": "MDMS Admin","code": "MDMS_ADMIN","tenantId": "od.testing"},{"name": "MB_VIEWER","code": "MB_VIEWER","tenantId": "od.testing"},{"name": "State Dashboard Admin","code": "STADMIN","tenantId": "od.testing"},{"name": "MUKTA Admin","code": "MUKTA_ADMIN","tenantId": "od.testing"},{"name": "Employee Common","code": "EMPLOYEE_COMMON","tenantId": "od.testing"},{"name": "TECHNICAL SANCTIONER","code": "TECHNICAL_SANCTIONER","tenantId": "od.testing"},{"name": "BILL_CREATOR","code": "BILL_CREATOR","tenantId": "od.testing"},{"name": "BILL_ACCOUNTANT","code": "BILL_ACCOUNTANT","tenantId": "od.testing"},{"name": "WORK_ORDER_VIEWER","code": "WORK_ORDER_VIEWER","tenantId": "od.testing"},{"name": "BILL_VERIFIER","code": "BILL_VERIFIER","tenantId": "od.testing"},{"name": "ESTIMATE VERIFIER","code": "ESTIMATE_VERIFIER","tenantId": "od.testing"},{"name": "MUSTER ROLL APPROVER","code": "MUSTER_ROLL_APPROVER","tenantId": "od.testing"},{"name": "ESTIMATE VIEWER","code": "ESTIMATE_VIEWER","tenantId": "od.testing"},{"name": "WORK ORDER APPROVER","code": "WORK_ORDER_APPROVER","tenantId": "od.testing"},{"name": "MB_APPROVER","code": "MB_APPROVER","tenantId": "od.testing"},{"name": "MDMS CITY ADMIN","code": "MDMS_CITY_ADMIN","tenantId": "od.testing"},{"name": "OFFICER IN CHARGE","code": "OFFICER_IN_CHARGE","tenantId": "od.testing"},{"name": "PROJECT CREATOR","code": "PROJECT_CREATOR","tenantId": "od.testing"},{"name": "BILL_VIEWER","code": "BILL_VIEWER","tenantId": "od.testing"},{"name": "WORK ORDER VERIFIER","code": "WORK_ORDER_VERIFIER","tenantId": "od.testing"},{"name": "PROJECT VIEWER","code": "PROJECT_VIEWER","tenantId": "od.testing"},{"name": "BILL_APPROVER","code": "BILL_APPROVER","tenantId": "od.testing"},{"name": "MB_CREATOR","code": "MB_CREATOR","tenantId": "od.testing"},{"name": "MUSTER ROLL VERIFIER","code": "MUSTER_ROLL_VERIFIER","tenantId": "od.testing"},{"name": "HRMS Admin","code": "HRMS_ADMIN","tenantId": "od.testing"}],"active": True,"tenantId": "od.testing","permanentCity": "Testing"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}
                payload = {"tenantId": tenant, "estimateIds": [datum['EstimateId']],"RequestInfo": request_payload}
                headers = {"Content-Type": "application/json"}
                response = requests.post(host,headers=headers,data=json.dumps(payload))
                if response and response.status_code and response.status_code == 200:
                    response = response.json()
                    if 'contracts' in response and len(response['contracts'])>0:
                        for contract in response['contracts']:
                            if 'businessService' in contract and contract['businessService'] == 'CONTRACT' and 'wfStatus' in contract and contract['wfStatus'] == 'ACCEPTED':
                                datum['WoNumber'] = contract['contractNumber']
                                datum['contractId'] = contract['id']
                                datum['DateOfWo'] = datetime.datetime.fromtimestamp((contract['issueDate']+19800000)/1000).strftime('%d-%m-%Y')
                                datum['EstimateDuration'] = contract['completionPeriod']
                                datum['CboName'] = contract['additionalDetails']['orgName']
                                datum['RoleOfCbo'] = contract['executingAuthority']
                                datum['DateOfAcceptanceOfWo'] = datetime.datetime.fromtimestamp((contract['startDate']+19800000)/1000).strftime('%d-%m-%Y')
        finalData.extend(data)
    except Exception as e:
        raise e

def getMusterRollData(tenant):
    try:
        host = wmsHost + "/wms/muster/_search"
        request_payload = {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}
        headers = {"Content-Type": "application/json"}
        api_limit = 50
        api_offset = 0
        while(True):
            payload = {"inbox": {"moduleSearchCriteria": {"tenantId": tenant,"musterRollStatus": "APPROVED"},"tenantId": tenant,"limit": api_limit,"offset": api_offset}, "RequestInfo": request_payload}
            response = requests.post(host,headers=headers,data=json.dumps(payload))
            api_offset = api_offset + api_limit
            if response and response.status_code and response.status_code == 200:
                response = response.json()
                # print(response)
                if 'items' in response and len(response['items'])>0:
                    makeMusterData(response['items'])
                else:
                    break
            else:
                break
    # print(finalMusterRollData)
    except Exception as e:
        raise e

def makeMusterData(items):
    try:
        for item in items:
            temp = {}
            temp['ulbName'] = item['businessObject']['tenantId']
            temp['projectNumber'] = item['businessObject']['additionalDetails']['projectId']
            temp['musterRollId'] = item['businessObject']['musterRollNumber']
            temp['startDate'] = datetime.datetime.fromtimestamp((item['businessObject']['startDate']+19800000)/1000).strftime('%d-%m-%Y')
            temp['endDate'] = datetime.datetime.fromtimestamp((item['businessObject']['endDate']+19800000)/1000).strftime('%d-%m-%Y')
            temp['activeWeek'] = getActiveWeek(item['businessObject']['startDate'],item['businessObject']['endDate'])
            temp['musterRollAmount'] = item['businessObject']['additionalDetails']['amount'] #getMustRollAmount(temp['ulbName'],temp['musterRollId'])
            temp['musterRollCreatedTime'] = item['businessObject']['auditDetails']['createdTime']
            temp['numberOfWsInMusterRoll'] = len(item['businessObject']['individualEntries'])
            getWageSeekers(temp, item['businessObject']['individualEntries'])
    except Exception as e:
        raise e

# def getMustRollAmount(tenantid, musterRoll):
# 	try:
# 		host = expenseCalculatorHost + "/expense-calculator/v1/_estimate'"
# 		request_payload = {"apiId": "Rainmaker","authToken": "3bb0c045-6e5c-4002-8504-6069bf20a5ba","userInfo": {"id": 271,"uuid": "81b1ce2d-262d-4632-b2a3-3e8227769a11"},"msgId": "1705908972414|en_IN","plainAccessRequest": {}}
# 		headers = {"Content-Type": "application/json"}
# 		payload = {"criteria": {"tenantId": tenantid,"musterRollId": [musterRoll],"fromPeriod": 0,"toPeriod": 0,"contractId": null},"RequestInfo": request_payload}
# 		response = requests.post(host,headers=headers,data=json.dumps(payload))
# 		if response and response.status_code and response.status_code == 200:
# 			response = response.json()
# 			if 'contracts' in response and len(response['contracts'])>0:
# 	except Exception as e:
# 		raise e


def getWageSeekers(musterRollData, individualsDetails):
    try:
        for wageseeker in individualsDetails:
            temp = musterRollData.copy()
            temp['wageseekerName'] = wageseeker['additionalDetails']['userName']
            temp['numberOfDaysWorked'] = wageseeker['actualTotalAttendance']
            temp['skills'] = wageseeker['additionalDetails']['skillCode']
            temp['wageRate'] = getWageRates(wageseeker['additionalDetails']['skillCode'],musterRollData['musterRollCreatedTime'])
            finalMusterRollData.append(temp)
    except Exception as e:
        raise e

def getWageRates(skills, createdDate):
    for mdms in mdmsResponse:
        if mdms['code'] == skills and mdms['effectiveTo'] != None and createdDate<mdms['effectiveTo']:
            return mdms['amount']
        elif mdms['code'] == skills and mdms['effectiveTo'] == None and createdDate>mdms['effectiveFrom']:
            return mdms['amount']


def getActiveWeek(startDate,endDate):
    currentEpochTime = calendar.timegm(time.gmtime()) * 1000
    if currentEpochTime>startDate and currentEpochTime<endDate:
        return "Yes"
    else:
        return "No"


if __name__ == '__main__':
    try:
        # logging.getLogger().setLevel(logging.DEBUG)
        logging.info('Report Started Generating')
        getData()
        print(finalData)
        print(finalMusterRollData)
    except Exception as ex:
        logging.error("Exception occured on main.", exc_info=True)
        raise(ex)