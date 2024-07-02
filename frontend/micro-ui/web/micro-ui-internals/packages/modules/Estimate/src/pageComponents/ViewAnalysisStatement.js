import React, { useState, useEffect } from "react";
import { Toast, Loader,LinkButton } from "@egovernments/digit-ui-react-components";
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

  const getAnalysisCost = (categories) => {
    let SORAmount = 0;
    if (window.location.href.includes("estimate-details") || window.location.href.includes("measurement/view")) {
      if (categories.includes("LA") && SORAmount === 0 && formData?.additionalDetails?.labourMaterialAnalysis?.labour)
        SORAmount = formData?.additionalDetails?.labourMaterialAnalysis?.labour;
      if (
        categories.some((cat) => ChargesCodeMapping.MaterialCost.includes(cat)) &&
        SORAmount === 0 &&
        formData?.additionalDetails?.labourMaterialAnalysis?.material
      )
        SORAmount = formData?.additionalDetails?.labourMaterialAnalysis?.material;
      if (categories.includes("MHA") && SORAmount === 0 && formData?.additionalDetails?.labourMaterialAnalysis?.machinery)
        SORAmount = formData?.additionalDetails?.labourMaterialAnalysis?.machinery;
    }

    SORAmount = SORAmount ? SORAmount : 0;
    return Digit.Utils.dss.formatterWithoutRound(parseFloat(SORAmount).toFixed(2), "number", undefined, true, undefined, 2);
  };

  const requestSearchCriteria = {
    url: isEstimate ? "/statements/v1/analysis/_search" : "/statements/v1/utilization/_search",
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

  const checkMeasurement = () => {
    if (window.location.href.includes("measurement/update")) {
      return props?.data?.SORtable?.length > 0;
    } else {
      return formData?.SORtable?.length > 0;
    }
  };

  const callCreateApi = async (event) => {
    event.preventDefault();
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
                    number:formData?.estimateNumber,
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
                      number:window.location.href.includes("measurement/update")
                      ? props.config.formData.Measurement.measurementNumber
                      : formData?.Measurement?.measurementNumber
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
              number:isEstimate
              ? formData?.estimateNumber
              : window.location.href.includes("measurement/update")
              ? props.config.formData.Measurement.measurementNumber
              : formData?.Measurement?.measurementNumber,
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
            number:isEstimate
              ? formData?.estimateNumber
              : window.location.href.includes("measurement/update")
              ? props.config.formData.Measurement.measurementNumber
              : formData?.Measurement?.measurementNumber,
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
      await UtilizationMutation(payload, {
        onError: async (error) => {
          setShowToast({
            error: true,
            label: error?.response?.data?.Errors?.[0].message || error,
          });
          setTimeout(() => {
            setShowToast(false);
          }, 5000);
        },
        onSuccess: async (responseData) => {
          setTimeout(() => {
            history.push({
              pathname: `/${window?.contextPath}/employee/measurement/utilizationstatement`,
              state: {
                responseData: responseData,
                estimateId: window.location.href.includes("measurement/update")
                  ? props.config.formData.Measurement.id
                  : formData?.Measurement?.id,
                number: window.location.href.includes("measurement/update")
                  ? props.config.formData.Measurement.measurementNumber
                  : formData?.Measurement?.measurementNumber,
              },
            });
          }, 1000);
        },
      });
    }
  };

  const handleNavigation = (isEstimate, isView, searchResponse, formData, props) => {
    const path = isEstimate
      ? `/${window?.contextPath}/employee/estimate/view-analysis-statement`
      : `/${window?.contextPath}/employee/measurement/utilizationstatement`;

    const estimateId = isEstimate
      ? formData?.SORtable?.[0]?.estimateId
      : window.location.href.includes("measurement/update")
      ? props.config.formData.Measurement.id
      : formData?.Measurement?.id;

    const number = isEstimate
      ? formData?.estimateNumber
      : window.location.href.includes("measurement/update")
      ? props.config.formData.Measurement.measurementNumber
      : formData?.Measurement?.measurementNumber;

    const state = {
      responseData: searchResponse,
      estimateId,
      number,
    };

    if (!searchResponse) {
      state.oldData = {
        Labour: getAnalysisCost(ChargesCodeMapping.LabourCost),
        Material: getAnalysisCost(ChargesCodeMapping.MaterialCost),
        Machinery: getAnalysisCost(ChargesCodeMapping.MachineryCost),
      };
    }

    history.push({ pathname: path, state });
  };

  const checkConditions = (isEstimate, formData, props) => {
    if (isEstimate) {
      return formData?.SORtable?.length > 0;
    } else {
      return checkMeasurement();
    }
  };

  const handleButtonClick = async (event) => {
    event.preventDefault();
   

    if (!checkConditions(isEstimate, formData, props)) {
      const message = isEstimate ? t("NO_ESTIMATE_SOR_FOUND") : t("NO_MEASUREMENT_SOR_FOUND");
      showToastMessage(message);
      return;
    }

    if (isView && searchResponse) {
      handleNavigation(isEstimate, isView, searchResponse, formData, props);
    } else {
      await callCreateApi(event);
    }
  };

  const showToastMessage = (message) => {
    setShowToast({ warning: true, label: message });
    setTimeout(() => setShowToast(false), 5000);
  };

  // return (
  //   <div style={{ width: "100%", display: "flex", justifyContent: "center" }}>
  //     {searchLoading ? (
  //       <Loader />
  //     ) : (
  //       <button
  //         type="button"
  //         className="view-Analysis-button"
  //         style={isCreateOrUpdate ? { marginTop: "-3.5%", textAlign: "center", width: "17%" } : { textAlign: "center", width: "17%" }}
  //         onClick={handleButtonClick}
  //       >
  //         {isEstimate ? t("ESTIMATE_ANALYSIS_STM") : t("MB_UTILIZATION_STM")}
  //       </button>
  //     )}
  //     {showToast && (
  //       <Toast
  //         error={showToast?.error}
  //         warning={showToast?.warning}
  //         success={showToast?.success}
  //         label={t(showToast?.label)}
  //         isDleteBtn={true}
  //         onClose={() => setShowToast(null)}
  //       />
  //     )}
  //   </div>
  // );

   if (searchLoading) return <Loader />;

  if (!window.location.href.includes("create"))
    return (
      <div >
        <LinkButton
          className="view-Analysis-button"
          style={isCreateOrUpdate ? { marginTop: "-3.5%", textAlign: "center", width: "17%" } : { textAlign: "center", width: "17%" }}
          onClick={handleButtonClick}
          label={isEstimate ? t("ESTIMATE_ANALYSIS_STM") : t("MB_UTILIZATION_STM")}
        />
        {showToast && (
        <Toast
          error={showToast?.error}
          warning={showToast?.warning}
          success={showToast?.success}
          label={t(showToast?.label)}
          isDleteBtn={true}
          style={{ overflowWrap: "break-word", // Ensure words break if they exceed container width
            whiteSpace: "pre-line"}}
          onClose={() => setShowToast(false)}
        />
      )}
      </div>
    );
  else return <div></div>;

};

export default ViewAnalysisStatement;

