export const getBreakupDetails = ({projectBillData}) => {
  let {wageAmountPaid, purchaseAmountPaid, supervisionAmountPaid} = {wageAmountPaid: 0, purchaseAmountPaid: 0, supervisionAmountPaid: 0};
  if (projectBillData) {
    projectBillData?.map(bill => {
      if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("WB")) {
        wageAmountPaid += bill?.businessObject?.netAmount
      } else if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("PB")) {
        purchaseAmountPaid += bill?.businessObject?.netAmount
      } else if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("SB")) {
        supervisionAmountPaid += bill?.businessObject?.netAmount
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

export const transformBillData = ({projectBillData}) => {
  let billData = [];
  if (projectBillData) {
    projectBillData?.map(bill => {
      billData.push({
        billNumber: bill?.businessObject?.additionalDetails?.billNumber,
        billType: "NA",
        // billType: () => {
        //   if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("WB")) {
        //     return "Wage Bill"
        //   } else if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("EXPENSE.PURCHASE")) {
        //     return "Purchase Bill"
        //   } else if (bill?.businessObject?.additionalDetails?.billNumber?.[0].startsWith("EXPENSE.SUPERVISION")) {
        //     return "Supervision Bill"
        //   }
        // },
        total: bill?.businessObject?.netAmount,
        pinumber: bill?.businessObject?.additionalDetails?.piNumber,
        parentpi: bill?.businessObject?.parentPiNumber,
        pitype: bill?.businessObject?.piType || 'NA',
        picreationdate: bill?.businessObject?.auditDetails?.createdTime,
        paidAmount: bill?.businessObject?.netAmount,
        pidate: bill?.businessObject?.additionalDetails?.piDate,
        pistatus: bill?.businessObject?.piStatus
      })
    })
  }

  return billData;
}