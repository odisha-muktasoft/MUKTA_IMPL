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

# Replace these with your PostgreSQL database details
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

tenants = ['od.athagarh','od.berhampur','od.kesinga','od.jatni','od.chatrapur','od.puri','od.hinjilicut','od.sambalpur','od.balasore','od.padampur','od.jharsuguda','od.dhenkanal','od.jeypore','od.bhadrak','od.balangir','od.baripada','od.bhubaneswar','od.rourkela','od.jajpur','od.cuttack','od.phulbani','od.kotpad','od.paradeep','od.boudhgarh','od.keonjhargarh']

def get_last_thursday_epoch():
    now = dt.datetime.now()
    last_thursday = now - dt.timedelta(days=(now.weekday() - 3) % 7 + 1)
    last_thursday_time = last_thursday.replace(hour=15, minute=30, second=0, microsecond=0)
    last_thursday_epoch = int(last_thursday_time.timestamp() * 1000)
    return last_thursday_epoch

def generateBasicInformations(connection, epoch):

    cursor = connection.cursor()

    #No. of ULB users/employee
    cursor.execute("""
        select tenantid as ulb, count(*) as employee 
        from eg_hrms_employee 
        where active=true and lastmodifieddate <= %s 
        group by tenantid order by tenantid;
    """, (epoch,))
    result = cursor.fetchall()
    employeeData = pd.DataFrame(result)

    #Fetch the Number of CBO users(No. of CBO's)
    cursor.execute("""select eg_org.tenant_id as ulb, count(eg_org.id) as cbo from eg_org inner join eg_org_function on eg_org.id=eg_org_function.org_id where eg_org_function.type='CBO.MSG' and eg_org.last_modified_time <= %s group by eg_org.tenant_id order by eg_org.tenant_id;""", (epoch,))
    result = cursor.fetchall()
    cboData = pd.DataFrame(result)

    #No. of vendors(Contractors)
    cursor.execute("""select eg_org.tenant_id as ulb, count(eg_org.id) as vendors from eg_org inner join eg_org_function on eg_org.id=eg_org_function.org_id where eg_org_function.type='VEN.CMS' and eg_org.last_modified_time <= %s group by eg_org.tenant_id order by eg_org.tenant_id;""", (epoch,))
    result = cursor.fetchall()
    vendorsData = pd.DataFrame(result)

    #No. of Wageseekers
    cursor.execute("""select tenantid as ulb, count(*) as wageseekers from INDIVIDUAL where issystemuser=False and lastmodifiedtime <= %s group by tenantid;""", (epoch,))

    result = cursor.fetchall()
    wageseekersData = pd.DataFrame(result)

    #No. of projects created
    cursor.execute("""select tenantid as ulb, count(id) as projects from project where lastmodifiedtime <= %s group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    projectsData = pd.DataFrame(result)

    #No. of estimate created
    cursor.execute("""select tenant_id as ulb, count(distinct estimate_number) as estimate from eg_wms_estimate where last_modified_time <= %s group by tenant_id;""", (epoch,))
    result = cursor.fetchall()
    estimateData = pd.DataFrame(result)

    #Value of estimate created
    estimateValueData = getEstimatedValue(connection, epoch)

    #No Of Estimates Approved
    cursor.execute("""select tenant_id as ulb, count(distinct estimate_number) as numberofestimateapproved from eg_wms_estimate where wf_status='APPROVED' and  last_modified_time<= %s group by tenant_id;""", (epoch,))
    result = cursor.fetchall()
    estimateApprovedData = pd.DataFrame(result)

    #Total value of estimate approved(Rs)
    approvedEstimateValueData = getApprovedEstimateValue(connection, epoch)

    #No. of work order created
    cursor.execute("""select tenant_id as ulb, count(distinct contract_number) as numberofwocreated from eg_wms_contract where last_modified_time<= %s group by tenant_id;""", (epoch,))
    result = cursor.fetchall()
    numberOfWoCreatedData = pd.DataFrame(result)

    #Total value of work order accepted by CBO's(Rs)
    cursor.execute("""select SUM(total_contracted_amount) as valueofwoaccepted, tenant_id as ulb from eg_wms_contract where wf_status='ACCEPTED' and last_modified_time<=%s group by tenant_id order by tenant_id;""", (epoch,))
    result = cursor.fetchall()
    valueOfWoAcceptedData = pd.DataFrame(result)

    #No. Of work Orders Accepted By CBO
    cursor.execute("""select tenant_id as ulb, count(*) as noofwoaccepted  from eg_wms_contract where wf_status='ACCEPTED' and last_modified_time<=%s group by tenant_id;""", (epoch,))
    result = cursor.fetchall()
    numberOfWoAcceptedData = pd.DataFrame(result)

    #Value of the project(s) initiated(work started)
    valueOfProjectInitiatedData = getValueOfProjectInitiated(connection, epoch)

    #No Of Wage Seekers Engaged in Initiated Projects
    cursor.execute("""select eg_wms_muster_roll.tenant_id as ulb, count(distinct individual_id) as wageseekersEngagedInInitiatedProjects from eg_wms_muster_roll inner join eg_wms_attendance_summary on eg_wms_muster_roll.id=eg_wms_attendance_summary.muster_roll_id where eg_wms_muster_roll.lastmodifiedtime<=%s group by eg_wms_muster_roll.tenant_id;""", (epoch,))
    result = cursor.fetchall()
    wageseekersEngagedInInitiatedProjectsData = pd.DataFrame(result)

    #Total Number of Muster Rolls Generated
    cursor.execute("""select tenant_id as ulb, count(*) as totalNumberOfMusterRollGenerated from eg_wms_muster_roll where createdtime<=%s group by tenant_id;""", (epoch,))
    result = cursor.fetchall()
    totalNumberOfMusterRollGeneratedData = pd.DataFrame(result)

    #Total No Of Wage Seekers Engaged
    cursor.execute("""select tenantid as ulb, count(distinct individual_id) as totalNumberOfWageseekerEngaged from eg_wms_attendance_attendee where lastmodifiedtime<=%s group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    totalNumberOfWageseekerEngagedData = pd.DataFrame(result)

    #Total Number of Muster Rolls Approved
    cursor.execute("""select tenant_id as ulb, count(*) as numberofmrapproved from eg_wms_muster_roll where musterroll_status='APPROVED' and lastmodifiedtime<=%s group by tenant_id;""", (epoch,))
    result = cursor.fetchall()
    numberOfMrApprovedData = pd.DataFrame(result)

    #Total Value of Muster Rolls Approved
    cursor.execute("""select tenantid as ulb, SUM(totalamount) as totalvalueofmrapproved from eg_expense_bill where businessservice='EXPENSE.WAGES' and lastmodifiedtime<=%s group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    totalValueOfMrApprovedData = pd.DataFrame(result)

    #Number of Wage Seekers in Non Approved Muster Roll
    cursor.execute("""select tenant_id as ulb, count(distinct individual_id) as numberofwsinnonapprovedmr from eg_wms_attendance_summary inner join eg_wms_muster_roll on eg_wms_attendance_summary.muster_roll_id=eg_wms_muster_roll.id  where musterroll_status  != 'APPROVED' and eg_wms_muster_roll.lastmodifiedtime<=%s group by tenant_id;""", (epoch,))
    result = cursor.fetchall()
    numberOfWsInNonApprovedMrData = pd.DataFrame(result)

    #Value of Work order Approved
    cursor.execute("""select SUM(total_contracted_amount) as totalAmount, tenant_id as ulb from eg_wms_contract where wf_status='APPROVED' and last_modified_time<=%s group by tenant_id;""", (epoch,))
    result = cursor.fetchall()
    valueOfWoApprovedData = pd.DataFrame(result)

    #No of Work order Approved
    cursor.execute("""select count(*) as woapproved, tenant_id as ulb from eg_wms_contract where wf_status='APPROVED' and last_modified_time<=%s group by tenant_id;""", (epoch,))
    result = cursor.fetchall()
    numberOfWoApprovedData = pd.DataFrame(result)

    #Prepare column
    employeeData.columns = ['ulb', 'No. of ULB users/employee']
    cboData.columns = ['ulb', 'No. of CBOs']
    vendorsData.columns = ['ulb', 'No. of vendors']
    wageseekersData.columns = ['ulb', 'No. of Wageseekers']
    projectsData.columns = ['ulb', 'No. of projects created']
    estimateData.columns = ['ulb', 'No. of estimate created']
    estimateValueData.columns = ['ulb', 'Total Values Of Estimates Created']
    estimateApprovedData.columns = ['ulb', 'No. Of Estimates Approved']
    approvedEstimateValueData.columns = ['ulb', 'Total Value Of Estimates Approved(Rs)']
    numberOfWoCreatedData.columns = ['ulb', 'No. of work order created']
    valueOfWoAcceptedData.columns = ['Total value of work order accepted by CBOs(Rs)','ulb']
    numberOfWoAcceptedData.columns = ['ulb', 'No. Of work Orders Accepted By CBO']
    valueOfProjectInitiatedData.columns = ['ulb', 'Value of the project(s) initiated(work started)']
    wageseekersEngagedInInitiatedProjectsData.columns = ['ulb', 'No Of Wage Seekers Engaged in Initiated Projects']
    totalNumberOfMusterRollGeneratedData.columns = ['ulb', 'Total Number of Muster Rolls Generated']
    totalNumberOfWageseekerEngagedData.columns = ['ulb', 'Total No Of Wage Seekers Engaged']
    numberOfMrApprovedData.columns = ['ulb', 'Total Number of Muster Rolls Approved']
    totalValueOfMrApprovedData.columns = ['ulb', 'Total Value of Muster Rolls Approved(Rs)']
    numberOfWsInNonApprovedMrData.columns = ['ulb', 'Number of Wage Seekers in Non Approved Muster Roll']
    valueOfWoApprovedData.columns = ['Value of Work order Approved(Rs)', 'ulb']
    numberOfWoApprovedData.columns = ['No of Work order Approved', 'ulb']


    ###########################################

    data = pd.DataFrame()
    data=pd.merge(employeeData,cboData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,vendorsData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,wageseekersData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,projectsData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,estimateData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,estimateValueData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,estimateApprovedData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,approvedEstimateValueData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,numberOfWoCreatedData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,valueOfWoAcceptedData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,numberOfWoAcceptedData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,valueOfProjectInitiatedData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,wageseekersEngagedInInitiatedProjectsData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,totalNumberOfMusterRollGeneratedData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,totalNumberOfWageseekerEngagedData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,numberOfMrApprovedData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,totalValueOfMrApprovedData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,numberOfWsInNonApprovedMrData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,valueOfWoApprovedData,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,numberOfWoApprovedData,left_on='ulb',right_on='ulb',how='left')

    print(data)

    return data

def getEstimatedValue(connection, epoch):
    cursor = connection.cursor()
    data = []
    for tenant in tenants:
        datalist = [tenant]
        cursor.execute("""
            SELECT SUM(eg_wms_estimate_amount_detail.amount) as totalestimateamount 
            FROM (
                SELECT est.created_time as creationDate, 
                       est.wf_status as estimateStatus, 
                       est.id as estimateId, 
                       estDetails.id as estimateDetailId 
                FROM eg_wms_estimate as est 
                INNER JOIN eg_wms_estimate_detail as estDetails 
                ON est.id = estDetails.estimate_id 
                WHERE est.tenant_id = %s 
                AND est.last_modified_time <= %s 
                AND (est.business_service = 'ESTIMATE' OR est.business_service IS NULL)
            ) as tempTable  
            INNER JOIN eg_wms_estimate_amount_detail 
            ON tempTable.estimateDetailId = eg_wms_estimate_amount_detail.estimate_detail_id;
        """, (tenant, epoch))
        getEstimatedProjectValue = cursor.fetchall()
        if getEstimatedProjectValue[0][0] is None:
            datalist.append(0)
        else:
            datalist.append(getEstimatedProjectValue[0][0])

        data.append(datalist)
    df = pd.DataFrame(data, columns=['ulb', 'totalestimateamount'])
    return df

def getApprovedEstimateValue(connection, epoch):
    cursor = connection.cursor()
    data = []
    for tenant in tenants:
        datalist = [tenant]
        cursor.execute("""select SUM(eg_wms_estimate_amount_detail.amount) as totalapprovedestimatedvalue from (Select est.last_modified_time as creationDate, est.wf_status as estimateStatus, est.id as estimateId, estDetails.id  as estimateDetailId from eg_wms_estimate as est Inner Join eg_wms_estimate_detail as estDetails on est.id= estDetails.estimate_id where est.tenant_id = %s and est.last_modified_time<= %s and (est.business_service='ESTIMATE' or est.business_service is null) ) as tempTable inner join eg_wms_estimate_amount_detail on tempTable.estimatedetailid=eg_wms_estimate_amount_detail.estimate_detail_id where tempTable.estimatestatus='APPROVED';""", (tenant, epoch))
        getEstimatedProjectValue = cursor.fetchall()
        if getEstimatedProjectValue[0][0] is None:
            datalist.append(0)
        else:
            datalist.append(getEstimatedProjectValue[0][0])

        data.append(datalist)
    df = pd.DataFrame(data, columns=['ulb', 'totalestimateamount'])
    return df

def getValueOfProjectInitiated(connection, epoch):
    cursor = connection.cursor()
    data = []
    for tenant in tenants:
        datalist = [tenant]
        cursor.execute("""select sum(eg_wms_estimate_amount_detail.amount) as totalamount from (select distinct eg_wms_estimate_detail.id as estimateDetailsId from (select distinct * from (select project.id as projectId from project Inner Join (select eg_wms_attendance_register.additionaldetails as additionalDetails from eg_wms_attendance_register inner join eg_wms_attendance_log on eg_wms_attendance_register.id = eg_wms_attendance_log.register_id where eg_wms_attendance_log.lastmodifiedtime<=%s) logsTable on project.projectnumber = logsTable.additionalDetails ->> 'projectId') as tempTable1 inner join eg_wms_estimate on eg_wms_estimate.project_id = tempTable1.projectId ) as tempTable2 inner join eg_wms_estimate_detail on eg_wms_estimate_detail.estimate_id = tempTable2.id where tempTable2.tenant_id = %s) as tempTable3 inner join eg_wms_estimate_amount_detail on tempTable3.estimateDetailsId = eg_wms_estimate_amount_detail.estimate_detail_id where eg_wms_estimate_amount_detail.is_active=TRUE;""", (epoch, tenant))
        getEstimatedProjectValue = cursor.fetchall()
        if getEstimatedProjectValue[0][0] is None:
            datalist.append(0)
        else:
            datalist.append(getEstimatedProjectValue[0][0])

        data.append(datalist)
    df = pd.DataFrame(data, columns=['ulb', 'totalestimateamount'])
    return df


def generateTotalCountByProjectType(connection, epoch):
    cursor = connection.cursor()
    data = []
    counter = 0

    for tenant in tenants:
        counter += 1
        cursor.execute("""
            SELECT temptable.projectType, 
                   COUNT(*) as project_count 
            FROM (
                SELECT DISTINCT 
                       eg_wms_attendance_register.additionaldetails->>'projectType' as projectType, 
                       eg_wms_attendance_register.id 
                FROM eg_wms_attendance_register 
                INNER JOIN eg_wms_attendance_attendee 
                ON eg_wms_attendance_register.id = eg_wms_attendance_attendee.register_id  
                WHERE eg_wms_attendance_register.tenantid = %s 
                AND eg_wms_attendance_register.tenantid != 'od.testing' 
                AND eg_wms_attendance_register.lastmodifiedtime <= %s 
            ) as temptable 
            GROUP BY temptable.projectType;
        """, (tenant, epoch))
        
        result = cursor.fetchall()
        print(result)

        if not result:
            dataSet = pd.DataFrame([['NA', 0]], columns=['Project Type', tenant.replace("od.", "")])
        else:
            dataSet = pd.DataFrame(result, columns=['Project Type', tenant.replace("od.", "")])

        if counter == 1:
            data = dataSet
        else:
            data = pd.merge(data, dataSet, on='Project Type', how='outer')

    print(data)
    return data


def generateTotalAmountPaidAndCountOfBills(connection, epoch):
    cursor = connection.cursor()

    ############### WAGE BILL ############### 
    #Value of Wage Bill Paid
    cursor.execute("""select tenantid as ulb, sum(totalpaidamount) as amount from eg_expense_bill where businessservice='EXPENSE.WAGES' and paymentstatus='SUCCESSFUL' and lastmodifiedtime<=%s group by tenantid order by tenantid;""", (epoch,))
    result = cursor.fetchall()
    valueWageBillDataFrame = pd.DataFrame(result)

    #Value of Wage Bill Paid PARTIAL
    cursor.execute("""select  sum(totalpaidamount) as amount, tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.WAGES' and paymentstatus='PARTIAL' and lastmodifiedtime<=%s group by tenantid order by tenantid;""", (epoch,))
    result = cursor.fetchall()
    valueWageBillPartialDataFrame = pd.DataFrame(result)

    #Count of Wage Bills Paid
    cursor.execute("""select count(*) as num, tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.WAGES' and lastmodifiedtime<=%s and paymentstatus='SUCCESSFUL' group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    countWageBillPaidDataFrame = pd.DataFrame(result)

    #Count of Wage Bills Paid PARTIAL
    cursor.execute("""select count(*) as num, tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.WAGES' and lastmodifiedtime<=%s and paymentstatus='PARTIAL' group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    countWageBillPartialPaidDataFrame = pd.DataFrame(result)

    #Count of Wage Bills Created
    cursor.execute("""select count(*) as num,tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.WAGES' and lastmodifiedtime<=%s Group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    countWageBillCreatedDataFrame = pd.DataFrame(result)

    #Value of Wage Bills Created
    cursor.execute("""select sum(totalamount),tenantid from eg_expense_bill where businessservice='EXPENSE.WAGES' and lastmodifiedtime<=%s Group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    valueWageBillCreatedDataFrame = pd.DataFrame(result)


    ###############Purchase Bill###############
    #Value of Purchase Bill Paid
    cursor.execute("""select sum(totalpaidamount) as amount,tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.PURCHASE' and paymentstatus='SUCCESSFUL' and lastmodifiedtime<=%s Group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    valuePurchaseBillDataFrame = pd.DataFrame(result)

    #Value of Purchase Bill Paid PARTIAL
    cursor.execute("""select sum(totalpaidamount) as amount,tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.PURCHASE' and paymentstatus='PARTIAL' and lastmodifiedtime<=%s Group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    valuePurchaseBillPartialDataFrame = pd.DataFrame(result)

    #Count of Purchase Bills Paid
    cursor.execute("""select count(*) as num, tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.PURCHASE' and lastmodifiedtime<=%s and paymentstatus='SUCCESSFUL' group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    countPurchaseBillPaidDataFrame = pd.DataFrame(result)

    #Count of Purchase Bills Paid PARTIAL
    cursor.execute("""select count(*) as num, tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.PURCHASE' and lastmodifiedtime<=%s and paymentstatus='PARTIAL' group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    countPurchaseBillPartialPaidDataFrame = pd.DataFrame(result)

    #Count of Purchase Bills Created
    cursor.execute("""select count(*) as num,tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.PURCHASE' and lastmodifiedtime<=%s Group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    countPurchaseBillCreatedDataFrame = pd.DataFrame(result)

    #Value of Purchase Bills Created
    cursor.execute("""select sum(totalamount) as amount,tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.PURCHASE' and lastmodifiedtime<=%s Group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    valuePurchaseBillCreatedDataFrame = pd.DataFrame(result)


    ###############Supervision Bill###############
    #Value of Supervision Bill Paid
    cursor.execute("""select sum(totalpaidamount) as amount,tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.SUPERVISION' and paymentstatus='SUCCESSFUL' and lastmodifiedtime<=%s Group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    valueSupervisionBillDataFrame = pd.DataFrame(result)

    #Value of Supervision Bill Paid PARTIAL
    cursor.execute("""select sum(totalpaidamount) as amount,tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.SUPERVISION' and paymentstatus='PARTIAL' and lastmodifiedtime<=%s Group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    valueSupervisionBillPartialDataFrame = pd.DataFrame(result)


    #Count of Supervision Bills Paid
    cursor.execute("""select count(*) as num, tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.SUPERVISION' and lastmodifiedtime<=%s and paymentstatus='SUCCESSFUL' group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    countSupervisionBillPaidDataFrame = pd.DataFrame(result)

    #Count of Supervision Bills Paid Partial
    cursor.execute("""select count(*) as num, tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.SUPERVISION' and lastmodifiedtime<=%s and paymentstatus='PARTIAL' group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    countSupervisionBillPartialPaidDataFrame = pd.DataFrame(result)


    #Count of Supervision Bills Created
    cursor.execute("""select count(*) as num,tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.SUPERVISION' and lastmodifiedtime<=%s Group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    countSupervisionBillCreatedDataFrame = pd.DataFrame(result)

    #Value of Supervision Bills Created
    cursor.execute("""select sum(totalamount) as amount,tenantid as ulb from eg_expense_bill where businessservice='EXPENSE.SUPERVISION' and lastmodifiedtime<=%s Group by tenantid;""", (epoch,))
    result = cursor.fetchall()
    valueSupervisionBillCreatedDataFrame = pd.DataFrame(result)


    #Prepare column
    valueWageBillDataFrame.columns = ['ulb', 'Value of Wage Bill Paid']
    countWageBillPaidDataFrame.columns = ['Count of Wage Bills Paid', 'ulb']
    countWageBillCreatedDataFrame.columns = ['Count of Wage Bills Created','ulb']
    valueWageBillCreatedDataFrame.columns = ['Value of Wage Bills Created', 'ulb']
    valueWageBillPartialDataFrame.columns=['Value of Wage Bill Paid Partial','ulb']
    countWageBillPartialPaidDataFrame.columns= ['Count of Wage Bills Paid Partial','ulb']

    valuePurchaseBillDataFrame.columns = ['Value of Purchase Bill Paid','ulb']
    countPurchaseBillPaidDataFrame.columns = ['Count of Purchase Bills Paid','ulb']
    countPurchaseBillCreatedDataFrame.columns = ['Count of Purchase Bills Created','ulb']
    valuePurchaseBillCreatedDataFrame.columns = ['Value of Purchase Bills Created','ulb']
    valuePurchaseBillPartialDataFrame.columns=['Value of Purchase Bill Paid Partial','ulb']
    countPurchaseBillPartialPaidDataFrame.columns= ['Count of Purchase Bills Paid Partial','ulb']

    valueSupervisionBillDataFrame.columns = ['Value of Supervision Bill Paid','ulb']
    countSupervisionBillPaidDataFrame.columns = ['Count of Supervision Bills Paid','ulb']
    countSupervisionBillCreatedDataFrame.columns = ['Count of Supervision Bills Created','ulb']
    valueSupervisionBillCreatedDataFrame.columns = ['Value of Supervision Bills Created','ulb']
    valueSupervisionBillPartialDataFrame.columns=['Value of Supervision Bill Paid Partial','ulb']
    countSupervisionBillPartialPaidDataFrame.columns= ['Count of Supervision Bills Paid Partial','ulb']

    #####################################

    data = pd.DataFrame()
    data=pd.merge(countWageBillCreatedDataFrame,valueWageBillCreatedDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,valueWageBillDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,countWageBillPaidDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,valueWageBillPartialDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,countWageBillPartialPaidDataFrame,left_on='ulb',right_on='ulb',how='left')

    data=pd.merge(data,valuePurchaseBillDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,countPurchaseBillPaidDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,countPurchaseBillCreatedDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,valuePurchaseBillCreatedDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,valuePurchaseBillPartialDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,countPurchaseBillPartialPaidDataFrame,left_on='ulb',right_on='ulb',how='left')
    

    data=pd.merge(data,valueSupervisionBillDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,countSupervisionBillPaidDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,countSupervisionBillCreatedDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,valueSupervisionBillCreatedDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,valueSupervisionBillPartialDataFrame,left_on='ulb',right_on='ulb',how='left')
    data=pd.merge(data,countSupervisionBillPartialPaidDataFrame,left_on='ulb',right_on='ulb',how='left')

    
    print(data)
    return data

def generateTotalCountOnPILevel(connection, epoch_from, epoch_to):
    cursor = connection.cursor()
    
    ############## Impact On Ground Level ##############
    # Weekly Count
    cursor.execute("""SELECT SUM(beneficiarycount) AS total_beneficiary_count
        FROM (
            SELECT COUNT(DISTINCT beneficiaryid) AS beneficiarycount, tenantid
            FROM jit_beneficiary_details
            WHERE paymentstatus = 'Payment Successful' and lastmodifiedtime>%s and lastmodifiedtime<=%s group by tenantid) AS tempTable;""", (epoch_from, epoch_to))

    result_weekly = cursor.fetchall()
    ground_level_weekly_beneficiary_count = result_weekly[0][0]

    # Cummulative Count
    cursor.execute("""SELECT SUM(beneficiarycount) AS total_beneficiary_count
        FROM (
            SELECT COUNT(DISTINCT beneficiaryid) AS beneficiarycount, tenantid
            FROM jit_beneficiary_details
            WHERE paymentstatus = 'Payment Successful' and lastmodifiedtime<=%s group by tenantid) AS tempTable;""", (epoch_to,))

    result_cummulative = cursor.fetchall()
    ground_level_cummulative_beneficiary_count = result_cummulative[0][0]


    ############### Failure in JIT by PI: Count of failure PI's which hit the JIT system(Show number of PI failed) ##############
    # Weekly Count
    cursor.execute("""select sum(tempTable.count) from (select count(*), tenantid from jit_payment_inst_details where pistatus='FAILED'  and  lastmodifiedtime>%s and lastmodifiedtime<=%s  group by tenantid) as tempTable;""", (epoch_from, epoch_to))
    result_weekly = cursor.fetchall()
    failure_by_pi_weekly_beneficiary_count = result_weekly[0][0]

    # Cummulative Count
    cursor.execute("""select sum(tempTable.count) from (select count(*), tenantid from jit_payment_inst_details where pistatus='FAILED'  and lastmodifiedtime<=%s  group by tenantid) as tempTable;""", (epoch_to,))
    result_weekly = cursor.fetchall()
    failure_by_pi_cummulative_beneficiary_count = result_weekly[0][0]


    ############### Partial in JIT by PI: Count of Partial PI's which hit the JIT system ##############
    # Weekly Count
    cursor.execute("""SELECT SUM(beneficiarycount) AS total_beneficiary_count
        FROM (
            select count(*) AS beneficiarycount, tenantid from jit_payment_inst_details where pistatus='PARTIAL' and   lastmodifiedtime>%s and lastmodifiedtime<=%s group by tenantid
        ) AS tempTable;""", (epoch_from, epoch_to))

    result_weekly = cursor.fetchall()
    partial_by_pi_weekly_beneficiary_count = result_weekly[0][0]

    # Cummulative Count
    cursor.execute("""SELECT SUM(beneficiarycount) AS total_beneficiary_count
        FROM (
            select count(*) AS beneficiarycount, tenantid from jit_payment_inst_details where pistatus='PARTIAL' and lastmodifiedtime<=%s group by tenantid
        ) AS tempTable;""", (epoch_to,))

    result_weekly = cursor.fetchall()
    partial_by_pi_cummulative_beneficiary_count = result_weekly[0][0]


    ############### Successful in JIT by PI: Count of Successful PI's which hit the JIT system(Show number of PI Successful) ##############
    # Weekly Count
    cursor.execute("""SELECT SUM(beneficiarycount) AS total_beneficiary_count
        FROM (
            select count(*) AS beneficiarycount, tenantid from jit_payment_inst_details where pistatus not in ('FAILED', 'PARTIAL', 'COMPLETED', 'APPROVED', 'INITIATED') and     lastmodifiedtime>%s and lastmodifiedtime<=%s  group by tenantid 
        ) AS tempTable;""", (epoch_from, epoch_to))

    result_weekly = cursor.fetchall()
    successful_by_pi_weekly_beneficiary_count = result_weekly[0][0]

    # Cummulative Count
    cursor.execute("""SELECT SUM(beneficiarycount) AS total_beneficiary_count
        FROM (
            select count(*) AS beneficiarycount, tenantid from jit_payment_inst_details where pistatus not in ('FAILED', 'PARTIAL', 'COMPLETED', 'APPROVED', 'INITIATED') and lastmodifiedtime<=%s  group by tenantid 
        ) AS tempTable;""", (epoch_to,))

    result_weekly = cursor.fetchall()
    successful_by_pi_cummulative_beneficiary_count = result_weekly[0][0]


    ############### Failure in JIT by transaction: Count of failed transactions which hit the JIT system(Failed+Partial that are failed) ##############
    # Weekly Count
    cursor.execute("""SELECT SUM(beneficiarycount) AS total_beneficiary_count
        FROM (
            select count(beneficiarynumber) as beneficiarycount, jit_payment_inst_details.tenantid from jit_beneficiary_details inner join jit_payment_inst_details on jit_payment_inst_details.id=jit_beneficiary_details.piid where  pistatus in  ('FAILED','PARTIAL') and  jit_payment_inst_details.lastmodifiedtime>%s and jit_payment_inst_details.lastmodifiedtime<= %s and jit_beneficiary_details.paymentstatus='Payment Failed' Group by jit_payment_inst_details.tenantid
        ) AS tempTable;""", (epoch_from, epoch_to))

    result_weekly = cursor.fetchall()
    failure_by_transaction_weekly_beneficiary_count = result_weekly[0][0]

    # Cummulative Count
    cursor.execute("""SELECT SUM(beneficiarycount) AS total_beneficiary_count
        FROM (
            select count(beneficiarynumber) as beneficiarycount, jit_payment_inst_details.tenantid from jit_beneficiary_details inner join jit_payment_inst_details on jit_payment_inst_details.id=jit_beneficiary_details.piid where  pistatus in  ('FAILED','PARTIAL') and jit_payment_inst_details.lastmodifiedtime<= %s and jit_beneficiary_details.paymentstatus='Payment Failed' Group by jit_payment_inst_details.tenantid
        ) AS tempTable;""", (epoch_to,))

    result_weekly = cursor.fetchall()
    failure_by_transaction_cummulative_beneficiary_count = result_weekly[0][0]


    ############### Success in JIT by transaction: Count of successful transactions which hit the JIT system(Successful + Partial that is success) ##############
    # Weekly Count
    cursor.execute("""SELECT SUM(beneficiarycount) AS total_beneficiary_count
        FROM (
            select count(beneficiarynumber) as beneficiarycount, jit_payment_inst_details.tenantid from jit_beneficiary_details inner join jit_payment_inst_details on jit_payment_inst_details.id=jit_beneficiary_details.piid where  pistatus  in ('SUCCESSFUL', 'PARTIAL')  and jit_payment_inst_details.lastmodifiedtime>%s and jit_payment_inst_details.lastmodifiedtime<= %s and jit_beneficiary_details.paymentstatus='Payment Successful' Group by jit_payment_inst_details.tenantid
        ) AS tempTable;""", (epoch_from, epoch_to))

    result_weekly = cursor.fetchall()
    success_by_transaction_weekly_beneficiary_count = result_weekly[0][0]

    # Cummulative Count
    cursor.execute("""SELECT SUM(beneficiarycount) AS total_beneficiary_count
        FROM (
            select count(beneficiarynumber) as beneficiarycount, jit_payment_inst_details.tenantid from jit_beneficiary_details inner join jit_payment_inst_details on jit_payment_inst_details.id=jit_beneficiary_details.piid where  pistatus  in ('SUCCESSFUL', 'PARTIAL')  and jit_payment_inst_details.lastmodifiedtime<= %s and jit_beneficiary_details.paymentstatus='Payment Successful' Group by jit_payment_inst_details.tenantid
        ) AS tempTable;""", (epoch_to,))

    result_weekly = cursor.fetchall()
    success_by_transaction_cummulative_beneficiary_count = result_weekly[0][0]

    ####################################################################################3

    # Prepare the data with hardcoded names
    data = pd.DataFrame([
        {" ": "Impact On Ground", "weekly": ground_level_weekly_beneficiary_count, "cumulative": ground_level_cummulative_beneficiary_count},
        {" ": "Failure in JIT by PI: Count of failure PI's which hit the JIT system(Show number of PI failed) ", "weekly": failure_by_pi_weekly_beneficiary_count, "cumulative": failure_by_pi_cummulative_beneficiary_count},
        {" ": "Partial in JIT by PI: Count of Partial PI's which hit the JIT system", "weekly": partial_by_pi_weekly_beneficiary_count, "cumulative": partial_by_pi_cummulative_beneficiary_count},
        {" ": "Successful in JIT by PI: Count of Successful PI's which hit the JIT system(Show number of PI Successful)", "weekly": successful_by_pi_weekly_beneficiary_count, "cumulative": successful_by_pi_cummulative_beneficiary_count},
        {" ": "Failure in JIT by transaction: Count of failed transactions which hit the JIT system(Failed+Partial that are failed)", "weekly": failure_by_transaction_weekly_beneficiary_count, "cumulative": failure_by_transaction_cummulative_beneficiary_count},
        {" ": "Success in JIT by transaction: Count of successful transactions which hit the JIT system(Successful + Partial that is success)", "weekly": success_by_transaction_weekly_beneficiary_count, "cumulative": success_by_transaction_cummulative_beneficiary_count}
    ])

    print(data)
    return data


def generateCountBasedOnPIStatusCummulative(connection, epoch_to):
    cursor = connection.cursor()

    ################## INDIVIDUAL ##################
    # Successful Individual Count
    cursor.execute("""select jit_payment_inst_details.tenantid, count(distinct beneficiaryid) from jit_beneficiary_details inner join jit_payment_inst_details on jit_payment_inst_details.id=jit_beneficiary_details.piid where  jit_beneficiary_details.beneficiarytype='IND'  and jit_payment_inst_details.lastmodifiedtime<=%s and pistatus = 'SUCCESSFUL' group by pistatus ,jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    successful_individual = pd.DataFrame(result, columns=['ULB', 'Successful Individual'])

    # Partial Individual Count
    cursor.execute("""select jit_payment_inst_details.tenantid, count(distinct beneficiaryid) from jit_beneficiary_details inner join jit_payment_inst_details on jit_payment_inst_details.id=jit_beneficiary_details.piid where  jit_beneficiary_details.beneficiarytype='IND'  and jit_payment_inst_details.lastmodifiedtime<=%s and pistatus = 'PARTIAL' group by pistatus ,jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    partial_individual = pd.DataFrame(result, columns=['ULB', 'Partial Individual'])

    # Failure Individual Count
    cursor.execute("""select jit_payment_inst_details.tenantid, count(distinct beneficiaryid) from jit_beneficiary_details inner join jit_payment_inst_details on jit_payment_inst_details.id=jit_beneficiary_details.piid where  jit_beneficiary_details.beneficiarytype='IND'  and jit_payment_inst_details.lastmodifiedtime<=%s and pistatus = 'FAILED' group by pistatus ,jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    failed_individual = pd.DataFrame(result, columns=['ULB', 'Failed Individual'])

    ################## CBO ##################
    # Successful CBO Count
    cursor.execute("""
        SELECT jit_payment_inst_details.tenantid,
            COUNT(DISTINCT jit_beneficiary_details.beneficiaryid) AS distinct_beneficiary_count
        FROM jit_beneficiary_details
        INNER JOIN jit_payment_inst_details ON jit_payment_inst_details.muktareferenceid = jit_beneficiary_details.muktareferenceid
        INNER JOIN eg_org_function ON jit_beneficiary_details.beneficiaryid = eg_org_function.org_id
        WHERE jit_beneficiary_details.beneficiarytype = 'ORG' 
        AND jit_payment_inst_details.lastmodifiedtime <= %s
        AND jit_payment_inst_details.pistatus IN ('SUCCESSFUL')
        AND eg_org_function.category like '%%CBO%%'
        GROUP BY jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    successful_cbo = pd.DataFrame(result, columns=['ULB', 'Successful CBO'])

    # Partial CBO Count
    cursor.execute("""
        SELECT jit_payment_inst_details.tenantid,
            COUNT(DISTINCT jit_beneficiary_details.beneficiaryid) AS distinct_beneficiary_count
        FROM jit_beneficiary_details
        INNER JOIN jit_payment_inst_details ON jit_payment_inst_details.muktareferenceid = jit_beneficiary_details.muktareferenceid
        INNER JOIN eg_org_function ON jit_beneficiary_details.beneficiaryid = eg_org_function.org_id
        WHERE jit_beneficiary_details.beneficiarytype = 'ORG' 
        AND jit_payment_inst_details.lastmodifiedtime <= %s
        AND jit_payment_inst_details.pistatus IN ('PARTIAL')
        AND eg_org_function.category like '%%CBO%%'
        GROUP BY jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    partial_cbo = pd.DataFrame(result, columns=['ULB', 'Partial CBO'])

    # Failure CBO Count
    cursor.execute("""
        SELECT jit_payment_inst_details.tenantid,
            COUNT(DISTINCT jit_beneficiary_details.beneficiaryid) AS distinct_beneficiary_count
        FROM jit_beneficiary_details
        INNER JOIN jit_payment_inst_details ON jit_payment_inst_details.muktareferenceid = jit_beneficiary_details.muktareferenceid
        INNER JOIN eg_org_function ON jit_beneficiary_details.beneficiaryid = eg_org_function.org_id
        WHERE jit_beneficiary_details.beneficiarytype = 'ORG' 
        AND jit_payment_inst_details.lastmodifiedtime <= %s
        AND jit_payment_inst_details.pistatus IN ('FAILED')
        AND eg_org_function.category like '%%CBO%%'
        GROUP BY jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    failed_cbo = pd.DataFrame(result, columns=['ULB', 'Failed CBO'])

    ######################### VENDOR ##########################
    # Successful Vendor Count
    cursor.execute("""
        SELECT jit_payment_inst_details.tenantid,
            COUNT(DISTINCT jit_beneficiary_details.beneficiaryid) AS distinct_beneficiary_count
        FROM jit_beneficiary_details
        INNER JOIN jit_payment_inst_details ON jit_payment_inst_details.muktareferenceid = jit_beneficiary_details.muktareferenceid
        INNER JOIN eg_org_function ON jit_beneficiary_details.beneficiaryid = eg_org_function.org_id
        WHERE jit_beneficiary_details.beneficiarytype = 'ORG' 
        AND jit_payment_inst_details.lastmodifiedtime <= %s
        AND jit_payment_inst_details.pistatus IN ('SUCCESSFUL')
        AND eg_org_function.category like '%%VEN%%'
        GROUP BY jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    successful_vendor = pd.DataFrame(result, columns=['ULB', 'Successful Vendor'])

    # Partial Vendor Count
    cursor.execute("""
        SELECT jit_payment_inst_details.tenantid,
            COUNT(DISTINCT jit_beneficiary_details.beneficiaryid) AS distinct_beneficiary_count
        FROM jit_beneficiary_details
        INNER JOIN jit_payment_inst_details ON jit_payment_inst_details.muktareferenceid = jit_beneficiary_details.muktareferenceid
        INNER JOIN eg_org_function ON jit_beneficiary_details.beneficiaryid = eg_org_function.org_id
        WHERE jit_beneficiary_details.beneficiarytype = 'ORG' 
        AND jit_payment_inst_details.lastmodifiedtime <= %s
        AND jit_payment_inst_details.pistatus IN ('PARTIAL')
        AND eg_org_function.category like '%%VEN%%'
        GROUP BY jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    partial_vendor = pd.DataFrame(result, columns=['ULB', 'Partial Vendor'])

    # Failure Vendor Count
    cursor.execute("""
        SELECT jit_payment_inst_details.tenantid,
            COUNT(DISTINCT jit_beneficiary_details.beneficiaryid) AS distinct_beneficiary_count
        FROM jit_beneficiary_details
        INNER JOIN jit_payment_inst_details ON jit_payment_inst_details.muktareferenceid = jit_beneficiary_details.muktareferenceid
        INNER JOIN eg_org_function ON jit_beneficiary_details.beneficiaryid = eg_org_function.org_id
        WHERE jit_beneficiary_details.beneficiarytype = 'ORG' 
        AND jit_payment_inst_details.lastmodifiedtime <= %s
        AND jit_payment_inst_details.pistatus IN ('FAILED')
        AND eg_org_function.category like '%%VEN%%'
        GROUP BY jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    failed_vendor = pd.DataFrame(result, columns=['ULB', 'Failed Vendor'])

    ####################### DEPT ########################
    # Successful Dept Count
    cursor.execute("""select jit_payment_inst_details.tenantid, count(distinct beneficiaryid) from jit_beneficiary_details inner join jit_payment_inst_details on jit_payment_inst_details.id=jit_beneficiary_details.piid where  jit_beneficiary_details.beneficiarytype='DEPT' and jit_payment_inst_details.lastmodifiedtime<=%s and pistatus in ('SUCCESSFUL')group by jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    successful_dept = pd.DataFrame(result, columns=['ULB', 'Successful Dept'])

    # Partial Dept Count
    cursor.execute("""select jit_payment_inst_details.tenantid, count(distinct beneficiaryid) from jit_beneficiary_details inner join jit_payment_inst_details on jit_payment_inst_details.id=jit_beneficiary_details.piid where  jit_beneficiary_details.beneficiarytype='DEPT' and jit_payment_inst_details.lastmodifiedtime<=%s and pistatus in ('PARTIAL')group by jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    partial_dept = pd.DataFrame(result, columns=['ULB', 'Partial Dept'])

    # Failed Dept Count
    cursor.execute("""select jit_payment_inst_details.tenantid, count(distinct beneficiaryid) from jit_beneficiary_details inner join jit_payment_inst_details on jit_payment_inst_details.id=jit_beneficiary_details.piid where  jit_beneficiary_details.beneficiarytype='DEPT' and jit_payment_inst_details.lastmodifiedtime<=%s and pistatus in ('FAILED')group by jit_payment_inst_details.tenantid;""", (epoch_to,))
    result = cursor.fetchall()
    failed_dept = pd.DataFrame(result, columns=['ULB', 'Failed Dept'])

    ############################################################################################

    data = pd.merge(successful_individual, partial_individual, on='ULB', how='outer')
    data = pd.merge(data, failed_individual, on='ULB', how='outer')
    data = pd.merge(data, successful_cbo, on='ULB', how='outer')
    data = pd.merge(data, partial_cbo, on='ULB', how='outer')
    data = pd.merge(data, failed_cbo, on='ULB', how='outer')
    data = pd.merge(data, successful_vendor, on='ULB', how='outer')
    data = pd.merge(data, partial_vendor, on='ULB', how='outer')
    data = pd.merge(data, failed_vendor, on='ULB', how='outer')
    data = pd.merge(data, successful_dept, on='ULB', how='outer')
    data = pd.merge(data, partial_dept, on='ULB', how='outer')
    data = pd.merge(data, failed_dept, on='ULB', how='outer')

    print(data)
    return data



def writeDataToCSV(data, filename):
    if data.empty:
        print("No data to write.")
        return
    data.to_csv(filename, index=False)

if __name__ == '__main__':
    try:
        logging.info('Report Started Generating')

        directory = '/data-mart-demo/data-mart-reports'
        if not os.path.exists(directory):
            os.makedirs(directory)
        
        # Get the epoch time of the latest Thursday 3:30 PM
        epoch_to = get_last_thursday_epoch()
        # Get the epoch time exactly 7 days before the epoch
        epoch_start = epoch_to - 7 * 24 * 3600 * 1000   # Subtract 7 days in milliseconds

        # Get current date in ddmmyyyy format
        current_date = dt.datetime.now().strftime('%d%m%Y')

        # Generate filenames with the current date
        mukta_datamart_filename = f"{directory}/mukta_datamart_report_{current_date}.csv"
        project_type_filename = f"{directory}/project_type_report_{current_date}.csv"
        amount_paid_bill_count_data_filename = f"{directory}/amount_paid_bill_count_report_{current_date}.csv"
        pi_level_count_data_filename = f"{directory}/pi_level_count_report_{current_date}.csv"
        pi_status_count_data_cumulative_filename = f"{directory}/pi_status_count_cumulative_report_{current_date}.csv"

        connection = connect_to_database()
        print("Connected to PostgreSQL")

        # # Generate Mukta Datamart Basic Report
        # mukta_datamart_basic_data = generateBasicInformations(connection, epoch_to)
        # mukta_datamart_basic_data_file_path = os.path.join(directory, mukta_datamart_filename)
        # writeDataToCSV(mukta_datamart_basic_data, mukta_datamart_basic_data_file_path)

        # # Generate Mukta Datamart Project Type Report
        # mukta_datamart_project_type_data = generateTotalCountByProjectType(connection, epoch_to)
        # project_type_data_file_path = os.path.join(directory, project_type_filename)
        # writeDataToCSV(mukta_datamart_project_type_data, project_type_data_file_path)

        # # Generate Total amount paid and Count of bills
        # amount_paid_bill_count_data = generateTotalAmountPaidAndCountOfBills(connection, epoch_to)
        # amount_paid_bill_count_data_file_path = os.path.join(directory, amount_paid_bill_count_data_filename)
        # writeDataToCSV(amount_paid_bill_count_data, amount_paid_bill_count_data_file_path)

        # # Generate PI level count report
        # pi_level_count_data = generateTotalCountOnPILevel(connection, epoch_start, epoch_to)
        # pi_level_count_data_file_path = os.path.join(directory, pi_level_count_data_filename)
        # writeDataToCSV(pi_level_count_data, pi_level_count_data_file_path)

        # Generate Count Based On PI Status
        pi_status_count_data_cumulative = generateCountBasedOnPIStatusCummulative(connection, epoch_to)
        pi_status_count_data_cumulative_file_path = os.path.join(directory, pi_status_count_data_cumulative_filename)
        writeDataToCSV(pi_status_count_data_cumulative, pi_status_count_data_cumulative_file_path)

        logging.info('Report Generated Successfully')
        print(f"Reports saved in directory: {directory}")


    except Exception as ex:
        logging.error("Exception occured on main.", exc_info=True)
        raise(ex)