import { RateAnalysisService } from "../../elements/rateAnalysis";

const transformRateAnalysisViewDataToApplicationDetails = async (data) => {
  let groupedByHeads = {};
  let infoCard = false;
  // Grouping amountDetails by heads, excluding those with null heads
  data.rateAnalysis.forEach((analysis) => {
    analysis.lineItems.forEach((item) => {
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
          infoCard = true;
        } else {
          // Handle cases where amountDetails is null or empty
          item.amountDetails.forEach((detail) => {
            infoCard = false;
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
                    amount: parseFloat(detail?.amount.toFixed(2)),
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
                  basicRate: parseFloat(item?.additionalDetails?.rate?.rate.toFixed(2)),
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
    infoCard: infoCard,
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
