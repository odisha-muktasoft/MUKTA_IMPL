import React, { Fragment, useState, useEffect, useRef } from "react";
import { Loader, Header, MultiLink, StatusTable, Card, Row, HorizontalNav, ViewDetailsCard, Toast, ActionBar, Menu, SubmitBar } from "@egovernments/digit-ui-react-components";
import { useTranslation } from "react-i18next";
import { ViewComposer } from "@egovernments/digit-ui-react-components";
import { data } from "../../configs/viewStatementConfig";
import { useHistory } from 'react-router-dom';

const ViewAnalysisStatement = () => {

    let statement = [
        {
            "id": "bcb0188e-6dab-4ee5-8d28-6867c02b3884",
            "tenantId": "od.testing",
            "targetId": "a7933603-8254-467f-9ae8-4976ca876ffe",
            "statementType": "ANALYSIS",
            "basicSorDetails": [
                {
                    "id": null,
                    "amount": 545.336044,
                    "type": "L",
                    "quantity": null,
                    "rate": null,
                    "name": null,
                    "unit": null
                },
                {
                    "id": null,
                    "amount": 445.117412,
                    "type": "M",
                    "quantity": null,
                    "rate": null,
                    "name": null,
                    "unit": null
                }
            ],
            "sorDetails": [
                {
                    "id": "4363a76b-17ad-422e-b4d5-67f6383f07cf",
                    "statementId": "bcb0188e-6dab-4ee5-8d28-6867c02b3884",
                    "sorId": "SOR_000206",
                    "basicSorDetails": [
                        {
                            "id": "0f0643e5-22f4-42bc-8149-dda3e89d2240",
                            "amount": 500.049355,
                            "type": "L",
                            "quantity": null,
                            "rate": null,
                            "name": null,
                            "unit": null
                        },
                        {
                            "id": "b929163d-48dc-4a90-9bed-a8a7f18f122d",
                            "amount": 400.039484,
                            "type": "M",
                            "quantity": null,
                            "rate": null,
                            "name": null,
                            "unit": null
                        }
                    ],
                    "lineItems": [
                        {
                            "id": "ebc1cdf8-d5e0-4895-b92f-532d2eaec5e1",
                            "sorId": "SOR_000437",
                            "sorType": "L",
                            "referenceId": "4363a76b-17ad-422e-b4d5-67f6383f07cf",
                            "amountDetails": [
                                {
                                    "id": "a949f22d-fca3-4035-b6d0-f71e95120de9",
                                    "amount": 500.049355,
                                    "type": "L",
                                    "quantity": 500.049355,
                                    "rate": 1,
                                    "name": "Operator for Heavy construction Machineries",
                                    "unit": "NOs"
                                }
                            ]
                        },
                        {
                            "id": "5daac859-945a-472d-93c6-20f581291cc0",
                            "sorId": "SOR_000183",
                            "sorType": "M",
                            "referenceId": "4363a76b-17ad-422e-b4d5-67f6383f07cf",
                            "amountDetails": [
                                {
                                    "id": "1c031f3c-e7e8-4bfe-b257-1d889333fd34",
                                    "amount": 400.039484,
                                    "type": "M",
                                    "quantity": 400.039484,
                                    "rate": 1,
                                    "name": "Paver Finisher Mechanical",
                                    "unit": "HOUR"
                                }
                            ]
                        }
                    ],
                    "tenantId": "od.testing"
                },
                {
                    "id": "022f559b-ef7b-49b6-b435-12d1562ab4db",
                    "statementId": "bcb0188e-6dab-4ee5-8d28-6867c02b3884",
                    "sorId": "SOR_000100",
                    "basicSorDetails": [
                        {
                            "id": null,
                            "amount": null,
                            "type": "M",
                            "quantity": 2,
                            "rate": null,
                            "name": "Laterite Stone rough dressed",
                            "unit": "CUM"
                        }
                    ],
                    "lineItems": [],
                    "tenantId": "od.testing"
                },
                {
                    "id": "766cb65e-2885-4170-9453-492f2e6a4823",
                    "statementId": "bcb0188e-6dab-4ee5-8d28-6867c02b3884",
                    "sorId": "SOR_000200",
                    "basicSorDetails": [
                        {
                            "id": "c1646cdb-18f1-4bf0-84db-8bc802a58dbf",
                            "amount": 40.242884,
                            "type": "L",
                            "quantity": null,
                            "rate": null,
                            "name": null,
                            "unit": null
                        },
                        {
                            "id": "7e44cadf-3316-4550-9848-c9c9864366ac",
                            "amount": 40.242884,
                            "type": "M",
                            "quantity": null,
                            "rate": null,
                            "name": null,
                            "unit": null
                        }
                    ],
                    "lineItems": [
                        {
                            "id": "c0ea97a5-4dd5-4240-9ce1-6ecfd6dc7c82",
                            "sorId": "SOR_000437",
                            "sorType": "L",
                            "referenceId": "766cb65e-2885-4170-9453-492f2e6a4823",
                            "amountDetails": [
                                {
                                    "id": "02b3be34-cf09-40b5-b71e-658970852baf",
                                    "amount": 40.242884,
                                    "type": "L",
                                    "quantity": 40.242884,
                                    "rate": 1,
                                    "name": "Operator for Heavy construction Machineries",
                                    "unit": "NOs"
                                }
                            ]
                        },
                        {
                            "id": "562cd5b7-a7a8-4540-b6ac-08cd78088fef",
                            "sorId": "SOR_000183",
                            "sorType": "M",
                            "referenceId": "766cb65e-2885-4170-9453-492f2e6a4823",
                            "amountDetails": [
                                {
                                    "id": "156da5c5-5a29-46a6-bf59-7bdcdd30bb44",
                                    "amount": 40.242884,
                                    "type": "M",
                                    "quantity": 40.242884,
                                    "rate": 1,
                                    "name": "Paver Finisher Mechanical",
                                    "unit": "HOUR"
                                }
                            ]
                        }
                    ],
                    "tenantId": "od.testing"
                },
                {
                    "id": "4c70fcb1-a1ec-4499-af93-ab0474e9e26e",
                    "statementId": "bcb0188e-6dab-4ee5-8d28-6867c02b3884",
                    "sorId": "SOR_000252",
                    "basicSorDetails": [
                        {
                            "id": "0a5398b9-1d65-47d7-9a4b-9bb072452f53",
                            "amount": 5.043805,
                            "type": "L",
                            "quantity": null,
                            "rate": null,
                            "name": null,
                            "unit": null
                        },
                        {
                            "id": "f24fe848-4129-46c9-8f3b-24b876cbf430",
                            "amount": 4.035044,
                            "type": "M",
                            "quantity": null,
                            "rate": null,
                            "name": null,
                            "unit": null
                        }
                    ],
                    "lineItems": [
                        {
                            "id": "e5fe803c-a559-46f1-8054-39cb6e037a3e",
                            "sorId": "SOR_000437",
                            "sorType": "L",
                            "referenceId": "4c70fcb1-a1ec-4499-af93-ab0474e9e26e",
                            "amountDetails": [
                                {
                                    "id": "56eb7c52-afe5-48f4-86e9-41bb4236d5b1",
                                    "amount": 5.043805,
                                    "type": "L",
                                    "quantity": 5.043805,
                                    "rate": 1,
                                    "name": "Operator for Heavy construction Machineries",
                                    "unit": "NOs"
                                }
                            ]
                        },
                        {
                            "id": "c8896301-2d38-4850-a6ae-653d6df86671",
                            "sorId": "SOR_000183",
                            "sorType": "M",
                            "referenceId": "4c70fcb1-a1ec-4499-af93-ab0474e9e26e",
                            "amountDetails": [
                                {
                                    "id": "913170d3-bbcc-4224-8a27-626355a97c2f",
                                    "amount": 4.035044,
                                    "type": "M",
                                    "quantity": 4.035044,
                                    "rate": 1,
                                    "name": "Paver Finisher Mechanical",
                                    "unit": "HOUR"
                                }
                            ]
                        }
                    ],
                    "tenantId": "od.testing"
                },
                {
                    "id": "781b5fb4-d434-471e-8c19-7a2114422ed4",
                    "statementId": "bcb0188e-6dab-4ee5-8d28-6867c02b3884",
                    "sorId": "SOR_000734",
                    "basicSorDetails": [
                        {
                            "id": "ef89d49c-f695-4ed3-b0a6-7fa13e3ba254",
                            "amount": 0.8,
                            "type": "M",
                            "quantity": null,
                            "rate": null,
                            "name": null,
                            "unit": null
                        }
                    ],
                    "lineItems": [
                        {
                            "id": "67e91c95-4c87-446a-8875-f8ba41409275",
                            "sorId": "SOR_000074",
                            "sorType": "M",
                            "referenceId": "781b5fb4-d434-471e-8c19-7a2114422ed4",
                            "amountDetails": [
                                {
                                    "id": "f442e886-d433-4298-b97e-64a5c3754155",
                                    "amount": 0.8,
                                    "type": "M",
                                    "quantity": 0.8,
                                    "rate": 1,
                                    "name": "Sand for filling and road blinding",
                                    "unit": "CUM"
                                }
                            ]
                        }
                    ],
                    "tenantId": "od.testing"
                }
            ],
            "auditDetails": {
                "createdBy": "45614d29-9a50-4970-aba5-81b380745f48",
                "lastModifiedBy": "45614d29-9a50-4970-aba5-81b380745f48",
                "createdTime": 1718184935842,
                "lastModifiedTime": 1718184935842
            },
            "additionalDetails": null
        }
    ]
  const history = useHistory();
  const [showActions, setShowActions] = useState(false);
  const { tenantId, estimateId } = Digit.Hooks.useQueryParams();
  const { t } = useTranslation();
  const [actionsMenu, setActionsMenu] = useState([]);
  const [isStateChanged, setStateChanged] = useState(``);
  const [toast, setToast] = useState({ show: false, label: "", error: false });
  const menuRef = useRef();

  const loggedInUserRoles = Digit.Utils.getLoggedInUserDetails("roles");

  const closeMenu = () => {
    setShowActions(false);
}
  Digit.Hooks.useClickOutside(menuRef, closeMenu, showActions);

//   const requestCriteria = {
//     url: "/mukta-estimate/v1/_search",
//     params : revisionNumber ? {tenantId : tenantId , revisionNumber : revisionNumber} : {tenantId : tenantId , estimateNumber : estimateNumber}
//   };

  //fetching estimate data
  //const {isLoading: isDetailedEstimateLoading, data: detailedEstimate} = Digit.Hooks.useCustomAPIHook(requestCriteria);

  //fetching all the estimates for revision original values
//   const requestrevisionCriteria = {
//     url: "/mukta-estimate/v1/_search",
//     params : {tenantId : tenantId , estimateNumber : estimateNumber},
//     config : {
//       cacheTime : 0
//     },
//     changeQueryName: "allDetailedEstimate"
//   };

  //fetching estimate data
  //const {isLoading: isDetailedEstimatesLoading, data: allDetailedEstimate} = Digit.Hooks.useCustomAPIHook(requestrevisionCriteria);
  //fetching project data
//   const { isLoading: isProjectLoading, data: project } = Digit.Hooks.project.useProjectSearch({
//     tenantId,
//     searchParams: {
//       Projects: [
//         {
//           tenantId,
//           id: detailedEstimate?.estimates[0]?.projectId,
//         },
//       ],
//     },
//     config: {
//       enabled: !!detailedEstimate?.estimates[0]?.projectId,
//     },
//   });

  //here make a contract search based on the estimateNumber
//   let { isLoading: isLoadingContracts, data: contracts } = Digit.Hooks.contracts.useContractSearch({
//     tenantId,
//     filters: { tenantId, estimateIds: detailedEstimate?.estimates?.map((ob) => ob?.id) },
//     config: {
//       enabled: !isDetailedEstimateLoading && detailedEstimate?.estimates?.filter((ob) => ob?.businessService !== "REVISION-ESTIMATE")?.[0]?.wfStatus === "APPROVED" ? true : false,
//       cacheTime: 0,
//     },
//   });
//   let validationData = Digit.Hooks.mukta.useEstimateSearchValidation({detailedestimates : allDetailedEstimate,tenantId, t});

  //fetching all work orders for a particular estimate
  //let allContract = contracts;
  //getting the object which will be in workflow, as 1:1:1 mapping is there, one one inworkflow workorder will be there for one estimate
  //let inWorkflowContract = allContract?.filter((ob) => ob?.wfStatus !== "REJECTED")?.[0];
  //let isCreateContractallowed = !(allContract?.filter((ob) => ob?.wfStatus !== "REJECTED")?.length > 0) && !inWorkflowContract;

//   useEffect(() => {
//     let isUserContractCreator = loggedInUserRoles?.includes("WORK_ORDER_CREATOR");
//     if (
//       detailedEstimate?.estimates?.filter((ob) => ob?.businessService !== "REVISION-ESTIMATE")?.[0]?.wfStatus === "APPROVED" &&
//       isUserContractCreator &&
//       !actionsMenu?.find((ob) => ob?.name === "CREATE_CONTRACT") && (isCreateContractallowed == true && (allContract !== undefined || allContract?.length == 0))
//     ) {
//       setActionsMenu((prevState) => [
//         ...prevState,
//         {
//           name: "CREATE_CONTRACT",
//         },
//       ]);
//     }
//     //checking if any work order is inworflow, if it is then view contract will be shown otherwise create contract

//     //if contract is already there just remove the prevState and push View contract state
//     if (contracts?.[0]?.contractNumber && !isCreateContractallowed) {
//       setActionsMenu((prevState) => [
//         ...prevState,
//         {
//           name: "VIEW_CONTRACT",
//         },
//       ]);
//     }

//     let isUserEstimateCreater = loggedInUserRoles?.includes("ESTIMATE_CREATOR");
//     //Checking if REVSION ESTIMATE can be created or not.
//     let isRevisionEstimateInWorkflow = detailedEstimate?.estimates.filter((ob) => ob?.status === "INWORKFLOW")?.length > 0;
//     if( detailedEstimate?.estimates?.filter((ob) => ob?.businessService !== "REVISION-ESTIMATE")?.[0]?.wfStatus === "APPROVED" && !isRevisionEstimateInWorkflow && isUserEstimateCreater && !actionsMenu?.find((ob) => ob?.name === "CREATE_REVISION_ESTIMATE"))
//     {
//       setActionsMenu((prevState) => [
//         ...prevState,
//         {
//           name: "CREATE_REVISION_ESTIMATE",
//         },
//       ]);
//     }
  
//   }, [detailedEstimate, isStateChanged, contracts]);

  const handleToastClose = () => {
    setToast({ show: false, label: "", error: false });
}

  const handleActionBar = (option) => {
    if(validationData && Object.keys(validationData)?.length > 0 && validationData?.type?.includes(option?.name))
    {
      setToast({error: validationData?.error, label: validationData?.label, show:true})
      return;
    }
    if (option?.name === "CREATE_CONTRACT") {
      history.push(`/${window.contextPath}/employee/contracts/create-contract?tenantId=${tenantId}&estimateNumber=${estimateNumber}`);
    }
    if (option?.name === "VIEW_CONTRACT") {
      history.push(
        `/${window.contextPath}/employee/contracts/contract-details?tenantId=${tenantId}&workOrderNumber=${inWorkflowContract?.contractNumber}`
      );
    }
    if (option?.name === "CREATE_REVISION_ESTIMATE") {
      history.push(
        `/${window.contextPath}/employee/estimate/create-revision-detailed-estimate?tenantId=${tenantId}&projectNumber=${project?.projectNumber}&estimateNumber=${estimateNumber}&isCreateRevisionEstimate=true`
      );
    }
  };

//   const HandleDownloadPdf = () => {
//     if(revisionNumber)
//       Digit.Utils.downloadEgovPDF("deviationStatement/deviation-statement", { revisionNumber, tenantId }, `DeviationStatement-${revisionNumber}.pdf`);
//     else
//     Digit.Utils.downloadEgovPDF("detailedEstimate/detailed-estimate", { estimateNumber, tenantId }, `Estimate-${estimateNumber}.pdf`);
//   };

// Consolidated table will be sent overhere
//   const overheads = detailedEstimate?.estimates?.filter((ob) => revisionNumber ? (ob?.revisionNumber === revisionNumber) : (ob?.businessService === "ESTIMATE" || !(ob?.revisionNumber)))?.[0]?.estimateDetails?.filter((row) => row?.category?.includes("OVERHEAD") && row?.isActive);
//   const tableHeaderOverheads = [t("WORKS_SNO"), t("WORKS_OVERHEAD"), t("WORKS_PERCENTAGE"), t("WORKS_AMOUNT")];
//   const tableRowsOverheads = overheads?.map((row, index) => {
//     return [
//       index + 1,
//       t(`ES_COMMON_OVERHEADS_${row?.name}`),
//       row?.additionalDetails?.row?.name?.type?.includes("percent") ? `${row?.additionalDetails?.row?.name?.value}%` : t("WORKS_LUMPSUM"),
//       Digit.Utils.dss.formatterWithoutRound(row?.amountDetail?.[0]?.amount?.toFixed(2), "number"),
//     ];
//   });
//   const totalAmountOverheads = overheads?.reduce((acc, row) => row?.amountDetail?.[0]?.amount + acc, 0);
//   tableRowsOverheads?.push(["", "", t("RT_TOTAL"), Digit.Utils.dss.formatterWithoutRound(totalAmountOverheads, "number")]);
//   const overheadItems = {
//     headers: tableHeaderOverheads,
//     tableRows: tableRowsOverheads,
//     tableStyles: {
//       rowStyle: {},
//       cellStyle: [{}, { width: "50vw", whiteSpace: "break-spaces", wordBreak: "break-all" }, { textAlign: "left" }, { textAlign: "right" }],
//     },
//   };

  const config = data(statement?.[0],statement);

  //if (isProjectLoading || isDetailedEstimateLoading | isDetailedEstimatesLoading) return <Loader />;

  return (
    <div className={"employee-main-application-details"}>
      <div className={"employee-application-details"} style={{ marginBottom: "15px" }}>
        <Header className="works-header-view" styles={{ marginLeft: "0px", paddingTop: "10px" }}>
          {t("ESTIMATE_ANALYSIS_STATEMENT")}
        </Header>
        {/* <MultiLink onHeadClick={() => HandleDownloadPdf()} downloadBtnClassName={"employee-download-btn-className"} label={t("CS_COMMON_DOWNLOAD")} /> */}
      </div>
      <ViewComposer data={config} isLoading={false} />
      {toast?.show && <Toast label={toast?.label} error={toast?.error} isDleteBtn={true} onClose={handleToastClose}></Toast>}
      <>
        {/* {detailedEstimate?.estimates?.filter((ob) => ob?.businessService !== "REVISION-ESTIMATE")?.[0]?.wfStatus === "APPROVED" && !isLoadingContracts && actionsMenu?.length > 0 ? (
          <ActionBar>
          {showActions ? <Menu
              localeKeyPrefix={`EST_VIEW_ACTIONS`}
              options={actionsMenu}
              optionKey={"name"}
              t={t}
              onSelect={handleActionBar}
          />:null} 
          <SubmitBar ref={menuRef} label={t("WORKS_ACTIONS")} onSubmit={() => setShowActions(!showActions)} />
      </ActionBar>
        ) : null} */}
      </>
    </div>
  );
};

export default ViewAnalysisStatement;
