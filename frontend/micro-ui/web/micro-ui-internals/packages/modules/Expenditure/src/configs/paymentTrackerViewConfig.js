import React, { useState } from "react";

export const paymentTrackerViewConfig = (project, projectBillData, projectId) => {

  const  [excludeFailed, setExcludeFailed] = useState(false);

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
                value: "test",
              },
              {
                key: "PURCHASE_AMOUNT_PAID",
                value: "test",
              },
              {
                key: "SUPERVISION_AMOUNT_PAID",
                value: "test",
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
                tableRows : projectBillData?.paymentDetails,
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
              tableRows : projectBillData?.paymentDetails,
              excludeFailed : excludeFailed
            }
            // props: {mode: "VIEWES", detail : {...estimateDetails, value:measurement?.additionalDetails?.totalAmount} }
          }
        ]
      },
    ]
  }
}