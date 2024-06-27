import React, { useState, useEffect } from "react";
import { transformEstimateObjects } from "../../../Estimate/util/estimateConversion";
import { transformStatementData, sortSorsBasedonType } from "../../../Estimate/util/EstimateData";
import { sortedFIlteredData } from "../utils/view_utilization";

export const data = (statementDetails, rawData) => {
  const [viewData, setViewData] = useState({ SOR: [], NONSOR: [], sorted: [] });

  const headerLocale = Digit.Utils.locale.getTransformedLocale(statementDetails?.tenantId);

  const processArrays = () => {
    if (statementDetails && !viewData?.nestedData) {
      setViewData({
        nestedData: transformStatementData(statementDetails),
        sorted: sortSorsBasedonType(rawData),
      });
    }
  };

  useEffect(() => {
    processArrays();
  }, [statementDetails, rawData]);

  return {
    cards: [
      {
        sections: [
          {
            type: "DATA",
            values: [
              {
                key: "STATEMENT_MATERIAL",
                value: statementDetails?.basicSorDetails.filter((ob) => ob?.type === "M")[0]?.amount,
              },
              {
                key: "STATEMENT_LABOUR",
                value: statementDetails?.basicSorDetails.filter((ob) => ob?.type === "L")[0]?.amount,
              },
              {
                key: "STATEMENT_MACHINERY",
                value: statementDetails?.basicSorDetails.filter((ob) => ob?.type === "E")[0]?.amount,
              },
            ],
          },
        ],
      },
      {
        navigationKey: "card1",
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "WORKS_SORS_WISE_MATERIAL", inlineStyles: {} },
            component: "ViewStatement",
            props: {
              config: {
                key: "SOR",
                mode: "VIEWES",
                screenType: "UTILIZATION",
              },
              arrayProps: {
                fields: viewData?.nestedData,
                type: "M",
              },
              register: () => {},
              setValue: (key, value) => setViewData((old) => ({ ...old, nestedData: value })),
            },
          },
        ],
      },
      {
        navigationKey: "card2",
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "WORKS_SORS_WISE_LABOUR", inlineStyles: {} },
            component: "ViewStatement",
            props: {
              config: {
                key: "SOR",
                mode: "VIEWES",
                screenType: "UTILIZATION",
              },
              arrayProps: {
                fields: viewData?.nestedData,
                type: "L",
              },
              register: () => {},
              setValue: (key, value) => setViewData((old) => ({ ...old, nestedData: value })),
            },
          },
        ],
      },
      {
        navigationKey: "card3",
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "WORKS_SORS_WISE_MACHINERY", inlineStyles: {} },
            component: "ViewStatement",
            props: {
              config: {
                key: "SOR",
                mode: "VIEWES",
                screenType: "UTILIZATION",
              },
              arrayProps: {
                fields: viewData?.nestedData,
                type: "MH",
              },
              register: () => {},
              setValue: (key, value) => setViewData((old) => ({ ...old, nestedData: value })),
            },
          },
        ],
      },
      {
        navigationKey: "card1",
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "WORKS_SORS_WISE_MATERIAL_CONSOLIDATION", inlineStyles: {} },
            component: "GroupedTable",
            props: {
              emptyTableMsg:"NO_MATERIAL_CONSOLIDATION",
              config: {
                key: "SOR",
                mode: "VIEWES",
              },
              arrayProps: {
                fields: sortedFIlteredData(viewData?.sorted, "M"),
                type: "M",
              },
              register: () => {},
              setValue: (key, value) => setViewData(),
            },
          },
        ],
      },
      {
        navigationKey: "card2",
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "WORKS_SORS_WISE_LABOUR_CONSOLIDATION", inlineStyles: {} },
            component: "GroupedTable",
            props: {
              emptyTableMsg:"NO_LABOUR_CONSOLIDATION",
              config: {
                key: "SOR",
                mode: "VIEWES",
              },
              arrayProps: {
                fields: sortedFIlteredData(viewData?.sorted, "L"),
                type: "L",
              },
              register: () => {},
              setValue: (key, value) => setViewData(),
            },
          },
        ],
      },
      {
        navigationKey: "card3",
        sections: [
          {
            type: "COMPONENT",
            cardHeader: { value: "WORKS_SORS_WISE_MACHINERY_CONSOLIDATION", inlineStyles: {} },
            component: "GroupedTable",
            props: {
              emptyTableMsg:"NO_MACHINERY_CONSOLIDATION",
              config: {
                key: "SOR",
                mode: "VIEWES",
              },
              arrayProps: {
                fields: sortedFIlteredData(viewData?.sorted, "MH"),
                type: "MH",
              },
              register: () => {},
              setValue: (key, value) => setViewData(),
            },
          },
        ],
      },
    ],
    apiResponse: {},
    additionalDetails: {},
    horizontalNav: {
      showNav: true,
      configNavItems: [
        {
          name: "card1",
          active: true,
          code: "Material",
        },
        {
          name: "card2",
          active: true,
          code: "Labour",
        },
        {
          name: "card3",
          active: true,
          code: "Machinery",
        },
      ],
      activeByDefault: "card1",
    },
  };
};
