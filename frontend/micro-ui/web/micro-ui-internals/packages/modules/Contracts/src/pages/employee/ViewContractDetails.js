import React, { useState, useEffect, Fragment, useRef }from 'react';
import { useTranslation } from "react-i18next";
import { useHistory } from 'react-router-dom';
import { Menu, Header, SubmitBar,ViewDetailsCard, Loader, WorkflowActions, MultiLink } from '@egovernments/digit-ui-react-components';
import { isWorkEndInPreviousWeek } from '../../../utils';
import {Toast,Button,ActionBar,Tab} from '@egovernments/digit-ui-components'

const ViewContractDetails = () => {
    const { t } = useTranslation();
    const history = useHistory();
    const [showActions, setShowActions] = useState(false);
    const [showTimeExtension,setShowTimeExtension] = useState(false)
    const [editTimeExtension,setEditTimeExtension] = useState(false)
    
    const [showToast, setShowToast] = useState(null);
    const menuRef = useRef();
    const queryStrings = Digit.Hooks.useQueryParams();
    const revisedWONumber = queryStrings?.revisedWONumber

    const contractId = queryStrings?.workOrderNumber;
    const tenantId = Digit.ULBService.getCurrentTenantId();
    const businessService = revisedWONumber ? Digit?.Customizations?.["commonUiConfig"]?.getBusinessService("revisedWO") : Digit?.Customizations?.["commonUiConfig"]?.getBusinessService("contract")
    const [toast, setToast] = useState({show : false, label : "", type : ""});
    const ContractSession = Digit.Hooks.useSessionStorage("CONTRACT_CREATE", {});
    const [sessionFormData, setSessionFormData, clearSessionFormData] = ContractSession;

    const loggedInUserRoles = Digit.Utils.getLoggedInUserDetails("roles");
    const [actionsMenu, setActionsMenu] = useState([]);

    

    const closeMenu = () => {
        setShowActions(false);
    }
    Digit.Hooks.useClickOutside(menuRef, closeMenu, showActions);

    const payload = {
        tenantId : queryStrings?.tenantId || tenantId,
        contractNumber : queryStrings?.workOrderNumber
    }
    const [cardState,setCardState] = useState([])
    const [activeLink, setActiveLink] = useState("Work_Order");
    const configNavItems = [
        {
            "name": "Work_Order",
            "code": "COMMON_WO_DETAILS",
            "active": true
        },
        {
            "name": "Terms_and_Conditions",
            "code": "COMMON_TERMS_&_CONDITIONS",
            "active": true
        }
    ]
    const ContractDetails = Digit.ComponentRegistryService.getComponent("ContractDetails");
    const CreateTimeExtension = Digit.ComponentRegistryService.getComponent("CreateTimeExtension");
    const TermsAndConditions = Digit.ComponentRegistryService.getComponent("TermsAndConditions");
    const {isLoading : isContractLoading, data, isError : isContractError, isSuccess, error} = Digit.Hooks.contracts.useViewContractDetails(payload?.tenantId, payload, {}, {cacheTime : 0},revisedWONumber)
    let verifiedRolesForAction = {
        CREATE_TE : ["WORK_ORDER_CREATOR"],
        CREATE_MB : ["MB_CREATOR"]
    }
    //const {isLoading : isContractLoading, data } = Digit.Hooks.contracts.useViewContractDetails(payload?.tenantId, payload, {})

    //mdms call for getting the allowed measurement validation date
    const { isLoading: ismdmsLoading, data: mdmsData } = Digit.Hooks.useCustomMDMS(
        tenantId?.split(".")[0],
        "works",
        [
            {
                "name": "MeasurementCriteria"
            }
        ]
    );

    //fetching project data
    const { isLoading: isProjectLoading, data: project, isError : isProjectError } = Digit.Hooks.project.useProjectSearch({
        tenantId,
        searchParams: {
            Projects: [
                {
                    tenantId,
                    projectNumber : data?.applicationData?.additionalDetails?.projectId
                }
            ]
        },
        config:{
            enabled: !!(data?.applicationData?.additionalDetails?.projectId) 
        }
    })

    //fetching measurement data
    const requestCriteria = {
        url : "/mukta-services/measurement/_search",
    
        body: {
          "contractNumber" : contractId,
          "tenantId" : tenantId
        }
    
      }
      console.log(requestCriteria,"requestcriteria");
    
    
      const {isLoading, data:measurementData} = Digit.Hooks.useCustomAPIHook(requestCriteria);
      let isInWorkflowMeasurementPresent = measurementData?.allMeasurements?.code === "NO_MEASUREMENT_ROLL_FOUND"? false : (measurementData?.allMeasurements?.length > 0 && measurementData?.allMeasurements?.filter((ob) => ob?.wfStatus === "SUBMITTED" || ob?.wfStatus === "VERIFIED" || ob?.wfStatus === "DRAFTED")?.length>0);

      let validationData = Digit.Hooks.mukta.useTEorMBCreateValidation({estimateNumber : measurementData?.estimate?.estimateNumber, tenantId, t})

    
    useEffect(() => {
        if (!window.location.href.includes("create-contract") && sessionFormData && Object.keys(sessionFormData) != 0) {
          clearSessionFormData();
        }
    }, [location]);

    useEffect(()=>{
        if(isContractError || (!isContractLoading && data?.isNoDataFound)) {
            setToast({show : true, label : t("COMMON_WO_NOT_FOUND"), type:"error"});
        }
    },[isContractError, data, isContractLoading]);

    useEffect(()=>{
        if(isProjectError) {
            setToast({show : true, label : t("COMMON_PROJECT_NOT_FOUND"), type:"error"});
        }
    },[isProjectError]);

      useEffect(() => {
        let isCreeateTEUser = verifiedRolesForAction?.["CREATE_TE"].some(role => loggedInUserRoles.includes(role));
        if(!(data?.additionalDetails?.isTimeExtAlreadyInWorkflow) && data && !actionsMenu?.find((ob) => ob?.name === "WF_CONTRACT_ACTION_CREATE_TIME_EXTENSION_REQUEST") && isCreeateTEUser) {
            
            setActionsMenu((prevState => [...prevState,{
                name:"WF_CONTRACT_ACTION_CREATE_TIME_EXTENSION_REQUEST",
                action:"TIME_EXTENSTION"
            }]))
        }

        let isCreeateMBUser = verifiedRolesForAction?.["CREATE_MB"].some(role => loggedInUserRoles.includes(role));
        if(!isInWorkflowMeasurementPresent && measurementData && !actionsMenu?.find((ob) => ob?.name === "WF_CONTRACT_ACTION_CREATE_MEASUREMENT_REQUEST") && isCreeateMBUser)
        setActionsMenu((prevState => [...prevState,{
            name:"WF_CONTRACT_ACTION_CREATE_MEASUREMENT_REQUEST",
            action:"CREATE_MEASUREMENT"
        }]))

    }, [data, measurementData])


    useEffect(() => {
        let isUserBillCreator = loggedInUserRoles?.includes("BILL_CREATOR");
        if (data?.applicationData?.wfStatus === "ACCEPTED" && isUserBillCreator){
            setActionsMenu((prevState => [...prevState,{
                name:"WF_CONTRACT_ACTION_CREATE_PURCHASE_BILL"
            }]))
        }

    }, [data])

    const HandleDownloadPdf = () => {
        Digit.Utils.downloadEgovPDF('workOrder/work-order',{contractId,tenantId},`WorkOrder-${contractId}.pdf`)
    }
    const handleActionBar = (option) => {
        if(validationData && Object?.keys(validationData)?.length > 0 && validationData?.type?.includes(option?.action))
        {
            setToast({show : true, label : t(`${validationData?.label}_${option?.action}`), type : validationData?.error ? "error" : ""});
            return;
        }
        if(option?.action === "CREATE_MEASUREMENT" && isWorkEndInPreviousWeek(data?.applicationData?.endDate, mdmsData?.works?.MeasurementCriteria?.[0]?.measurementBookStartDate))
        {
            setToast({show : true, label : t(`MB_CREATION_NOT_POSSIBLE_WORK_END_DATE_PASSED`), type:"error"});
            return;
        }
        if (option?.name === "WF_CONTRACT_ACTION_CREATE_PURCHASE_BILL") {
            history.push(`/${window.contextPath}/employee/expenditure/create-purchase-bill?tenantId=${tenantId}&workOrderNumber=${contractId}`);
        }
        if (option?.action === "CREATE_MEASUREMENT") {
            history.push(`/${window.contextPath}/employee/measurement/create?tenantId=${tenantId}&workOrderNumber=${contractId}`);
        }
        if (option?.action === "TIME_EXTENSTION") {
            window.location.href = `${window.location.href}&isTimeExtension=${true}`
           // window.location.replace(`${window.location.href}&isTimeExtension=${true}`);
           // setShowTimeExtension(true)
           //goto create time extenstion screen (basically view WO screen with two extra fields for time extension)
        }

    }

    const handleToastClose = () => {
        setToast({show : false, label : "", type:""});
    }

    useEffect(() => {
        //here set cardstate when contract and project is available
        setCardState(revisedWONumber ? [
            {
                title: '',
                values: [
                  { title: "REVISED_WO_NUMBER", value: revisedWONumber },
                  { title: "WORKS_ORDER_ID", value: payload?.contractNumber },
                  { title: "WORKS_PROJECT_ID", value: project?.projectNumber, },
                  { title: "ES_COMMON_PROPOSAL_DATE", value: Digit.DateUtils.ConvertEpochToDate(project?.additionalDetails?.dateOfProposal) },
                  { title: "ES_COMMON_PROJECT_NAME", value: project?.name },
                  { title: "PROJECTS_DESCRIPTION", value: project?.description }
                ]
              }
        ] : [
            {
                title: '',
                values: [
                  { title: "WORKS_ORDER_ID", value: payload?.contractNumber },
                  { title: "WORKS_PROJECT_ID", value: project?.projectNumber, },
                  { title: "ES_COMMON_PROPOSAL_DATE", value: Digit.DateUtils.ConvertEpochToDate(project?.additionalDetails?.dateOfProposal) },
                  { title: "ES_COMMON_PROJECT_NAME", value: project?.name },
                  { title: "PROJECTS_DESCRIPTION", value: project?.description }
                ]
              }
        ]) 
      }, [project])

    const handleEditTimeExtension = () => {
        //here set showTimeExtension to true 
        window.location.href = `${window.location.href}&isEditTimeExtension=${true}&isTimeExtension=${true}`
        //setShowTimeExtension(true)
        //setEditTimeExtension(true)
    }

    if(isProjectLoading || isContractLoading || isLoading) 
         return <Loader/>;
    return (
      <React.Fragment>
        <div className={`"employee-main-application-details ${"contract-details"}`}>
          <div className={"employee-application-details"} style={{ marginBottom: "24px",alignItems:"center" }}>
            <Header className="works-header-view" styles={{ margin: "0px" }}>
              {showTimeExtension || queryStrings?.isTimeExtension === "true"
                ? revisedWONumber
                  ? t("UPDATE_TE")
                  : t("CREATE_TE")
                : revisedWONumber
                ? t("VIEW_TE")
                : t("WORKS_VIEW_WORK_ORDER")}
            </Header>
            {(data?.applicationData?.wfStatus === "APPROVED" ||
              data?.applicationData?.wfStatus === "PENDING_FOR_ACCEPTANCE" ||
              data?.applicationData?.wfStatus === "ACCEPTED") &&
              !(queryStrings?.isTimeExtension === "true") &&
              !revisedWONumber && (
                //    <MultiLink
                //      onHeadClick={() => HandleDownloadPdf()}
                //      downloadBtnClassName={"employee-download-btn-className"}
                //      label={t("CS_COMMON_DOWNLOAD")}
                //    />
                <Button
                  label={t("CS_COMMON_DOWNLOAD")}
                  onClick={() => HandleDownloadPdf()}
                  className={"employee-download-btn-className"}
                  variation={"teritiary"}
                  type="button"
                  icon={"FileDownload"}
                />
              )}
          </div>
          {project && <ViewDetailsCard cardState={cardState} t={t} />}
          {!data?.isNoDataFound && (
            <>
              <Tab
                showNav={true}
                configNavItems={configNavItems}
                activeLink={activeLink}
                setActiveLink={setActiveLink}
                inFormComposer={false}
                configItemKey="name"
                configDisplayKey={"code"}
                itemStyle={{width:"unset !important"}}
                navStyles={{}}
                style={{}}
              >
                {activeLink === "Work_Order" && !showTimeExtension && !(queryStrings?.isTimeExtension === "true") && (
                  <ContractDetails
                    fromUrl={false}
                    tenantId={tenantId}
                    contractNumber={payload?.contractNumber}
                    data={data}
                    isLoading={isContractLoading}
                    revisedWONumber={revisedWONumber}
                  />
                )}
                {activeLink === "Work_Order" && (showTimeExtension || queryStrings?.isTimeExtension === "true") && (
                  <CreateTimeExtension
                    fromUrl={false}
                    tenantId={tenantId}
                    contractNumber={payload?.contractNumber}
                    data={data}
                    isLoading={isContractLoading}
                    revisedWONumber={revisedWONumber}
                    isEdit={revisedWONumber ? true : false}
                  />
                )}
                {activeLink === "Terms_and_Conditions" && <TermsAndConditions data={data?.applicationData?.additionalDetails?.termsAndConditions} />}
              </Tab>
              {!editTimeExtension && !(queryStrings?.isEditTimeExtension === "true") && (
                <WorkflowActions
                  forcedActionPrefix={`WF_${businessService}_ACTION`}
                  businessService={businessService}
                  applicationNo={revisedWONumber ? revisedWONumber : queryStrings?.workOrderNumber}
                  tenantId={tenantId}
                  applicationDetails={data?.applicationData}
                  url={Digit.Utils.Urls.contracts.update}
                  moduleCode="Contract"
                  editCallback={handleEditTimeExtension}
                />
              )}
              {data?.applicationData?.wfStatus === "ACCEPTED" &&
              actionsMenu?.length > 0 &&
              !showTimeExtension &&
              !(queryStrings?.isTimeExtension === "true") ? (
                <ActionBar
                actionFields={[
                  <Button
                    type={"actionButton"}
                    options={actionsMenu}
                    label={t("WORKS_ACTIONS")}
                    variation={"primary"}
                    optionsKey={"name"}
                    isSearchable={false}
                    onOptionSelect={(option) => {
                      handleActionBar(option)
                    }}
                  ></Button>
                ]}
                setactionFieldsToRight={true}
                className={"new-actionbar"}
              />
              ) : null}
            </>
          )}
        </div>
        {toast?.show && <Toast label={toast?.label} type={toast?.type} isDleteBtn={true} onClose={handleToastClose}></Toast>}
      </React.Fragment>
    );
}

export default ViewContractDetails



