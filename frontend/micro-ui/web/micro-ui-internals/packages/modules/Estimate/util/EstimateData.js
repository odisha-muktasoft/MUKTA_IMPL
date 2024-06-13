/*\
input is estimatedetails array, contract object , type and measurement object 
output is array of object of type which is passed

*/

export const transformEstimateData = (category = "NON-SOR") => {
  return {
    amount: 0,
    consumedQ: 0,
    sNo: 1, // You can set this to any specific value you want
    uom: null,
    description: null,
    unitRate: 0,
    category: category,
    targetId: null,
    approvedQuantity: 0,
    measures: [
      {
        sNo: 1,
        targetId: null,
        isDeduction: false,
        description: null,
        id: 0,
        height: 0,
        width: 0,
        length: 0,
        number: 0,
        noOfunit: 0,
        rowAmount: 0,
        consumedRowQuantity: 0,
      },
    ],
  };
};

//methods is used to calculate the labour, material, machinery charges
export const getLabourMaterialAnalysisCost = (formData,categories) => {

      let SORAmount = formData?.SORtable?.reduce((tot,ob) => {
       let amount = ob?.amountDetails?.reduce((total, item) => total + (categories.some(category => item?.heads?.includes(category)) ? item?.amount : 0), 0);
        return (tot + amount * ob?.currentMBEntry);
    },0);
    SORAmount = SORAmount ? SORAmount : 0;
    return (SORAmount).toFixed(2);
}


export const transformStatementData = (data) => {
  const nestedData = [];

    const { sorDetails } = data;

    console.log(sorDetails,"sordetais");
    sorDetails.forEach((sorDetail, sorIndex) => {
      const { lineItems } = sorDetail;

      console.log(sorDetail,"sorrrr");
      // Main SOR data
      const mainSORRow = {
        sNo: nestedData.length + 1,
        sortype: "sortype",
        code: sorDetail.sorId,
        description: "Main SOR Description",  // Hardcoded
        uom: "UOM",  // Hardcoded
        rate: 0.00,  // Hardcoded
        type: lineItems?.length == 0 ? sorDetail?.basicSorDetails?.[0]?.type : null,
        estimatedQuantity: {
          "M" : sorDetail.lineItems.filter((ob)=> ob?.sorType === "M").length > 0 ? sorDetail.lineItems.filter((ob)=> ob?.sorType === "M").reduce((sum, detail) => sum + (detail.amountDetails?.[0]?.quantity || 0), 0) : sorDetail?.basicSorDetails?.[0]?.quantity || 0.00,
          "L" : sorDetail.lineItems.filter((ob)=> ob?.sorType === "L").length > 0 ? sorDetail.lineItems.filter((ob)=> ob?.sorType === "L").reduce((sum, detail) => sum + (detail.amountDetails?.[0]?.quantity || 0), 0) : sorDetail?.basicSorDetails?.[0]?.quantity || 0.00,
          "MH" : sorDetail.lineItems.filter((ob)=> ob?.sorType === "MH").length > 0 ? sorDetail.lineItems.filter((ob)=> ob?.sorType === "L").reduce((sum, detail) => sum + (detail.amountDetails?.[0]?.quantity || 0), 0) : sorDetail?.basicSorDetails?.[0]?.quantity || 0.00
        },  // Hardcoded
        estimatedAmount: sorDetail.lineItems.length > 0 ? sorDetail.lineItems.reduce((sum, detail) => sum + (detail.amountDetails?.[0]?.amount || 0), 0) : sorDetail?.basicSorDetails?.[0]?.amount, // Sum of amounts in basicSorDetails
        subrows: []  // Initialize subrows array
      };

      // Sub-table rows (line items)
      lineItems.forEach((lineItem) => {
        const { amountDetails } = lineItem;

        amountDetails.forEach((detail) => {
          const subrow = {
            sNo: mainSORRow.subrows.length + 1,
            code: lineItem?.sorId,
            name: detail.name,
            unit: detail.unit,
            rate: detail.rate,
            quantity: detail.quantity,
            amount: detail.amount,
            type: lineItem?.sorType
          };
          mainSORRow.subrows.push(subrow);
        });
      });

      nestedData.push(mainSORRow);
    });

    console.log(nestedData);
    debugger;
  return nestedData;
}


