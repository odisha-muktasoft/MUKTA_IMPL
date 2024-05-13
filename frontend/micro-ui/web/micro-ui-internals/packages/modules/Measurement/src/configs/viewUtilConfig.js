import React, { useState, useEffect } from "react";
import { transformEstimateData, findMusterRollNumber } from "../utils/transformEstimateData";

export const viewUtilData = (
  contract,
  estimateDetails,
  measurement,
  allMeasurements,
  thumbnails,
  projectLocation,
  period,
  musterRollNumber,
  musterRolls
) => {
  const [viewData, setViewData] = useState({ SOR: [], NONSOR: [] });

  useEffect(() => {
    const processArrays = () => {
      if (estimateDetails) {
        setViewData({
          SOR: transformEstimateData(estimateDetails?.estimateDetails, contract, "SOR", measurement, allMeasurements,true),
          NONSOR: transformEstimateData(estimateDetails?.estimateDetails, contract, "NON-SOR", measurement, allMeasurements,true),
        });

       
      }
    };
    processArrays();
  }, [estimateDetails]);

  let musterrollNumber = findMusterRollNumber(
    musterRolls,
    measurement?.measurementNumber,
    measurement?.additionalDetails?.startDate,
    measurement?.additionalDetails?.endDate
  );

  return {
    cards: [
      {
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "SOR Wise Machinery", inlineStyles: {} },
            component: "ViewUtilTable",
            props: {
              config: {
                key: "SOR",
                mode: "VIEW",
              },
              arrayProps: {
                fields: viewData?.SOR,
              },
              register: () => {},
              setValue: (key, value) => setViewData((old) => ({ ...old, SOR: value })),
            },
          },
        ],
      },
    ],
    apiResponse: {},
    additionalDetails: {},
    horizontalNav: {
      showNav: false,
      configNavItems: [],
      activeByDefault: "",
    },
  };
};

//

export const viewUtilSecondData = (
  contract,
  estimateDetails,
  measurement,
  allMeasurements,
  thumbnails,
  projectLocation,
  period,
  musterRollNumber,
  musterRolls
) => {
  const [viewData, setViewData] = useState({ SOR: [], NONSOR: [] });

  useEffect(() => {
    const processArrays = () => {
      if (estimateDetails) {
        setViewData({
          SOR: transformEstimateData(estimateDetails?.estimateDetails, contract, "SOR", measurement, allMeasurements),
          NONSOR: transformEstimateData(estimateDetails?.estimateDetails, contract, "NON-SOR", measurement, allMeasurements),
        });
      }
    };
    processArrays();
  }, [estimateDetails]);

  let musterrollNumber = findMusterRollNumber(
    musterRolls,
    measurement?.measurementNumber,
    measurement?.additionalDetails?.startDate,
    measurement?.additionalDetails?.endDate
  );

  return {
    cards: [
      // {
      //   navigationKey: "card1",
      //   sections: [
      //     {
      //       type: "COMPONENT",
      //       cardHeader: { value: "MB_SORS", inlineStyles: {} },
      //       component: "EstimateMeasureTableWrapper",
      //       props: {
      //         config: {
      //           key: "SOR",
      //           mode: "VIEWES",
      //         },
      //         arrayProps: {
      //           fields: viewData?.SOR,
      //         },
      //         register: () => {},
      //         setValue: (key, value) => setViewData((old) => ({ ...old, SOR: value })),
      //       },
      //     }
      //   ],
      // },

      {
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "Machinery Wise Consolidation", inlineStyles: {} },
            component: "ViewUtilTable",
            props: {
              config: {
                key: "SOR",
                mode: "VIEW",
              },
              arrayProps: {
                fields: viewData?.SOR,
              },
              register: () => {},
              setValue: (key, value) => setViewData((old) => ({ ...old, SOR: value })),
            },
          },
        ],
      },
    ],
    apiResponse: {},
    additionalDetails: {},
    horizontalNav: {
      showNav: false,
      configNavItems: [],
      activeByDefault: "",
    },
  };
};

// header

export const viewUtilHeaderData = (
  contract,
  estimateDetails,
  measurement,
  allMeasurements,
  thumbnails,
  projectLocation,
  period,
  musterRollNumber,
  musterRolls
) => {
  const [viewData, setViewData] = useState({ SOR: [], NONSOR: [] });

  useEffect(() => {
    const processArrays = () => {
      if (estimateDetails) {
        setViewData({
          SOR: transformEstimateData(estimateDetails?.estimateDetails, contract, "SOR", measurement, allMeasurements),
          NONSOR: transformEstimateData(estimateDetails?.estimateDetails, contract, "NON-SOR", measurement, allMeasurements),
        });
      }
    };
    processArrays();
  }, [estimateDetails]);

  let musterrollNumber = findMusterRollNumber(
    musterRolls,
    measurement?.measurementNumber,
    measurement?.additionalDetails?.startDate,
    measurement?.additionalDetails?.endDate
  );

  return {
    cards: [
      {
        sections: [
          {
            type: "DATA",
            values: [
              {
                key: "EXP_MATERIALCOST_RS",
                value: measurement?.measurementNumber,
              },

              {
                key: "ESTIMATE_LABOUR_COST",
                value: contract?.issueDate
                  ? Digit.DateUtils.ConvertEpochToDate(contract?.issueDate)
                  : Digit.DateUtils.ConvertEpochToDate(estimateDetails?.proposalDate),
              },
              {
                key: "ESTIMATE_MACHINERY_COST",
                value: contract?.additionalDetails?.projectName,
              },
            ],
          },
        ],
      },
    ],
    apiResponse: {},
    additionalDetails: {},
    horizontalNav: {
      showNav: false,
      configNavItems: [],
      activeByDefault: "",
    },
  };
};
