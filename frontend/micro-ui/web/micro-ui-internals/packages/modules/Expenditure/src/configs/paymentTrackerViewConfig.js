import React, { useEffect, useState } from "react";
import { getBreakupDetails, transformBillData } from "../utils/paymentTrackerUtils";

export const paymentTrackerViewConfig = (project, projectBillData, projectId) => {

  const [excludeFailed, setExcludeFailed] = useState(false);
  // const [tableRows, setTableRows] = useState([]);

  // useEffect(() => {
  //   if (projectBillData) {
  //     setTableRows(transformBillData(projectBillData));
  //   }
  // }, [projectBillData]);

  const tableRows = transformBillData({projectBillData});

  const breakupDetails = getBreakupDetails({projectBillData});
  console.log(breakupDetails);
  console.log("tableRows",tableRows);

  return {
    cards: [
      {
        sections: [
          {
            type: "DATA",
            values: [
              {
                key: "PROJECT_ID",
                value: project?.projectNumber,
              },
              {
                key: "PROJECT_NAME",
                value: project?.name,
              },
              {
                key: "PROJECT_LOCATION",
                value: project?.address?.city,
              },
              {
                key: "PROJECT_DESC",
                value: project?.description,
              },
            ],
          },
        ],
      },
      {
        sections: [
          {
            type: "DATA",
            cardHeader: { value: "HEAD_WISE_BREAKUP" },
            values: [
              {
                key: "ESTMATED_AMOUNT",
                value: projectBillData?.estimatedAmount,
              },
              {
                key: "WAGE_AMOUNT_PAID",
                value: breakupDetails?.wageAmountPaid,
              },
              {
                key: "PURCHASE_AMOUNT_PAID",
                value: breakupDetails?.purchaseAmountPaid,
              },
              {
                key: "SUPERVISION_AMOUNT_PAID",
                value: breakupDetails?.supervisionAmountPaid,
              },
              {
                key: "FAILED_PAYMENT_AMOUNT_PAID",
                value: "test",
              },
            ],
          },
        ],
      },
      {
        sections : [
          {
              type : "COMPONENT",
              cardHeader : { value : "PAYMENT_DETAILS" },
              component : "PaymentTrackerTable",
              props : {
                projectId : "test",
                tableRows : tableRows,
                excludeFailed : excludeFailed,
                setExcludeFailed : setExcludeFailed
              }
          },
          {
            type: "COMPONENT",
            // cardHeader: { value: "", inlineStyles: {} },
            component: "ViewTotalPaymentAmount",
            props: {
              mode: "VIEWES",
              tableRows : tableRows,
              excludeFailed : excludeFailed
            }
            // props: {mode: "VIEWES", detail : {...estimateDetails, value:measurement?.additionalDetails?.totalAmount} }
          }
        ]
      },
    ]
  }
}