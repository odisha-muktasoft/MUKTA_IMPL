import React, { useEffect, useState } from "react";
import { getBreakupDetails, transformBillData } from "../utils/paymentTrackerUtils";

export const paymentTrackerViewConfig = (project, projectBillPaidData ,projectBillData, projectId) => {

  const [excludeFailed, setExcludeFailed] = useState(false);

  const breakupDetails = getBreakupDetails({projectBillPaidData});

  const tableRows = transformBillData({projectBillData});

  const amountFormatter = (amount) => {
    return Digit.Utils.dss.formatterWithoutRound(Math.round(parseFloat(amount)).toFixed(2),"number",undefined,true,undefined,2);
  }

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
                key: "PROJECT_NAME_SIMPLE",
                value: project?.name,
              },
              {
                key: "PROJECT_LOCATION",
                value: project?.address?.city,
              },
              {
                key: "PROJECT_DESCRIPTION",
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
                value: amountFormatter(projectBillPaidData?.estimatedAmount),
              },
              {
                key: "WAGE_AMOUNT_PAID",
                value: amountFormatter(breakupDetails?.wageAmountPaid),
              },
              {
                key: "PURCHASE_AMOUNT_PAID",
                value: amountFormatter(breakupDetails?.purchaseAmountPaid),
              },
              {
                key: "SUPERVISION_AMOUNT_PAID",
                value: amountFormatter(breakupDetails?.supervisionAmountPaid),
              },
              {
                key: "FAILED_PAYMENT_AMOUNT",
                value: amountFormatter(breakupDetails?.failedPaymentAmount),
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
          }
        ]
      },
    ]
  }
}