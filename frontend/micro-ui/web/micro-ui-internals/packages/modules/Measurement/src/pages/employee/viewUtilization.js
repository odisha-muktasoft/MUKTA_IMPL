import React, { Fragment, useState, useEffect, useRef } from "react";
import {
  Loader,
  Header,
  MultiLink,
  StatusTable,
  Card,
  Row,
  HorizontalNav,
  ViewDetailsCard,
  Toast,
  ActionBar,
  Menu,
  SubmitBar,
} from "@egovernments/digit-ui-react-components";
import { useTranslation } from "react-i18next";
import { ViewComposer } from "@egovernments/digit-ui-react-components";
import { data } from "../../configs/viewUtilConfig";
import { useHistory, useLocation } from "react-router-dom";

const ViewUtilization = () => {
  // let statement = [
  //   {
  //     "id": "b17bdb3c-f0c4-4507-abaf-285d7afea03e",
  //     "tenantId": "pg.citya",
  //     "targetId": "654cca5a-9ff7-4508-bfe5-5fc49956e96a",
  //     "statementType": "ANALYSIS",
  //     "basicSorDetails": [
  //       {
  //         "id": null,
  //         "amount": 157.98,
  //         "type": "W",
  //         "quantity": null
  //       },
  //       {
  //         "id": null,
  //         "amount": 280,
  //         "type": "L",
  //         "quantity": null
  //       }
  //     ],
  //     "sorDetails": [
  //       {
  //         "id": "b22e7f9b-817f-4515-9392-d79d093b282d",
  //         "statementId": "b17bdb3c-f0c4-4507-abaf-285d7afea03e",
  //         "sorId": "SOR_000002",
  //         "basicSorDetails": [
  //           {
  //             "id": "fae0aa76-bf46-449a-b7fe-964a7fc595c4",
  //             "amount": 157.98,
  //             "type": "W",
  //             "quantity": null
  //           },
  //           {
  //             "id": "ac6ed4b2-3f93-4210-bce5-c6140b0edf24",
  //             "amount": 280,
  //             "type": "L",
  //             "quantity": null
  //           }
  //         ],
  //         "lineItems": [
  //           {
  //             "id": "4452034c-7878-424f-8cb6-e243cad53890",
  //             "sorId": "SOR_000009",
  //             "sorType": "W",
  //             "referenceId": "b22e7f9b-817f-4515-9392-d79d093b282d",
  //             "basicSorDetails": [
  //               {
  //                 "id": "0090b821-459f-4453-bbd3-e9ce45b67540",
  //                 "amount": 157.2,
  //                 "type": "W",
  //                 "quantity": 0.4
  //               }
  //             ],
  //             "additionalDetails": {
  //               "rateDetails": {
  //                 "id": null,
  //                 "tenantId": null,
  //                 "sorCode": null,
  //                 "sorId": "SOR_000009",
  //                 "sorType": null,
  //                 "sorSubType": null,
  //                 "sorVariant": null,
  //                 "isBasicVariant": null,
  //                 "uom": null,
  //                 "quantity": null,
  //                 "description": null,
  //                 "rate": 393,
  //                 "validFrom": "1702857600000",
  //                 "validTo": null,
  //                 "amountDetails": [
  //                   {
  //                     "id": null,
  //                     "type": "fixed",
  //                     "heads": "LA.2",
  //                     "amount": 200
  //                   }
  //                 ]
  //               },
  //               "sorDetails": {
  //                 "id": "SOR_000009",
  //                 "uom": "CUM",
  //                 "sorType": "W",
  //                 "quantity": 1,
  //                 "sorSubType": "CC",
  //                 "sorVariant": "FF",
  //                 "description": "C:C: (1:2:4) using 12 mm. size H.G. stone chips including the cost of all materials labour T&P sundries etc complete. (FF)"
  //               }
  //             }
  //           },
  //           {
  //             "id": "fb1cb28f-7f72-4a01-9880-2e122ac9538a",
  //             "sorId": "SOR_000003",
  //             "sorType": "W",
  //             "referenceId": "b22e7f9b-817f-4515-9392-d79d093b282d",
  //             "basicSorDetails": [
  //               {
  //                 "id": "82bdac99-3407-4ca2-913d-d4a354a7a917",
  //                 "amount": 0.78,
  //                 "type": "W",
  //                 "quantity": 0.0017
  //               }
  //             ],
  //             "additionalDetails": {
  //               "rateDetails": {
  //                 "id": null,
  //                 "tenantId": null,
  //                 "sorCode": null,
  //                 "sorId": "SOR_000003",
  //                 "sorType": null,
  //                 "sorSubType": null,
  //                 "sorVariant": null,
  //                 "isBasicVariant": null,
  //                 "uom": null,
  //                 "quantity": null,
  //                 "description": null,
  //                 "rate": 456,
  //                 "validFrom": "1702944000000",
  //                 "validTo": null,
  //                 "amountDetails": [
  //                   {
  //                     "id": null,
  //                     "type": "fixed",
  //                     "heads": "RA.5",
  //                     "amount": 200
  //                   }
  //                 ]
  //               },
  //               "sorDetails": {
  //                 "id": "SOR_000003",
  //                 "uom": "CUM",
  //                 "sorType": "W",
  //                 "quantity": 120,
  //                 "sorSubType": "CC",
  //                 "sorVariant": "GF",
  //                 "description": "P.C.C. Grade M25  Using Batching plant, Transit Mixer and concrete pump (Data for 120.00 Cum) [First Floor]"
  //               }
  //             }
  //           },
  //           {
  //             "id": "e99f5df4-eb85-4677-ab86-98781f72e0fe",
  //             "sorId": "SOR_0000011",
  //             "sorType": "L",
  //             "referenceId": "b22e7f9b-817f-4515-9392-d79d093b282d",
  //             "basicSorDetails": [
  //               {
  //                 "id": "71a91a81-8c70-4a57-b9e1-8474c54916d1",
  //                 "amount": 280,
  //                 "type": "L",
  //                 "quantity": 0.4
  //               }
  //             ],
  //             "additionalDetails": {
  //               "rateDetails": {
  //                 "id": null,
  //                 "tenantId": null,
  //                 "sorCode": null,
  //                 "sorId": "SOR_0000011",
  //                 "sorType": null,
  //                 "sorSubType": null,
  //                 "sorVariant": null,
  //                 "isBasicVariant": null,
  //                 "uom": null,
  //                 "quantity": null,
  //                 "description": null,
  //                 "rate": 700,
  //                 "validFrom": "1712580560000",
  //                 "validTo": "null",
  //                 "amountDetails": [
  //                   {
  //                     "id": "123",
  //                     "type": "fixed",
  //                     "heads": "FH.123",
  //                     "amount": 700
  //                   }
  //                 ]
  //               },
  //               "sorDetails": {
  //                 "id": "SOR_0000011",
  //                 "uom": "NOs",
  //                 "sorType": "L",
  //                 "quantity": 1,
  //                 "sorSubType": "S",
  //                 "sorVariant": "NA",
  //                 "description": "SKILLED FEMALE MULIA."
  //               }
  //             }
  //           }
  //         ],
  //         "tenantId": "pg.citya",
  //         "isActive": true,
  //         "additionalDetails": {
  //           "rateDetails": {
  //             "id": "2",
  //             "tenantId": null,
  //             "sorCode": null,
  //             "sorId": "SOR_000002",
  //             "sorType": null,
  //             "sorSubType": null,
  //             "sorVariant": null,
  //             "isBasicVariant": null,
  //             "uom": null,
  //             "quantity": null,
  //             "description": "Earth Work",
  //             "rate": 439070.35,
  //             "validFrom": "1698796800000",
  //             "validTo": "1923609600000",
  //             "amountDetails": [
  //               {
  //                 "id": null,
  //                 "type": "fixed",
  //                 "heads": "LC.6",
  //                 "amount": 4347.23
  //               },
  //               {
  //                 "id": null,
  //                 "type": "fixed",
  //                 "heads": "RA.5",
  //                 "amount": 15928
  //               },
  //               {
  //                 "id": null,
  //                 "type": "fixed",
  //                 "heads": "CA.4",
  //                 "amount": 32001.01
  //               },
  //               {
  //                 "id": null,
  //                 "type": "fixed",
  //                 "heads": "MHA.3",
  //                 "amount": 32001.01
  //               },
  //               {
  //                 "id": null,
  //                 "type": "fixed",
  //                 "heads": "LA.2",
  //                 "amount": 7095.84
  //               },
  //               {
  //                 "id": null,
  //                 "type": "fixed",
  //                 "heads": "MA.1",
  //                 "amount": 329936.45
  //               }
  //             ]
  //           },
  //           "sorDetails": {
  //             "id": "SOR_000002",
  //             "uom": "CUM",
  //             "sorType": "W",
  //             "quantity": 120,
  //             "sorSubType": "CC",
  //             "sorVariant": "GF",
  //             "description": "P.C.C. Grade M25  Using Batching plant, Transit Mixer and concrete pump (Data for 120.00 Cum)"
  //           }
  //         }
  //       }
  //     ],
  //     "auditDetails": {
  //       "createdBy": "45614d29-9a50-4970-aba5-81b380745f48",
  //       "lastModifiedBy": "45614d29-9a50-4970-aba5-81b380745f48",
  //       "createdTime": 1718713193272,
  //       "lastModifiedTime": 1718713193272
  //     },
  //     "additionalDetails": {
  //       "estimateNumber": "ES/2024-25/000311"
  //     }
  //   }
  // ]

  //
  // let statement = [
  //   {
  //     "id": "251c51eb-e970-4e01-a99a-70136c47a934",
  //     "tenantId": "pb.jalandhar OR dwss",
  //     "targetId": "461c51eb-e970-4e01-a99a-70136c47a934",
  //     "additionalDetails": {},
  //     "basicSorDetails": [
  //       {
  //         "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  //         "amount": 1534,
  //         "type": "Labour",
  //         "quantity": 0,
  //         "rate": 0
  //       }
  //     ],
  //     "sorDetails": [
  //       {
  //         "id": "string",
  //         "statementId": "string",
  //         "sorId": "SOR-W1",
  //         "additionalDetails": {
  //           "sorDetails": {
  //             "id": "SOR_000692",
  //             "uom": "SQM",
  //             "sorType": "W",
  //             "quantity": 1.0,
  //             "sorSubType": "PA",
  //             "sorVariant": "TF",
  //             "description": "Finishing walls with water proffing cement paint two coats with cost of cement paint"
  //           },
  //           "rateDetails": {
  //             "rate": 654,
  //             "sorId": "SOR_000692",
  //             "validTo": "1709251200000",
  //             "validFrom": "1709251200000",
  //             "amountDetails": [
  //                 {
  //                     "type": "fixed",
  //                     "heads": "CA.9",
  //                     "amount": 98765
  //                 }
  //             ]
  //           }
  //         },
  //         "basicSorDetails": [
  //           {
  //             "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  //             "amount": 1534,
  //             "type": "Labour",
  //             "quantity": 0,
  //             "rate": 0
  //           }
  //         ],
  //         "lineItems": [
  //           {
  //             "id": "string",
  //             "sorId": "SOR-1",
  //             "sorType": "Labour",
  //             "additionalDetails": {
  //               "sorDetails": {
  //                 "id": "SOR_000692",
  //                 "uom": "SQM",
  //                 "sorType": "W",
  //                 "quantity": 1.0,
  //                 "sorSubType": "PA",
  //                 "sorVariant": "TF",
  //                 "description": "Finishing walls with water proffing cement paint two coats with cost of cement paint"
  //               },
  //               "rateDetails": {
  //                 "rate": 654,
  //                 "sorId": "SOR_000692",
  //                 "validTo": "1709251200000",
  //                 "validFrom": "1709251200000",
  //                 "amountDetails": [
  //                     {
  //                         "type": "fixed",
  //                         "heads": "CA.9",
  //                         "amount": 98765
  //                     }
  //                 ]
  //               }
  //             },
  //             "basicSorDetails": [
  //               {
  //                 "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  //                 "amount": 1534,
  //                 "type": "Labour",
  //                 "quantity": 0,
  //                 "rate": 0
  //               }
  //             ]
  //           }
  //         ]
  //       }
  //     ]
  //   }
  // ]

  const history = useHistory();
  const [showActions, setShowActions] = useState(false);
  // const { tenantId, estimateId } = Digit.Hooks.useQueryParams();
  const tenantId = Digit.ULBService.getCurrentTenantId();
  const { t } = useTranslation();
  const [actionsMenu, setActionsMenu] = useState([]);
  const [isStateChanged, setStateChanged] = useState(``);
  const [toast, setToast] = useState({ show: false, label: "", error: false });
  const menuRef = useRef();

  const loggedInUserRoles = Digit.Utils.getLoggedInUserDetails("roles");

  //look here need to uncomment once api works fine and check if the data is coming proper
  // const { state,refId } = useLocation()
  const location = useLocation();
  const { responseData, estimateId, number } = location.state || {};

  let statement = responseData?.statement;

  const closeMenu = () => {
    setShowActions(false);
  };
  Digit.Hooks.useClickOutside(menuRef, closeMenu, showActions);

  const handleToastClose = () => {
    setToast({ show: false, label: "", error: false });
  };

  const config = data(statement?.[0], statement);

  //if (isProjectLoading || isDetailedEstimateLoading | isDetailedEstimatesLoading) return <Loader />;
  const HandleDownloadPdf = () => {
    // Digit.Utils.downloadEgovPDF(`analysisUtilization/analysis-utilization?tenantId=${tenantId}&referenceId=${formId}`,{referenceId:formId},`utilization-${refId}.pdf`)
    Digit.Utils.downloadEgovPDF(
      "utilizationStatement/utilization-statement",
      { tenantId: tenantId, referenceId: estimateId },
      `utilization-${number}.pdf`
    );
  };
  return (
    <div className={"employee-main-application-details"}>
      <div className={"employee-application-details"} style={{ marginBottom: "15px", marginRight: "5px" }}>
        <Header className="works-header-view" styles={{ marginLeft: "0px", paddingTop: "10px" }}>
          {t("MB_VIEW_UTLIZATION")}
        </Header>
        <MultiLink onHeadClick={() => HandleDownloadPdf()} downloadBtnClassName={"employee-download-btn-className"} label={t("CS_COMMON_DOWNLOAD")} />
      </div>
      <ViewComposer data={config} isLoading={false} />
      {toast?.show && (
        <Toast
          style={{ width: "100%", display: "flex", justifyContent: "space-between", whiteSpace: "nowrap" }}
          label={toast?.label}
          error={toast?.error}
          isDleteBtn={true}
          onClose={handleToastClose}
        ></Toast>
      )}
      <>
        <ActionBar>
          <SubmitBar onSubmit={() => history.goBack()} label={t("STATEMENT_GO_BACK")} />
        </ActionBar>
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

export default ViewUtilization;
