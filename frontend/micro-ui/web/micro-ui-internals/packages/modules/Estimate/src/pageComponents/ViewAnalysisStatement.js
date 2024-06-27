import React from "react";
import { LinkButton } from "@egovernments/digit-ui-react-components";
import { useTranslation } from "react-i18next";
import { useHistory } from "react-router-dom";

const ViewAnalysisStatement = ({ formData, ...props }) => {
  const { t } = useTranslation();
  const history = useHistory();
  const tenantId = Digit.ULBService.getCurrentTenantId();

  const isCreateOrUpdate = /(measurement\/create|estimate\/create-detailed-estimate|estimate\/update-detailed-estimate|measurement\/update|estimate\/create-revision-detailed-estimate|estimate\/update-revision-detailed-estimate)/.test(
    window.location.href
  );
  const isEstimate = window.location.href.includes("/estimate/");
  const { mutate: AnalysisMutation } = Digit.Hooks.works.useCreateAnalysisStatement("WORKS");
  const { mutate: UtilizationMutation } = Digit.Hooks.works.useCreateUtilizationStatement("WORKS");

  async function callCreateApi() {
    //look here add the condition for utlization statement and call your api
    
    let payload = {
      statementRequest: {
        tenantId: tenantId,
        id: isEstimate ? formData?.SORtable?.[0]?.estimateId : formData?.Measurement?.id,
      },
    };

    {
      isEstimate
        ? await AnalysisMutation(payload, {
            onError: async (error, variables) => {
              setIsButtonDisabled(false);
              setShowToast({ warning: true, label: error?.response?.data?.Errors?.[0].message ? error?.response?.data?.Errors?.[0].message : error });
              setTimeout(() => {
                setShowToast(false);
              }, 5000);
            },
            onSuccess: async (responseData, variables) => {
              // clearSessionFormData();
              console.log(responseData);
              // const state = {
              //   header: isCreateRevisionEstimate || isEditRevisionEstimate ? t("WORKS_REVISION_ESTIMATE_RESPONSE_CREATED_HEADER") :t("WORKS_ESTIMATE_RESPONSE_CREATED_HEADER"),
              //   id: isCreateRevisionEstimate || isEditRevisionEstimate ? responseData?.estimates[0]?.revisionNumber : responseData?.estimates[0]?.estimateNumber,
              //   info:isCreateRevisionEstimate || isEditRevisionEstimate ?  t("ESTIMATE_REVISION_ESTIMATE_NO") : t("ESTIMATE_ESTIMATE_NO"),
              //   // message: t("WORKS_ESTIMATE_RESPONSE_MESSAGE_CREATE", { department: t(`ES_COMMON_${responseData?.estimates[0]?.executingDepartment}`) }),
              //   links: [
              //     {
              //       name: t("WORKS_GOTO_ESTIMATE_INBOX"),
              //       redirectUrl: `/${window.contextPath}/employee/estimate/inbox`,
              //       code: "",
              //       svg: "GotoInboxIcon",
              //       isVisible: true,
              //       type: "inbox",
              //     },
              //   ],
              // }
              //   setShowToast({ label: t("WORKS_ESTIMATE_APPLICATION_DRAFTED") });
              //   if(isCreateRevisionEstimate || isEditRevisionEstimate)
              //     setTimeout(() => {history.push(`/${window?.contextPath}/employee/estimate/update-revision-detailed-estimate?tenantId=${responseData?.estimates[0]?.tenantId}&revisionNumber=${responseData?.estimates[0]?.revisionNumber}&estimateNumber=${responseData?.estimates[0]?.estimateNumber}&projectNumber=${projectNumber}&isEditRevisionEstimate=true`, state)}, 3000);
              //   else
              //   setTimeout(() => {history.push(`/${window?.contextPath}/employee/estimate/update-detailed-estimate?tenantId=${responseData?.estimates[0]?.tenantId}&estimateNumber=${responseData?.estimates[0]?.estimateNumber}&projectNumber=${projectNumber}&isEdit=true`, state)}, 3000);
              setTimeout(() => {
                history.push({
                  pathname: `/${window?.contextPath}/employee/estimate/view-analysis-statement`,
                  state: {
                    responseData: responseData,
                    estimateId: formData?.SORtable?.[0]?.estimateId,
                  },
                });
              }, 5000);
            },
          })
        : await UtilizationMutation(payload, {
            onError: async (error, variables) => {
              setIsButtonDisabled(false);
              setShowToast({ warning: true, label: error?.response?.data?.Errors?.[0].message ? error?.response?.data?.Errors?.[0].message : error });
              setTimeout(() => {
                setShowToast(false);
              }, 5000);
            },
            onSuccess: async (responseData, variables) => {
              // clearSessionFormData();
              console.log(responseData);
              // const state = {
              //   header: isCreateRevisionEstimate || isEditRevisionEstimate ? t("WORKS_REVISION_ESTIMATE_RESPONSE_CREATED_HEADER") :t("WORKS_ESTIMATE_RESPONSE_CREATED_HEADER"),
              //   id: isCreateRevisionEstimate || isEditRevisionEstimate ? responseData?.estimates[0]?.revisionNumber : responseData?.estimates[0]?.estimateNumber,
              //   info:isCreateRevisionEstimate || isEditRevisionEstimate ?  t("ESTIMATE_REVISION_ESTIMATE_NO") : t("ESTIMATE_ESTIMATE_NO"),
              //   // message: t("WORKS_ESTIMATE_RESPONSE_MESSAGE_CREATE", { department: t(`ES_COMMON_${responseData?.estimates[0]?.executingDepartment}`) }),
              //   links: [
              //     {
              //       name: t("WORKS_GOTO_ESTIMATE_INBOX"),
              //       redirectUrl: `/${window.contextPath}/employee/estimate/inbox`,
              //       code: "",
              //       svg: "GotoInboxIcon",
              //       isVisible: true,
              //       type: "inbox",
              //     },
              //   ],
              // }
              //   setShowToast({ label: t("WORKS_ESTIMATE_APPLICATION_DRAFTED") });
              //   if(isCreateRevisionEstimate || isEditRevisionEstimate)
              //     setTimeout(() => {history.push(`/${window?.contextPath}/employee/estimate/update-revision-detailed-estimate?tenantId=${responseData?.estimates[0]?.tenantId}&revisionNumber=${responseData?.estimates[0]?.revisionNumber}&estimateNumber=${responseData?.estimates[0]?.estimateNumber}&projectNumber=${projectNumber}&isEditRevisionEstimate=true`, state)}, 3000);
              //   else
              //   setTimeout(() => {history.push(`/${window?.contextPath}/employee/estimate/update-detailed-estimate?tenantId=${responseData?.estimates[0]?.tenantId}&estimateNumber=${responseData?.estimates[0]?.estimateNumber}&projectNumber=${projectNumber}&isEdit=true`, state)}, 3000);
              setTimeout(() => {
                history.push({
                  pathname: `/${window?.contextPath}/employee/measurement/utilizationstatement`,
                  state: {
                    responseData: responseData,
                    formId: formData?.Measurement?.id,
                  },
                });
              }, 5000);
            },
          });
    }
  }

  if (!window.location.href.includes("create"))
    return (
      <LinkButton
        className="view-Analysis-button"
        style={isCreateOrUpdate ? { marginTop: "-3.5%", textAlign: "center", width: "17%" } : { textAlign: "center", width: "17%" }}
        onClick={callCreateApi}
        label={isEstimate ? t("ESTIMATE_ANALYSIS_STM") : t("MB_UTILIZATION_STM")}
      />
    );
  else return <div></div>;
};

export default ViewAnalysisStatement;
