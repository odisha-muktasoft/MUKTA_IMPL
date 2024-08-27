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
        epoch = get_last_thursday_epoch()

        # Get current date in ddmmyyyy format
        current_date = dt.datetime.now().strftime('%d%m%Y')

        # Generate filenames with the current date
        mukta_datamart_filename = f"{directory}/mukta_datamart_report_{current_date}.csv"
        project_type_filename = f"{directory}/project_type_report_{current_date}.csv"

        connection = connect_to_database()
        print("Connected to PostgreSQL")

        # Generate Mukta Datamart Basic Report
        mukta_datamart_basic_data = generateBasicInformations(connection, epoch)
        mukta_datamart_basic_data_file_path = os.path.join(directory, mukta_datamart_filename)
        writeDataToCSV(mukta_datamart_basic_data, mukta_datamart_basic_data_file_path)

        # Generate Mukta Datamart Project Type Report
        mukta_datamart_project_type_data = generateTotalCountByProjectType(connection, epoch)
        project_type_data_file_path = os.path.join(directory, project_type_filename)
        writeDataToCSV(mukta_datamart_project_type_data, project_type_data_file_path)

        logging.info('Report Generated Successfully')
        print(f"Reports saved in directory: {directory}")


    except Exception as ex:
        logging.error("Exception occured on main.", exc_info=True)
        raise(ex)