import React, { useEffect, useMemo } from "react";
import { useTranslation } from "react-i18next";
import { Header, InboxSearchComposer, Loader, Button, AddFilled } from "@egovernments/digit-ui-react-components";
import { useHistory, useLocation } from "react-router-dom";

const FundAllocationRegister = () => {
  const { t } = useTranslation();
  const history = useHistory()
  const location = useLocation()

  const fundAllocationRegistrySession = Digit.Hooks.useSessionStorage("FUND_ALLOCATION_REGISTRY_SEARCH", {});
  const [sessionFormData, clearSessionFormData] = fundAllocationRegistrySession;

  //const orgConfigs = searchOrganisationConfig();
  const configModuleName = Digit.Utils.getConfigModuleName()
  const tenant = Digit.ULBService.getStateId();
  const { isLoading, data } = Digit.Hooks.useCustomMDMS(
      tenant,
      configModuleName,
   [
    {
      name: "SearchFundAllocationRegistryConfig",
    },
  ]);


//   const orgConfigs = data?.[configModuleName]?.SearchOrganisationConfig?.[0];

  const orgConfigs = {
    "label": "MUTKA_FUND_ALLOCATION_REGISTER",
    "type": "search",
    "actionLabel": "",
    "actionRole": "",
    "actionLink": "",
    "apiDetails": {
      "serviceName": "/ifms/funds/v1/_search",
      "requestParam": {},
      "requestBody": {
        "apiOperation": "SEARCH",
        "searchCriteria": {}
      },
      "minParametersForSearchForm": 1,
      "masterName": "commonUiConfig",
      "moduleName": "SearchFundAllocationRegistryConfig",
      "tableFormJsonPath": "requestBody.Pagination",
      "filterFormJsonPath": "requestBody.searchCriteria",
      "searchFormJsonPath": "requestBody.searchCriteria"
    },
    "sections": {
      "search": {
        "uiConfig": {
          "headerStyle": null,
          "primaryLabel": "ES_COMMON_SEARCH",
          "secondaryLabel": "ES_COMMON_CLEAR_SEARCH",
          "type": "fundallocationregistrysearchclearbutton",
          "minReqFields": 0,
          "defaultValues": {
            "boundaryCode": "",
            "orgNumber": "",
            "name": "",
            "type": "",
            "applicationStatus": "",
            "createdFrom": "",
            "createdTo": ""
          },
          "fields": [
            {
                "label": "Financial Year",
                "type": "dropdown",
                "isMandatory": false,
                "disable": false,
                "populators": {
                  "name": "financialyear",
                  "optionsKey": "name",
                  "optionsCustomStyle": {
                    "top": "2rem"
                  },
                  "mdmsConfig": {
                    "masterName": "ProjectType",
                    "moduleName": "works",
                    "localePrefix": "COMMON_MASTERS"
                  }
                }
              },
              {
                "label": "Head of account",
                "type": "dropdown",
                "isMandatory": false,
                "disable": false,
                "populators": {
                  "name": "hoaCode",
                  "optionsKey": "name",
                  "optionsCustomStyle": {
                    "top": "2rem"
                  },
                  "mdmsConfig": {
                    "masterName": "HeadOfAccounts",
                    "moduleName": "ifms",
                    "localePrefix": ""
                  }
                }
              },
              {
                "label": "Transaction Type",
                "type": "dropdown",
                "isMandatory": false,
                "disable": false,
                "populators": {
                  "name": "transactiontype",
                  "optionsKey": "name",
                  "optionsCustomStyle": {
                    "top": "2rem"
                  },
                  "mdmsConfig": {
                    "masterName": "ProjectType",
                    "moduleName": "works",
                    "localePrefix": "COMMON_MASTERS"
                  }
                }
              },
          ]
        },
        "label": "",
        "children": {},
        "show": true
      },
      "searchResult": {
        "label": "",
        "uiConfig": {
          "columns": [
            {
              "label": "Head of Account",
              "jsonPath": "hoaCode",
              "additionalCustomization": true
            },
            {
              "label": "Transaction Number",
              "jsonPath": "allotmentDetails[0].allotmentSerialNo",
              "additionalCustomization": true
            },
            {
              "label": "Transaction Date",
              "jsonPath": "allotmentDetails[0].allotmentDateTimeStamp",
              "additionalCustomization": true
            },
            {
              "label": "Transaction Type",
              "jsonPath": "allotmentDetails[0].allotmentTxnType",
              "additionalCustomization": true
            },
            {
              "label": "Transaction Amount",
              "jsonPath": "allotmentDetails[0].decimalAllottedAmount",
              "additionalCustomization": true
            },
            {
              "label": "Sanctioned Balance",
              "jsonPath": "allotmentDetails[0].decimalSanctionBalance",
              "additionalCustomization": true
            },
            {
              "label": "Fund Available",
              "jsonPath": "allotmentDetails[0].availableAmount",
              "additionalCustomization": true
            },
          ],
          "enableGlobalSearch": false,
          "enableColumnSort": true,
          "resultsJsonPath": "funds"
        },
        "children": {},
        "show": true
      }
    },
    "additionalSections": {}
  }



  let configs = useMemo(() => Digit.Utils.preProcessMDMSConfigInboxSearch(t, orgConfigs, "sections.search.uiConfig.fields",{}),[orgConfigs]);

  useEffect(()=>{
      if (!window.location.href.includes("create-organization") && sessionFormData && Object.keys(sessionFormData) != 0) {
        clearSessionFormData();
      }
  },[location]);

  if (isLoading) return <Loader />;
  return (
    <React.Fragment>
      <div className="jk-header-btn-wrapper">
        <Header className="works-header-search">{t(configs?.label)}</Header>
      </div>
      <div className="inbox-search-wrapper">
        <InboxSearchComposer configs={configs}></InboxSearchComposer>
      </div>
    </React.Fragment>
  );
};

export default FundAllocationRegister;
