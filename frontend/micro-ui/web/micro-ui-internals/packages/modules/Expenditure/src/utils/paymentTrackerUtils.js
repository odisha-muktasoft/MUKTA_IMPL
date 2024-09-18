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
  let billData = [];
  if (projectBillData) {
    projectBillData?.map(bill => {
      let billType, piType;
      if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("WB")) {
        billType = "Wage Bill"
      } else if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("PB")) {
        billType = "Purchase Bill"
      } else if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("SB")) {
        billType = "Supervision Bill"
      }
      if (bill?.businessObject?.parentPiNumber) {
        piType = "REVISED"
      } else {
        piType = "ORIGINAL"
      }
      const piCreationDate = new Date(bill?.businessObject?.auditDetails?.createdTime);
      const piDate = new Date(bill?.businessObject?.additionalDetails?.paDetails?.auditDetails?.createdTime);

      billData.push({
        billNumber: bill?.businessObject?.additionalDetails?.billNumber?.[0],
        workOrderNumber: bill?.businessObject?.additionalDetails?.referenceId?.[0],
        billType: billType,
        total: bill?.businessObject?.netAmount,
        piNumber: bill?.businessObject?.additionalDetails?.paDetails?.piId,
        parentPi: bill?.businessObject?.parentPiNumber || "NA",
        piType: piType,
        piCreationDate: getDate(piCreationDate),
        paidAmount: bill?.businessObject?.netAmount,
        piDate: getDate(piDate),
        // piDate: bill?.businessObject?.additionalDetails?.paDetails?.auditDetails?.createdTime,
        piStatus: bill?.businessObject?.piStatus
      })
    })
  }

  return billData;
}