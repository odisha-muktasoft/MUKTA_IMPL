import { useTranslation } from "react-i18next";

export const getBreakupDetails = ({projectBillPaidData}) => {
  let {wageAmountPaid, purchaseAmountPaid, supervisionAmountPaid} = {wageAmountPaid: 0, purchaseAmountPaid: 0, supervisionAmountPaid: 0};

  if (projectBillPaidData) {
    projectBillPaidData?.paymentDetails?.map(bill => {
      if (bill?.billType === "EXPENSE.WAGE") {
        wageAmountPaid += bill?.paidAmount
      } else if (bill?.billType === "EXPENSE.PURCHASE") {
        purchaseAmountPaid += bill?.paidAmount
      } else if (bill?.billType === "EXPENSE.SUPERVISION") {
        supervisionAmountPaid += bill?.paidAmount
      }
    })
  }

  const breakupDetails = {
    wageAmountPaid,
    purchaseAmountPaid,
    supervisionAmountPaid
  };

  return breakupDetails;
}

const getDate = (timestamp) => {
  const date = new Date(timestamp);

  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, '0');
  const day = date.getDate().toString().padStart(2, '0');
  
  return `${day}-${month}-${year}`;
}

export const transformBillData = ({projectBillData}) => {
  const { t } = useTranslation();

  let billData = [];
  if (projectBillData) {
    projectBillData?.map(bill => {
      let billType, piType;
      if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("WB")) {
        billType = t("WAGE_BILL")
      } else if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("PB")) {
        billType = t("PURCHASE_BILL")
      } else if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("SB")) {
        billType = t("SUPERVISION_BILL")
      }
      if (bill?.businessObject?.parentPiNumber) {
        piType = t("REVISED")
      } else {
        piType = t("ORIGINAL")
      }
      const piCreationDate = new Date(bill?.businessObject?.auditDetails?.createdTime);
      const piDate = new Date(bill?.businessObject?.auditDetails?.lastModifiedTime);

      billData.push({
        billNumber: bill?.businessObject?.additionalDetails?.billNumber?.[0],
        workOrderNumber: bill?.businessObject?.additionalDetails?.referenceId?.[0],
        billType: billType,
        total: bill?.businessObject?.netAmount,
        piNumber: bill?.businessObject?.muktaReferenceId,
        parentPi: bill?.businessObject?.parentPiNumber || t("NA"),
        piType: piType,
        piCreationDate: getDate(piCreationDate),
        paidAmount: bill?.businessObject?.netAmount,
        piDate: getDate(piDate),
        piStatus: bill?.businessObject?.piStatus
      })
    })
  }

  return billData;
}