import { RateAnalysisService } from "../../elements/rateAnalysis";
// dummy data
// const datall = {
//   responseInfo: {
//     apiId: "Rainmaker",
//     ver: null,
//     ts: null,
//     resMsgId: "uief87324",
//     msgId: "1686229830654|en_IN",
//     status: "successful",
//   },
//   rateAnalysis: [
//     {
//       id: "b0bc5d80-b303-4d70-85ec-7fccd8cb2d19",
//       tenantId: "pg",
//       compositionId: "CMP_000001",
//       sorCode: "SOR_000001",
//       sorId: null,
//       sorType: "W",
//       sorSubType: null,
//       sorVariant: null,
//       isBasicVariant: null,
//       uom: null,
//       quantity: null,
//       description: null,
//       status: null,
//       effectiveFrom: "1716537448",
//       analysisQuantity: 100,
//       lineItems: [
//         {
//           id: "aee429e6-672a-49af-8562-22d1018e6536",
//           type: "SOR",
//           targetId: "SOR_0000025",
//           amountDetails: null,
//           additionalDetails: {
//             id: "SOR_0000025",
//             uom: "NOs",
//             sorType: "L",
//             quantity: 1,
//             sorSubType: "S",
//             sorVariant: "NA",
//             description: "SEMI_SKILLED_SCAVENGER",
//             definedQuantity: 2,
//           },
//         },
//         {
//           id: "ca07af3d-eccf-4b39-945f-840f7485526b",
//           type: "SOR",
//           targetId: "SOR_000009",
//           amountDetails: null,
//           additionalDetails: {
//             id: "SOR_000009",
//             uom: "CUM",
//             sorType: "W",
//             quantity: 1,
//             sorSubType: "CC",
//             sorVariant: "FF",
//             description: "C:C: (1:2:4) using 12 mm. size H.G. stone chips including the cost of all materials labour T&P sundries etc complete. (FF)",
//             definedQuantity: 4,
//           },
//         },
//         {
//           id: "3283afa2-f653-4c7d-9fdd-d3b4cbbcdf39",
//           type: "SOR",
//           targetId: "SOR_000010",
//           amountDetails: [
//             {
//               id: null,
//               type: "fixed",
//               heads: "MA.1",
//               amount: 392.0,
//             },
//           ],
//           additionalDetails: {
//             id: "SOR_000010",
//             uom: "SQM",
//             sorType: "W",
//             quantity: 1,
//             sorSubType: "HS",
//             sorVariant: "ST",
//             description: "Earth work",
//             definedQuantity: 2,
//             rate: {
//               id: null,
//               tenantId: null,
//               sorCode: null,
//               sorId: "SOR_000010",
//               sorType: null,
//               sorSubType: null,
//               sorVariant: null,
//               isBasicVariant: null,
//               uom: null,
//               quantity: null,
//               description: null,
//               rate: 200,
//               validFrom: "1698364800000",
//               validTo: "NaN",
//               amountDetails: [
//                 {
//                   id: null,
//                   type: "fixed",
//                   heads: "MA.1",
//                   amount: 392.0,
//                 },
//               ],
//             },
//           },
//         },
//         {
//           id: null,
//           type: "EXTRACHARGES",
//           targetId: null,
//           amountDetails: [
//             {
//               id: null,
//               type: "fixed",
//               heads: "SOR_0000025",
//               amount: 20,
//             },
//           ],
//           additionalDetails: {
//             SOR_0000025: ["GST"],
//           },
//         },
//       ],
//     },
//   ],
// };

//end

// const transformRateAnalysisViewDataToApplicationDetails = async (data) => {
//   let groupedByHeads = {};

//   // Grouping amountDetails by heads, excluding those with null heads
//   data.rateAnalysis.forEach((analysis) => {
//     analysis.lineItems.forEach((item) => {
//       item.amountDetails.forEach((detail) => {
//         if (detail.heads) {
//           const head = detail.heads;
//           if (!groupedByHeads[head]) {
//             groupedByHeads[head] = [];
//           }
//           let data = {
//             id: item?.id,
//             type: item?.type,
//             targetId: item?.targetId,
//             amountDetails: [
//               {
//                 id: detail?.id,
//                 type: detail?.type,
//                 heads: detail?.heads,
//                 amount: detail?.amount,
//               },
//             ],
//             additionalDetails: {
//               id: item?.additionalDetails?.id,
//               uom: item?.additionalDetails?.uom,
//               sorType: item?.additionalDetails?.sorType,
//               quantity: item?.additionalDetails?.quantity,
//               sorSubType: item?.additionalDetails?.sorSubType,
//               sorVariant: item?.additionalDetails?.sorVariant,
//               description: item?.additionalDetails?.description,
//             },
//           };
//           groupedByHeads[head].push(data);
//         }
//       });
//     });
//   });
// console.log(groupedByHeads);
//   return {
//     groupedByHead: groupedByHeads,
//     rateAnalysisDetail: data.rateAnalysis[0],
//   };
// };

