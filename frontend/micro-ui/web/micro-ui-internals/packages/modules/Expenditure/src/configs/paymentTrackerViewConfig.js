import React, { useState } from "react";

export const paymentTrackerViewConfig = () => {

  const [failedRowschecked, setFailedRowschecked] = useState(false);

  const tableRows = [
    {
      number: "123456",
      type: "Wage Bill",
      amount: 1000,
      pinumber: "123456",
      parentpi: "123456",
      pitype: "Water",
      picreationdate: "2021-01-01",
      piamount: 10000,
      pidate: "2021-01-01",
      pistatus: "Successful",
    },
    {
      number: "786521",
      type: "Purchase Bill",
      amount: 2000,
      pinumber: "123456",
      parentpi: "123456",
      pitype: "Water",
      picreationdate: "2021-01-01",
      piamount: 10000,
      pidate: "2021-01-01",
      pistatus: "Partial",
    },
    {
      number: "786521",
      type: "Supervision Bill",
      amount: 2000,
      pinumber: "123456",
      parentpi: "123456",
      pitype: "Water",
      picreationdate: "2021-01-01",
      piamount: 10000,
      pidate: "2021-01-01",
      pistatus: "Failed",
    },
  ];

  return {
    cards: [
      {
        sections: [
          {
            type: "DATA",
            values: [
              {
                key: "PROJECT_ID",
                value: "test",
              },
              {
                key: "PROJECT_NAME",
                value: "test",
              },
              {
                key: "PROJECT_LOCATION",
                value: "test",
              },
              {
                key: "PROJECT_DESC",
                value: "test",
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
                value: "test",
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
                tableRows : tableRows
              }
          },
          {
            type: "COMPONENT",
            // cardHeader: { value: "", inlineStyles: {} },
            component: "ViewTotalPaymentAmount",
            props: {
              mode: "VIEWES",
              tableRows : tableRows
            }
            // props: {mode: "VIEWES", detail : {...estimateDetails, value:measurement?.additionalDetails?.totalAmount} }
          }
        ]
      },
    ]
  }
}