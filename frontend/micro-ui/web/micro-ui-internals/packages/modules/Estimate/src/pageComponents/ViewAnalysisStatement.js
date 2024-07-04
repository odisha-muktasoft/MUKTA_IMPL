import React from "react";
import { LinkButton, Loader } from "@egovernments/digit-ui-react-components";
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
  const isView = window.location.href.includes("estimate-details") || window.location.href.includes("measurement/view");
  const { mutate: AnalysisMutation } = Digit.Hooks.works.useCreateAnalysisStatement("WORKS");
  const { mutate: UtilizationMutation } = Digit.Hooks.works.useCreateUtilizationStatement("WORKS");

  const ChargesCodeMapping = {
    LabourCost: ["LA"],
    MaterialCost: ["MA", "RA", "CA", "EMF", "DMF", "ADC", "LC"],
    MachineryCost: ["MHA"],
  };

  function getAnalysisCost(categories) {
    let SORAmount = 0;
    if (window.location.href.includes("estimate-details") || window.location.href.includes("measurement/view")) {
      if (categories?.includes("LA") && SORAmount == 0 && formData?.additionalDetails?.labourMaterialAnalysis?.labour)
        SORAmount = formData?.additionalDetails?.labourMaterialAnalysis?.labour;
      if (
        categories.some((cat) => ChargesCodeMapping?.MaterialCost?.includes(cat)) &&
        SORAmount == 0 &&
        formData?.additionalDetails?.labourMaterialAnalysis?.material
      )
        SORAmount = formData?.additionalDetails?.labourMaterialAnalysis?.material;
      if (categories?.includes("MHA") && SORAmount == 0 && formData?.additionalDetails?.labourMaterialAnalysis?.machinery)
        SORAmount = formData?.additionalDetails?.labourMaterialAnalysis?.machinery;
    }
    //Conditions is used in the case of View details to capture the data from additional details
    // if(category === "LA" && SORAmount == 0 && formData?.additionalDetails?.labourMaterialAnalysis?.labour) return formData?.additionalDetails?.labourMaterialAnalysis?.labour;
    // if(category === "MA" && SORAmount =getAnalysisCost= 0 && formData?.additionalDetails?.labourMaterialAnalysis?.material) return formData?.additionalDetails?.labourMaterialAnalysis?.material;
    // if(category === "MHA" && SORAmount == 0 && formData?.additionalDetails?.labourMaterialAnalysis?.machinery) return formData?.additionalDetails?.labourMaterialAnalysis?.machinery;
    // if(window.location.href.includes("update-detailed-estimate"))
    // {
    // if(category === "LA" && SORAmount == 0  && formData?.labourMaterialAnalysis?.labour) return formData?.labourMaterialAnalysis?.labour;
    // if(category === "MA" && SORAmount == 0 && formData?.labourMaterialAnalysis?.material) return formData?.labourMaterialAnalysis?.material;
    // if(category === "MHA" && SORAmount == 0 && formData?.labourMaterialAnalysis?.machinery) return formData?.labourMaterialAnalysis?.machinery;
    // }

    SORAmount = SORAmount ? SORAmount : 0;
    return Digit.Utils.dss.formatterWithoutRound(parseFloat(SORAmount).toFixed(2), "number", undefined, true, undefined, 2);
  }

 

  const requestSearchCriteria = {
    
    url: isEstimate ? "/statements/v1/analysis/_search" : "/statements/v1/utilization/_search",
    //params: { tenantId: tenantId, id: formData?.SORtable?.[0]?.estimateId || formData?.Measurement?.id },
    body: {
      searchCriteria: {
        tenantId: tenantId,
        referenceId: isEstimate ? formData?.SORtable?.[0]?.estimateId : formData?.Measurement?.id,
      },
    },
    config: {
      cacheTime: 0,
      enabled: formData?.SORtable?.[0]?.estimateId || formData?.Measurement?.id ? true : false,
    },
    changeQueryName: "analysisStatement",
  };

  const { data: searchResponse, isLoading: searchLoading } = Digit.Hooks.useCustomAPIHook(requestSearchCriteria);

  async function callCreateApi() {
    // Look here add the condition for utilization statement and call your api
    let payload = {
      statementRequest: {
        tenantId: tenantId,
        id: isEstimate
          ? formData?.SORtable?.[0]?.estimateId
          : window.location.href.includes("measurement/update")
          ? props.config.formData.Measurement.id
          : formData?.Measurement?.id,
      },
    };
   
    {
      isEstimate
        ? await AnalysisMutation(payload, {
            onError: async (error, variables) => {
              setIsButtonDisabled(false);
              setShowToast({
                warning: true,
                label: error?.response?.data?.Errors?.[0].message ? error?.response?.data?.Errors?.[0].message : error,
              });
              setTimeout(() => {
                setShowToast(false);
              }, 5000);
            },
            onSuccess: async (responseData, variables) => {
              setTimeout(() => {
                history.push({
                  pathname: `/${window?.contextPath}/employee/estimate/view-analysis-statement`,
                  state: {
                    responseData: responseData,
                    estimateId: formData?.SORtable?.[0]?.estimateId,
                  },
                });
              }, 1000);
            },
          })
        : await UtilizationMutation(payload, {
            onError: async (error, variables) => {
              setIsButtonDisabled(false);
              setShowToast({
                warning: true,
                label: error?.response?.data?.Errors?.[0].message ? error?.response?.data?.Errors?.[0].message : error,
              });
              setTimeout(() => {
                setShowToast(false);
              }, 5000);
            },
            onSuccess: async (responseData, variables) => {
              setTimeout(() => {
              
                history.push({
                  pathname: `/${window?.contextPath}/employee/measurement/utilizationstatement`,
                  state: {
                    responseData: responseData,
                    estimateId: window.location.href.includes("measurement/update")
                      ? props.config.formData.Measurement.id
                      : formData?.Measurement?.id,
                  },
                
                });
               
              }, 5000);
            },
          });
    }
  }

  async function handleButtonClick() {
    if (isView) {
      if (searchResponse) {
        history.push({
          pathname: isEstimate
            ? `/${window?.contextPath}/employee/estimate/view-analysis-statement`
            : `/${window?.contextPath}/employee/measurement/utilizationstatement`,
          state: {
            responseData: searchResponse,
            estimateId: isEstimate
              ? formData?.SORtable?.[0]?.estimateId
              : window.location.href.includes("measurement/update")
              ? props.config.formData.Measurement.id
              : formData?.Measurement?.id,
          },
        });
      } else {
        //add the code for old viewpopup here
        history.push({
          pathname: isEstimate
            ? `/${window?.contextPath}/employee/estimate/view-analysis-statement`
            : `/${window?.contextPath}/employee/measurement/utilizationstatement`,
          state: {
            responseData: searchResponse,
            estimateId: isEstimate
              ? formData?.SORtable?.[0]?.estimateId
              : window.location.href.includes("measurement/update")
              ? props.config.formData.Measurement.id
              : formData?.Measurement?.id,
            oldData: {
              Labour: getAnalysisCost(ChargesCodeMapping?.LabourCost),
              Material: getAnalysisCost(ChargesCodeMapping?.MaterialCost),
              Machinery: getAnalysisCost(ChargesCodeMapping?.MachineryCost),
            },
          },
        });
        //await callCreateApi();
      }
      
    } else {
      await callCreateApi();
    }
  }

  if (searchLoading) return <Loader />;

  if (!window.location.href.includes("create"))
    return (
      <LinkButton
        className="view-Analysis-button"
        style={isCreateOrUpdate ? { marginTop: "-3.5%", textAlign: "center", width: "17%" } : { textAlign: "center", width: "17%" }}
        onClick={handleButtonClick}
        label={isEstimate ? t("ESTIMATE_ANALYSIS_STM") : t("MB_UTILIZATION_STM")}
      />
    );
  else return <div></div>;
};

export default ViewAnalysisStatement;