//

const transformRateAnalysisViewDataToApplicationDetails = async (data) => {
  let groupedByHeads = {};
   let infoCard=false;
  // Grouping amountDetails by heads, excluding those with null heads
  data.rateAnalysis.forEach((analysis) => {
    analysis.lineItems.forEach((item) => {
      // Check if amountDetails is null or empty
      if (item.type === "EXTRACHARGES") {
        let head = "EXTRACHARGES";

        if (!groupedByHeads[head]) {
          groupedByHeads[head] = [];
        }

       
        item.amountDetails.forEach((detail) => {
         
          let data = {
            id: item?.id,
            type: item?.type,
            targetId: item?.targetId,
            amountDetails: [
              {
                id: detail?.id,
                type: detail?.type,
                heads: detail?.heads,
                amount: detail?.amount,
              },
            ],
            additionalDetails: {
              id: item?.additionalDetails?.id,
              uom: item?.additionalDetails?.uom,
              sorType: detail?.heads,
              quantity: detail?.amount,
              sorSubType: item?.additionalDetails?.sorSubType,
              sorVariant: item?.additionalDetails?.sorVariant,
              description: item?.additionalDetails?.[detail?.heads][0],
            },
          };
        
          groupedByHeads[head].push(data);
        });
        //end
      } else {
        if (item.amountDetails == null) {
          let head = item?.additionalDetails?.sorType;

          if (!groupedByHeads[head]) {
            groupedByHeads[head] = [];
          }

          let data = {
            id: item?.id,
            type: item?.type,
            targetId: item?.targetId,
            amountDetails: [
              {
                id: "",
                type: "",
                heads: "",
                amount: 0.0,
              },
            ],
            additionalDetails: {
              id: item?.additionalDetails?.id,
              uom: item?.additionalDetails?.uom,
              sorType: item?.additionalDetails?.sorType,
              quantity: item?.additionalDetails?.definedQuantity,
              sorSubType: item?.additionalDetails?.sorSubType,
              sorVariant: item?.additionalDetails?.sorVariant,
              description: item?.additionalDetails?.description,
            },
          };
         
          groupedByHeads[head].push(data);
          infoCard=true;
        } else {
          // Handle cases where amountDetails is null or empty
          item.amountDetails.forEach((detail) => {
            infoCard=false;
            if (detail.heads) {
              let head = detail.heads;

              if (!groupedByHeads[head]) {
                groupedByHeads[head] = [];
              }
              let data = {
                id: item?.id,
                type: item?.type,
                targetId: item?.targetId,
                amountDetails: [
                  {
                    id: detail?.id,
                    type: detail?.type,
                    heads: detail?.heads,
                    amount: detail?.amount,
                  },
                ],
                additionalDetails: {
                  id: item?.additionalDetails?.id,
                  uom: item?.additionalDetails?.uom,
                  sorType: item?.additionalDetails?.sorType,
                  quantity: item?.additionalDetails?.definedQuantity,
                  sorSubType: item?.additionalDetails?.sorSubType,
                  sorVariant: item?.additionalDetails?.sorVariant,
                  description: item?.additionalDetails?.description,
                  basicRate:item?.additionalDetails?.rate?.rate,
                },
              };

              groupedByHeads[head].push(data);
            }
          });
        }
      }
    });
  });

  
  return {
    groupedByHead: groupedByHeads,
    rateAnalysisDetail: data.rateAnalysis[0],
    infoCard:infoCard
  };
};
// View object to handle fetching and transforming rate analysis details
export const View = {
  fetchRateAnalysisDetails: async (tenantId, data) => {
    try {
      const response = await RateAnalysisService.search(tenantId, data);

      if (!response || !response.rateAnalysis) {
        throw new Error("Invalid response from RateAnalysisService");
      }

      const res = await transformRateAnalysisViewDataToApplicationDetails(response);

      return res;
    } catch (error) {
      throw new Error(error?.response?.data?.Errors?.[0]?.message || "An error occurred");
    }
  },
};
