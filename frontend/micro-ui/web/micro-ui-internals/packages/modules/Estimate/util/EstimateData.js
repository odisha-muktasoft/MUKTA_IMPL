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
export const getLabourMaterialAnalysisCost = (formData, categories) => {
  let SORAmount = formData?.SORtable?.reduce((tot, ob) => {
    let amount = ob?.amountDetails?.reduce(
      (total, item) => total + (categories.some((category) => item?.heads?.includes(category)) ? item?.amount : 0),
      0
    );
    return tot + amount * ob?.currentMBEntry;
  }, 0);
  SORAmount = SORAmount ? SORAmount : 0;
  return SORAmount.toFixed(2);
};

export const transformStatementData = (data) => {
  const nestedData = [];

  const { sorDetails } = data;

  console.log(sorDetails, "sordetais");
  sorDetails.forEach((sorDetail, sorIndex) => {
    const { lineItems } = sorDetail;

    console.log(sorDetail, "sorrrr");
    // Main SOR data
    const mainSORRow = {
      sNo: nestedData.length + 1,
      sortype: `WORKS_SOR_TYPE_${sorDetail?.additionalDetails?.sorDetails?.sorType}`,
      code: sorDetail.sorId,
      description: sorDetail?.additionalDetails?.sorDetails?.description, // Hardcoded
      uom: sorDetail?.additionalDetails?.sorDetails?.uom, // Hardcoded
      rate: sorDetail?.additionalDetails?.rateDetails?.rate, // Hardcoded
      type: lineItems?.length == 0 ? sorDetail?.basicSorDetails?.[0]?.type : null,
      estimatedQuantity: {
        M:
          sorDetail.lineItems.filter((ob) => ob?.sorType === "M").length > 0
            ? sorDetail.lineItems.filter((ob) => ob?.sorType === "M").reduce((sum, detail) => sum + (detail.basicSorDetails?.[0]?.quantity || 0), 0)
            : sorDetail?.basicSorDetails?.[0]?.quantity || 0.0,
        L:
          sorDetail.lineItems.filter((ob) => ob?.sorType === "L").length > 0
            ? sorDetail.lineItems.filter((ob) => ob?.sorType === "L").reduce((sum, detail) => sum + (detail.basicSorDetails?.[0]?.quantity || 0), 0)
            : sorDetail?.basicSorDetails?.[0]?.quantity || 0.0,
        MH:
          sorDetail.lineItems.filter((ob) => ob?.sorType === "MH").length > 0
            ? sorDetail.lineItems.filter((ob) => ob?.sorType === "L").reduce((sum, detail) => sum + (detail.basicSorDetails?.[0]?.quantity || 0), 0)
            : sorDetail?.basicSorDetails?.[0]?.quantity || 0.0,
      }, // Hardcoded

      // TODO:[previous code]
      // estimatedAmount:
      //   sorDetail.lineItems.length > 0
      //     ? sorDetail.lineItems.reduce((sum, detail) => sum + (detail.amountDetails?.[0]?.amount || 0), 0)
      //     : sorDetail?.basicSorDetails?.[0]?.amount, // Sum of amounts in basicSorDetails

      // end of the comment

      estimatedAmount:{
        M:
          sorDetail.lineItems.filter((ob) => ob?.sorType === "M").length > 0
            ? sorDetail.lineItems.filter((ob) => ob?.sorType === "M").reduce((sum, detail) => sum + (detail.basicSorDetails?.[0]?.amount || 0), 0)
            : sorDetail?.basicSorDetails?.[0]?.amount || 0.0,
        L:
          sorDetail.lineItems.filter((ob) => ob?.sorType === "L").length > 0
            ? sorDetail.lineItems.filter((ob) => ob?.sorType === "L").reduce((sum, detail) => sum + (detail.basicSorDetails?.[0]?.amount || 0), 0)
            : sorDetail?.basicSorDetails?.[0]?.amount || 0.0,
        MH:
          sorDetail.lineItems.filter((ob) => ob?.sorType === "MH").length > 0
            ? sorDetail.lineItems.filter((ob) => ob?.sorType === "L").reduce((sum, detail) => sum + (detail.basicSorDetails?.[0]?.amount || 0), 0)
            : sorDetail?.basicSorDetails?.[0]?.amount || 0.0,
      },

      subrows: [], // Initialize subrows array
    };

    // Sub-table rows (line items)
    lineItems.forEach((lineItem) => {
      const { amountDetails } = lineItem?.additionalDetails?.rateDetails;

      amountDetails.forEach((detail) => {
        const subrow = {
          sNo: mainSORRow.subrows.length + 1,
          code: lineItem?.sorId,
          name: lineItem?.additionalDetails?.sorDetails?.description,
          unit: lineItem?.additionalDetails?.sorDetails?.uom,
          rate: lineItem?.additionalDetails?.rateDetails?.rate,
          quantity: parseFloat(lineItem?.basicSorDetails[0]?.quantity),
          amount: lineItem?.basicSorDetails[0]?.amount,
          type: lineItem?.additionalDetails?.sorDetails?.sorType,
        };
        mainSORRow.subrows.push(subrow);
      });
    });

    nestedData.push(mainSORRow);
  });

  return nestedData;
};

export const sortSorsBasedonType = (statement) => {
  // Function to create the array of objects based on the requirement

  let resultArray = [];

  statement.forEach((item) => {
    item.sorDetails.forEach((detail) => {
      let sorId = detail.lineItems.length > 0 ? detail.lineItems[0].sorId : detail.sorId;
      let description = null;
      let type = null;
      let amount = null;
      let quantity = null;
      let uom = null;
      let rate = null;

      // If lineItems exist, use them; otherwise, use basicSorDetails
      if (detail.lineItems.length > 0) {
        detail.lineItems.forEach((line) => {
          line.additionalDetails?.rateDetails?.amountDetails.forEach((amountDetail) => {
            description = line?.additionalDetails?.sorDetails?.description;
            type = line?.additionalDetails?.sorDetails?.sorType;
            amount = line?.basicSorDetails?.[0]?.amount;
            quantity = line?.basicSorDetails[0]?.quantity;
            uom = line?.additionalDetails?.sorDetails?.uom;
            rate = line.additionalDetails?.rateDetails?.rate;

            resultArray.push({
              sorId,
              description,
              type,
              amount,
              quantity,
              uom,
              rate,
            });
          });
        });
      } else {
        detail.basicSorDetails.forEach((basic) => {
          description = basic.name;
          type = basic.type;
          amount = basic.amount;
          quantity = basic.quantity;
          uom = basic.uom;
          rate = basic?.rate;
          resultArray.push({
            sorId,
            description,
            type,
            amount,
            quantity,
            uom,
            rate,
          });
        });
      }
    });
  });

  console.log("INDIA", resultArray);
  return resultArray;

  // Create the array of objects based on the provided statement data
};
