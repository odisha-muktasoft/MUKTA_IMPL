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

def get_request_info():
    return {
        "apiId": "Rainmaker",
        # "ver": null,
        # "ts": null,
        # "action": null,
        # "did": null,
        # "key": null,
        "msgId": "1686748436982|en_IN",
        "authToken": "83bcae7a-65e8-4ddb-a3d3-12b36bbabbc7",
        # "plainAccessRequest": {
        #     # "recordId": null,
        #     # "plainRequestFields": null
        # },
        "userInfo": {
            "id": 965,
            "uuid": "ee3379e9-7f25-4be8-9cc1-dc599e1668c9",
            "roles": [
                {
                    "name": "HRMS Admin",
                    "code": "HRMS_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "WORK ORDER VIEWER",
                    "code": "WORK_ORDER_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "National Dashboard Admin",
                    "code": "NATADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Birth Application Viewer",
                    "code": "BIRTH_APPLICATION_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Redressal Officer",
                    "code": "RO",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Works Bill Creator",
                    "code": "WORKS_BILL_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Collection Report Viewer",
                    "code": "COLL_REP_VIEW",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Contractor Advance creator",
                    "code": "CONTRACTOR_ADVANCE_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Works Approver",
                    "code": "WORKS_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "WS Receipt Cancellator",
                    "code": "CR_WS",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Property Approver",
                    "code": "PROPERTY_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "TL Approver",
                    "code": "TL_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "LOI APPROVER",
                    "code": "LOI_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "EST CREATOR",
                    "code": "EST_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Fire Noc Department Approver",
                    "code": "FIRE_NOC_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "HCM SYSTEM ADMINISTRATOR",
                    "code": "SYSTEM_ADMINISTRATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PT Field Inspector",
                    "code": "PT_FIELD_INSPECTOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Abstract Estimate Creator",
                    "code": "AE_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "ULB Administrator",
                    "code": "PTADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "MUKTA Admin",
                    "code": "MUKTA_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Works Administrator",
                    "code": "WORKS_ADMINISTRATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPA Builder",
                    "code": "BPA_BUILDER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Finance Voucher Creator",
                    "code": "EGF_VOUCHER_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Collections Remitter",
                    "code": "COLL_REMIT_TO_BANK",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "ESTIMATE APPROVER",
                    "code": "ESTIMATE_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Auto Escalation Employee",
                    "code": "AUTO_ESCALATE",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "MB_VERIFIER",
                    "code": "MB_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "EST FIN SANC",
                    "code": "EST_FIN_SANC",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PGR Last Mile Employee",
                    "code": "PGR_LME",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "DEATH Application Editor",
                    "code": "DEATH_APPLICATION_EDITOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "MUSTER ROLL APPROVER",
                    "code": "MUSTER_ROLL_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "WS Approver",
                    "code": "WS_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Finance Voucher Approver",
                    "code": "EGF_VOUCHER_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PQM TP OPERATOR",
                    "code": "PQM_TP_OPERATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Grivance Administrator",
                    "code": "GA",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BILL_ACCOUNTANT",
                    "code": "BILL_ACCOUNTANT",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BILL_VERIFIER",
                    "code": "BILL_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "TL Counter Employee",
                    "code": "TL_CEMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Property Tax Collection Employee",
                    "code": "PT_COLLECTION_EMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "TL Report Viewer",
                    "code": "TL_REPORT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "FSM Desluding Operator",
                    "code": "FSM_DSO",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "FSM Employee Application Viewer",
                    "code": "FSM_VIEW_EMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPAREG doc verifier",
                    "code": "BPAREG_DOC_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Asset Administrator",
                    "code": "ASSET_ADMINISTRATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PGR Administrator",
                    "code": "PGR-ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Field Employee",
                    "code": "FEMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Counter Employee",
                    "code": "CEMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Death Application Viewer",
                    "code": "DEATH_APPLICATION_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Admin of a ULB",
                    "code": "CITY_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BILL_CREATOR",
                    "code": "BILL_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Collection Operator",
                    "code": "COLL_OPERATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "FSM Employee Application Editor",
                    "code": "FSM_EDITOR_EMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPAREG Approver",
                    "code": "BPAREG_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "FSM Driver",
                    "code": "FSM_DRIVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "WORK ORDER CREATOR",
                    "code": "WORK_ORDER_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Death Application Creator",
                    "code": "DEATH_APPLICATION_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Internal Microservice Role",
                    "code": "INTERNAL_MICROSERVICE_ROLE",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "AssetCreator",
                    "code": "AssetCreator",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "EGF Bill Creator",
                    "code": "EGF_BILL_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Employee Finance",
                    "code": "EMPLOYEE_FINANCE",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Sanitation Helper",
                    "code": "SANITATION_HELPER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Legacy Receipt Creator",
                    "code": "LEGACY_RECEIPT_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "QA Automation",
                    "code": "QA_AUTOMATION",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "MB_CREATOR",
                    "code": "MB_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "TL Field Inspector",
                    "code": "TL_FIELD_INSPECTOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Organization admin",
                    "code": "ORG_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BILL_APPROVER",
                    "code": "BILL_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPA Architect",
                    "code": "BPA_ARCHITECT",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "MUSTER ROLL VERIFIER",
                    "code": "MUSTER_ROLL_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Citizen",
                    "code": "CITIZEN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPA Field Inspector",
                    "code": "BPA_FIELD_INSPECTOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Employee Common",
                    "code": "EMPLOYEE_COMMON",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Localisation admin",
                    "code": "LOC_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BILL_VIEWER",
                    "code": "BILL_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPA Services verifier",
                    "code": "BPA_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPA Engineer",
                    "code": "BPA_ENGINEER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "FSM FSTP Opperator",
                    "code": "FSM_EMP_FSTPO",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Universal Collection Employee",
                    "code": "UC_EMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "NoC Field Inpector",
                    "code": "NOC_FIELD_INSPECTOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "FSM Employee Application Creator",
                    "code": "FSM_CREATOR_EMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PT Counter Approver",
                    "code": "PT_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "EST TECH SANC",
                    "code": "EST_ADMIN_SANC",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "ESTIMATE CREATOR",
                    "code": "ESTIMATE_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PQM Admin",
                    "code": "PQM_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "NoC Doc Verifier",
                    "code": "NOC_DOC_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Anonymous User",
                    "code": "ANONYMOUS",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Citizen Feedback Centre",
                    "code": "CFC",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "State Dashboard Admin",
                    "code": "STADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Financials Approver",
                    "code": "WORKS_FINANCIAL_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "ESTIMATE VERIFIER",
                    "code": "ESTIMATE_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PTIS Master",
                    "code": "PTIS_MASTER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "CSC Collection Operator",
                    "code": "CSC_COLL_OPERATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Birth Report Viewer",
                    "code": "BIRTH_REPORT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "LOI CREATOR",
                    "code": "LOI_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "ULB Operator",
                    "code": "ULB_OPERATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Commissioner",
                    "code": "COMMISSIONER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "EGF Bill Approver",
                    "code": "EGF_BILL_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Finance Payment Creator",
                    "code": "EGF_PAYMENT_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "NoC counter Approver",
                    "code": "NOC_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Sanitation Worker",
                    "code": "SANITATION_WORKER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPA Structural Engineer",
                    "code": "BPA_STRUCTURALENGINEER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "OFFICER IN CHARGE",
                    "code": "OFFICER_IN_CHARGE",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Department Grievance Routing Officer",
                    "code": "DGRO",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPA Services Approver",
                    "code": "BPA_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PROJECT CREATOR",
                    "code": "PROJECT_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Water Report Viewer",
                    "code": "WATER_REPORT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Finance Master Admin",
                    "code": "EGF_MASTER_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPA Town Planner",
                    "code": "BPA_TOWNPLANNER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "EMPLOYEE ADMIN",
                    "code": "EMPLOYEE_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Finance Adminsitrator",
                    "code": "EGF_ADMINISTRATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "FSM Payment Collector",
                    "code": "FSM_COLLECTOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PT Report Viewer",
                    "code": "PT_REPORT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Sewerage Report Viewer",
                    "code": "SEWERAGE_REPORT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "MB_APPROVER",
                    "code": "MB_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPA Supervisor",
                    "code": "BPA_SUPERVISOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Birth Application Creator",
                    "code": "BIRTH_APPLICATION_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Any User",
                    "code": "ANONYMUS",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "WS Field Inspector",
                    "code": "WS_FIELD_INSPECTOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Property Verifier",
                    "code": "PROPERTY_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Finance Payment Approver",
                    "code": "EGF_PAYMENT_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Birth and Death Dashboard User",
                    "code": "DASHBOARD_REPORT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PQM CRONJOB SCHEDULER",
                    "code": "PQM_CRONJOB_SCHEDULER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "FSM Employee Report Viewer",
                    "code": "FSM_REPORT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "EST TECH SANC",
                    "code": "EST_TECH_SANC",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Auto Escalation Supervisor",
                    "code": "SUPERVISOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "WORK ORDER VERIFIER",
                    "code": "WORK_ORDER_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Detailed Estimate Creator",
                    "code": "DE_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "AssetReportViewer",
                    "code": "AssetReportViewer",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "SW Approver",
                    "code": "SW_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Birth and Death User",
                    "code": "BND_CEMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "TECHNICAL SANCTIONER",
                    "code": "TECHNICAL_SANCTIONER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Works Master creator",
                    "code": "WORKS_MASTER_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Birth Application Editor",
                    "code": "BIRTH_APPLICATION_EDITOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Death Report Viewer",
                    "code": "DEATH_REPORT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "National Dashboard Systeme user",
                    "code": "NDA_SYSTEM",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Fire Noc Report Viewer",
                    "code": "FIRENOC_REPORT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "SUPER USER",
                    "code": "SUPERUSER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPA NOC Verifier",
                    "code": "BPA_NOC_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "FSM Employee Dashboard Viewer",
                    "code": "FSM_DASHBOARD_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Employee",
                    "code": "EMPLOYEE",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Collections Receipt Creator",
                    "code": "COLL_RECEIPT_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PT Doc Verifier",
                    "code": "PT_DOC_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "FSM Administrator",
                    "code": "FSM_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "OBPS Report Viewer",
                    "code": "OBPS_REPORT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Bank Collection Operator",
                    "code": "BANK_COLL_OPERATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "CBO ADMIN",
                    "code": "CBO_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Airport authority Approver",
                    "code": "AIRPORT_AUTHORITY_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "TL Admin",
                    "code": "TL_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "TL Creator",
                    "code": "TL_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "SW Field Inspector",
                    "code": "SW_FIELD_INSPECTOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Customer Support Representative",
                    "code": "CSR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Reindexing Role",
                    "code": "REINDEXING_ROLE",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "WO Creator",
                    "code": "WO_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PT Counter Employee",
                    "code": "PT_CEMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PTIS Admin",
                    "code": "PTIS_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "TL doc verifier",
                    "code": "TL_DOC_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "ESTIMATE VIEWER",
                    "code": "ESTIMATE_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Property Tax Receipt Cancellator",
                    "code": "CR_PT",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "WS Counter Employee",
                    "code": "WS_CEMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "EST_CHECKER",
                    "code": "EST_CHECKER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "JUNIOR ENGINEER",
                    "code": "JUNIOR_ENGINEER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "LOI CHECKER",
                    "code": "LOI_CHECKER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "NoC counter employee",
                    "code": "NOC_CEMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "LOA Creator",
                    "code": "LOA_CREATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Finance Report View",
                    "code": "EGF_REPORT_VIEW",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "WS Document Verifier",
                    "code": "WS_DOC_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PROJECT VIEWER",
                    "code": "PROJECT_VIEWER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Grievance Routing Officer",
                    "code": "GRO",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Organization staff",
                    "code": "ORG_STAFF",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "SW Document Verifier",
                    "code": "SW_DOC_VERIFIER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "MUNICIPAL ENGINEER",
                    "code": "MUNICIPAL_ENGINEER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "SW Clerk",
                    "code": "SW_CLERK",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "PQM Lab Operator",
                    "code": "PQM_LAB_OPERATOR",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "WORK ORDER APPROVER",
                    "code": "WORK_ORDER_APPROVER",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "Grievance Officer",
                    "code": "GO",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "WS Clerk",
                    "code": "WS_CLERK",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "SW Counter Employee",
                    "code": "SW_CEMP",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "MDMS Admin",
                    "code": "MDMS_ADMIN",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "BPAREG Employee",
                    "code": "BPAREG_EMPLOYEE",
                    "tenantId": "pg.citya"
                },
                {
                    "name": "MB_VIEWER",
                    "code": "MB_VIEWER",
                    "tenantId": "pg.citya"
                }
            ]
        }
    }

