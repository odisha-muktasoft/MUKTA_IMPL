import React, { useState, useEffect } from "react";
import { transformEstimateObjects } from "../../util/estimateConversion";
import { transformStatementData } from "../../util/EstimateData";

export const data = (statementDetails) => {
    debugger;
  const [viewData, setViewData] = useState({ SOR: [], NONSOR: [] });

//   const documents = estimateDetails?.additionalDetails?.documents
//     .filter((item) => item.fileStoreId) // Remove items without fileStoreId
//     .map((item) => ({
//       title: item.fileType || "NA",
//       documentType: item.fileType || "NA",
//       documentUid: item.documentUid || "NA",
//       fileStoreId: item.fileStoreId || "NA",
//     }));

//     const Projectdocuments = projectDetails?.documents?.filter((item) => item?.fileStoreId)
//     .map((item) => ({
//       title: `PROJECT_${item.additionalDetails?.fileName}` || "NA",
//       ...item
//     }));

  const headerLocale = Digit.Utils.locale.getTransformedLocale(statementDetails?.tenantId);
  //const geoLocationValue = estimateDetails?.address?.latitude && estimateDetails?.address?.longitude ? `${estimateDetails?.address?.latitude}, ${estimateDetails?.address?.longitude}` : "NA";

  useEffect(() => {
    debugger;
    const processArrays = () => {
      if (statementDetails && !(viewData?.nestedData)) {
        //Transforming the estimate search response according to formdata 
        setViewData({
            nestedData: transformStatementData(statementDetails),
          //NONSOR: transformEstimateObjects(estimateDetails, "NON-SOR", {}, allDetailedEstimate),
        });
      }
    };
    processArrays();
  }, [statementDetails]);

//   const getRedirectionCallback = () => {
//     if(revisionNumber)
//     window.location.href = `/${window?.contextPath}/employee/estimate/update-revision-detailed-estimate?tenantId=${estimateDetails?.tenantId}&projectNumber=${estimateDetails?.additionalDetails?.projectNumber}&revisionNumber=${estimateDetails?.revisionNumber}&estimateNumber=${estimateDetails?.estimateNumber}&isEditRevisionEstimate=true`
//     else
//     window.location.href = `/${window?.contextPath}/employee/estimate/update-detailed-estimate?tenantId=${estimateDetails?.tenantId}&projectNumber=${estimateDetails?.additionalDetails?.projectNumber}&estimateNumber=${estimateDetails?.estimateNumber}&isEdit=true`
// }
console.log(viewData);
  return {
    cards: [
      {
        sections: [
          {
            type: "DATA",
            values: [
              {
                key: "STATEMENT_MATERIAL",
                value: 100,
              },
              {
                key: "STATEMENT_LABOUR",
                value: 100,
              },
              {
                key: "STATEMENT_MACHINERY",
                value: 100,
              },
            ],
          },
        ],
      },
      {
        navigationKey: "card1",
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "WORKS_SORS_WISE_MATERIAL", inlineStyles: {} },
            component: "ViewStatement",
            props: {
              config: {
                key: "SOR",
                mode: "VIEWES",
              },
              arrayProps: {
                fields: viewData?.nestedData,
                type: "M"
              },
              register: () => {},
              setValue: (key, value) => setViewData((old) => ({ ...old, nestedData: value })),
            },
          }
        ],
      },
      {
        navigationKey: "card2",
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "WORKS_SORS_WISE_LABOUR", inlineStyles: {} },
            component: "ViewStatement",
            props: {
              config: {
                key: "SOR",
                mode: "VIEWES",
              },
              arrayProps: {
                fields: viewData?.nestedData,
                type: "L"
              },
              register: () => {},
              setValue: (key, value) => setViewData((old) => ({ ...old, nestedData: value })),
            },
          }
        ],
      },
      {
        navigationKey: "card3",
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "WORKS_SORS_WISE_LABOUR", inlineStyles: {} },
            component: "ViewStatement",
            props: {
              config: {
                key: "SOR",
                mode: "VIEWES",
              },
              arrayProps: {
                fields: viewData?.nestedData,
                type: "MH"
              },
              register: () => {},
              setValue: (key, value) => setViewData((old) => ({ ...old, nestedData: value })),
            },
          }
        ],
      },
      {
        navigationKey: "card1",
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "WORKS_SORS_WISE_LABOUR", inlineStyles: {} },
            component: "GroupedTable",
            props: {
              config: {
                key: "SOR",
                mode: "VIEWES",
              },
              arrayProps: {
                fields: viewData?.nestedData,
                type: "M"
              },
              register: () => {},
              setValue: (key, value) => setViewData((old) => ({ ...old, nestedData: value })),
            },
          }
        ],
      },
    //   {
    //     navigationKey: "card1",
    //     sections: [
    //       {
    //         type: "COMPONENT",
    //         cardHeader: { value: "MB_NONSOR", inlineStyles: {} },
    //         component: "EstimateMeasureTableWrapper",
    //         props: {
    //           config: {
    //             key: "NONSOR",
    //             mode: "VIEWES",
    //           },
    //           arrayProps: {
    //             fields: viewData?.NONSOR,
    //           },
    //           register: () => {},
    //           setValue: (key, value) => setViewData((old) => ({ ...old, NONSOR: value })),
    //         },
    //       }
    //     ],
    //   },
    //   {
    //     navigationKey: "card1",
    //     sections: [
    //       {
    //         type: "COMPONENT",
    //         cardHeader: { value: "ES_OTHER_CHARGES", inlineStyles: {} },
    //         component: "OverheadDetailsTable",
    //         props: {data : overheadDetails}
    //       }
    //     ],
    //   },
    //   {
    //     navigationKey: "card1",
    //     sections: [
    //       {
    //         type: "COMPONENT",
    //         cardHeader: { value: "", inlineStyles: {} },
    //         component: "ViewAnalysisStatement",
    //         props: {formData : {...estimateDetails, SORtable:  estimateDetails ? transformEstimateObjects(estimateDetails, "SOR",{}, allDetailedEstimate) : []}}
    //       },
    //       {
    //         type: "COMPONENT",
    //         cardHeader: { value: "", inlineStyles: {} },
    //         component: "ViewTotalEstAmount",
    //         props: {mode: "VIEWES", detail : {...estimateDetails, value:estimateDetails?.additionalDetails?.totalEstimatedAmount, showTitle:"TOTAL_ESTIMATE_AMOUNT"} }
    //       }
    //     ],
    //   },
    //   {
    //     navigationKey: "card1",
    //     sections: [
    //       {
    //         type: "DOCUMENTS",
    //         documents: [
    //           {
    //             title: "ES_WORKS_RELEVANT_DOCUMENTS",
    //             BS: "Works",
    //             values: documents,
    //           },
    //         ],
    //         inlineStyles: {
    //           marginTop: "1rem",
    //         },
    //       }
    //     ],
    //   },
    //   {
    //     navigationKey: "card1",
    //     sections: [
    //       {
    //         type: "WFHISTORY",
    //         businessService: "ESTIMATE",
    //         applicationNo: revisionNumber ? revisionNumber : estimateDetails?.estimateNumber,
    //         tenantId: estimateDetails?.tenantId,
    //         timelineStatusPrefix: "WF_ESTIMATE_",
    //         breakLineRequired: false,
    //         config : {
    //           select: (data) => {
    //             return {...data, timeline: data?.timeline.filter((ob) => ob?.performedAction !== "DRAFT")}
    //           },
    //         }
    //       },
    //       {
    //         type: "WFACTIONS",
    //         forcedActionPrefix: "WF_ESTIMATE_ACTION",
    //         businessService: "ESTIMATE",
    //         applicationNo: revisionNumber ? revisionNumber : estimateDetails?.estimateNumber,
    //         tenantId: estimateDetails?.tenantId,
    //         applicationDetails: estimateDetails,
    //         url: "/mukta-estimate/v1/_update",
    //         moduleCode: "Estimate",
    //         editApplicationNumber: undefined,
    //         editCallback : getRedirectionCallback
    //       },
    //     ],
    //   },
    //   {
    //     navigationKey: "card2",
    //     sections: [
    //       {
    //         type: "DATA",
    //         sectionHeader: { value: "WORKS_PROJECT_DETAILS", inlineStyles: {marginBottom : "16px", marginTop:"32px", fontSize: "24px"} },
    //         values: [
    //           {
    //             key: "PROJECT_LOR",
    //             value: projectDetails?.referenceNumber,
    //           },
    //           {
    //             key: "WORKS_PROJECT_TYPE",
    //             value: projectDetails?.projectType,
    //           },
    //           {
    //             key: "PROJECT_TARGET_DEMOGRAPHY",
    //             value: projectDetails?.targets,
    //           },
    //           {
    //             key: "PROJECT_ESTIMATED_COST",
    //             value: projectDetails?.additionalDetails?.estimatedCostInRs || "NA",
    //           },
    //         ],
    //       },
    //       {
    //         type: "DATA",
    //         sectionHeader: { value: "WORKS_LOCATION_DETAILS", inlineStyles: {marginBottom : "16px", marginTop:"32px", fontSize: "24px"} },
    //         values: [
    //           {
    //             key: "WORKS_GEO_LOCATION",
    //             value: geoLocationValue,
    //           },
    //           {
    //             key: "WORKS_CITY",
    //             value: projectDetails?.address?.city,
    //           },
    //           {
    //             key: "WORKS_WARD",
    //             value: `${headerLocale}_ADMIN_${projectDetails?.address?.boundary}`,
    //           },
    //           {
    //             key: "WORKS_LOCALITY",
    //             value: `${headerLocale}_ADMIN_${projectDetails?.additionalDetails?.locality}`,
    //           },
    //         ],
    //       },
    //       {
    //         type: "DOCUMENTS",
    //         documents: [
    //           {
    //             title: "ES_PROJECT_WORKS_RELEVANT_DOCUMENTS",
    //             BS: "Works",
    //             values: Projectdocuments,
    //           },
    //         ],
    //         inlineStyles: {
    //           marginTop: "1rem",
    //         },
    //         headerStyle: {
    //           marginTop: "32px",
    //           marginBottom: "8px"
    //         }
    //       },
    //     ],
    //   },
    ],
    apiResponse: {},
    additionalDetails: {},
    horizontalNav: {
      showNav: true,
      configNavItems: [
        {
          name: "card1",
          active: true,
          code: "Material",
        },
        {
          name: "card2",
          active: true,
          code: "Labour",
        },
        {
            name: "card3",
            active: true,
            code: "Machinery",
          }
      ],
      activeByDefault: "card1",
    },
  };
};
