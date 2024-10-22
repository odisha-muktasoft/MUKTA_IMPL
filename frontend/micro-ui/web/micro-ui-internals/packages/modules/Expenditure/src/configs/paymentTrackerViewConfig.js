import React, { useState } from "react";
import { getBreakupDetails, transformBillData } from "../utils/paymentTrackerUtils";
import { useTranslation } from "react-i18next";

export const paymentTrackerViewConfig = (project, projectBillPaidData ,projectBillData, projectId) => {

  const { t } = useTranslation();
  const [excludeFailed, setExcludeFailed] = useState(false);

  const breakupDetails = getBreakupDetails({projectBillPaidData});

  const tableRows = transformBillData({projectBillData});

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
                value: `${project?.address?.locality || t("ES_COMMON_NA")}, ${(project?.address?.boundaryType && project?.address?.boundary) ? `${project?.address?.boundaryType} ${project?.address?.boundary}` : t("ES_COMMON_NA")}, ${project?.address?.city || t("ES_COMMON_NA")}`,
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
            cardHeader: { value: "HEAD_WISE_BREAKUP", inlineStyles: {marginBottom : "16px"} },
            values: [
              {
                key: "ESTMATED_AMOUNT",
                value: (projectBillPaidData?.estimatedAmount || 0).toFixed(2),
              },
              {
                key: "WAGE_AMOUNT_PAID",
                value: (breakupDetails?.wageAmountPaid || 0).toFixed(2),
              },
              {
                key: "PURCHASE_AMOUNT_PAID",
                value: (breakupDetails?.purchaseAmountPaid || 0).toFixed(2),
              },
              {
                key: "SUPERVISION_AMOUNT_PAID",
                value: (breakupDetails?.supervisionAmountPaid || 0).toFixed(2),
              },
              {
                key: "FAILED_PAYMENT_AMOUNT",
                value: (breakupDetails?.failedPaymentAmount || 0).toFixed(2),
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