def search_payment_instruction_from_ifms_adapter(id):
    print("search_payment_instruction_from_ifms_adapter")
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
    print("search_disburse_from_program_service")
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

        print(api_url)

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
    print("modify_disburse")
    disbursement['status'] = {
        'status_code': payment['piStatus'],
        'status_message': payment['piStatus']
    }
    if 'additional_details' in disbursement:
        disbursement['additional_details']['piStatus'] = payment['piStatus']
    
    for beneficiary in payment['beneficiaryDetails']:
        for child in disbursement['children']:
            if beneficiary['beneficiaryId'] == child['additional_details']['beneficiaryId']:
                child['additional_details']['beneficiaryStatus'] = beneficiary['paymentStatus']
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
    print("call_on_disburse_update_api")
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
                "message_ts": disburse['audit_details']['lastModifiedTime'],
                "message_type": "on-disburse",
                "action": "update",
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
            "f7640e32-395d-4d02-ac4e-e438a9e73527",
            "41325882-c221-42b9-b48a-fbbdda838557",
            "37d1813f-d280-400c-9e18-8d3cd54426bd",
            "7bf0eb43-a0ce-42b9-97f7-d18b1efcc1d5",
            "9e4c388f-e630-494f-b5dc-f407eadfee67",
            "4f869d7f-784f-4edc-9b28-9a5c0ce95a46",
            "6ce788b7-16ca-4568-b3e1-b936b6468091",
            "8ef55728-5c7f-4f10-ad40-d07c00ca5c18",
            "ba0ccf92-785b-48b1-bd2b-6f184596049a",
            "1296692d-62c8-4b7c-bb4b-4b06057c228c",
            "be693c48-5ef1-4564-8d89-5026bcd97de6",
            "3a620694-a645-40b5-97a7-2f5012d2ad97",
            "6277b5f6-e9ca-4ac9-9a0b-926d02683bf7",
            "17974b01-7b47-489c-8ce6-0f70e49bc78a",
            "8d6aec24-61eb-406d-ba45-c875a62919f9",
            "5ba6bc92-4471-4989-a3b0-d24765f9ce05",
            "f2bc192f-6598-4224-84d6-46e187f54a10",
            "8b155250-bbf3-45ae-b762-efe596789a2b",
            "fcecb2c7-6257-4662-befb-a59c6d72ebd5",
            "0f61388c-9503-43a7-9f50-65bab4a214ea",
            "6e0e1fb1-7f13-45cb-a1be-386f2ab83e75",
            "a8c4efb2-ebb3-4a01-8f92-8d31eaccd162",
            "4d00bd72-be4e-41f6-b168-a8699adb8852",
            "1a213396-e702-47c7-8a7e-23b66a826c5f",
            "9dc0fe53-a70c-4dd4-9c21-8bc6e1882f5a",
            "525bd4d1-842b-41a6-b448-1a5a018257e7",
            "e4a38612-f7e2-4de6-833a-a98468f25fc8",
            "ac55611e-f8c2-4a53-a29f-ac7823e9204e",
            "ac56aa08-9e91-4e3c-a059-079a9b306991",
            "43c48a7a-041d-4462-9c36-ab02e5990a97",
            "c63d9f51-89d3-4a5a-87eb-bb4414672e89",
            "f8025575-2717-478a-8fbe-e55d77b56a96",
            "3e977032-a8b7-4ab1-ad9e-9e7588ac7f05",
            "fa57d100-f417-4df3-b0d3-af5b9953a619",
            "da56e7b5-bbf0-4213-bf05-354b56400bda",
            "118bfc9b-b71f-497b-b312-2adcc2e8377a",
            "abfe7a55-2ba3-4bf1-b1c8-ef9fa79d75c1",
            "34718c2c-70ca-47b2-9d23-23eec488aa9b",
            "ef18d4cb-efeb-4eeb-9330-a1a8872e43b1",
            "ebf25eb9-5839-49ff-8ac6-f3ea022de50b",
            "adc95c3f-0322-4d5f-bed7-c62df18575f4",
            "bd9477b7-bdbb-4e9a-aef2-3f28b6f48644",
            "de78154b-005e-4627-98d0-b5030d7d6179",
            "db771ab7-4283-47b3-b871-a3712ce63362",
            "63447c61-8021-4b4e-803e-292092110842",
            "a95cb2f1-629a-41eb-8230-b00c78dfd3d9",
            "0824984b-c9a2-487a-b561-277efee2f491",
            "e01c0fb7-f240-47dd-bc06-48438540f1c5",
            "a33056d4-9109-4b02-87d2-f6e1518e4dac",
            "e257b3a5-99c4-4a91-8052-7543e7216ab1",
            "62d2ae15-385c-4d5e-b120-94993e9a8abd",
            "530050e4-bb45-4f08-9155-2f98fa91fff5",
            "262db5f5-73a6-44b8-ad89-ef4c33496e1e",
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
            "4e84bc6b-1d97-4b6c-8f94-cd61cfd240de",
            "bf3eb4ce-e581-45e7-9e13-721ba075d84b",
            "300eeb38-0725-40e7-b2c8-76fa44a45bf0",
            "a80e0d63-54cf-49a7-9e06-b3b398a7d818",
            "47a6a65d-5178-4b13-a863-59915c2099f0",
            "07775cf5-e6e9-4ca9-ae7f-8b7931a1cef6",
            "7217eae6-d05f-4960-9607-5d394f6a8129",
            "77fb4201-c579-47a7-b892-da73f0aece58",
            "c21688b2-c376-40c2-95f0-8b1338ae4553",
            "aff34fc2-bf19-45c3-a69f-9800f1fd912e",
            "6c29a890-762d-411d-a0c3-1523395607e7",
            "071afd61-fced-4cb6-a085-a4f338e9f085",
            "7677e757-0371-4247-9833-fbf7be2a7e1c",
            "aff14000-116c-4845-b963-a9a3c3c89c04",
            "cecf628d-3ee3-483d-840f-73bd89dc9e0e",
            "63edd1b7-3e9d-4253-862f-f9efbb15cd36",
            "042c4ff6-a34d-4662-bd4a-89a8ba57f3c2",
            "ad5df9ff-14ef-4538-87dd-0d0ae46e838a"
        ]
    for id in ids:
        payments = search_payment_instruction_from_ifms_adapter(id)
        payment = payments[0]
        if payment:
            tenantid = payment.get('tenantId')
            disbursements = search_disburse_from_program_service(id, tenantid)
            disbursement = disbursements[0]
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