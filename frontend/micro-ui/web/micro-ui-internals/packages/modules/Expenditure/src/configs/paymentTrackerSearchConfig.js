export const paymentTrackerSearchConfig = {
    "tenantId": "pg",
    "moduleName": "paymentTrackerSearchConfig",
    "paymentTrackerSearchConfig": [
        {
            "label": "EXP_SEARCH_PAYMENT_TRACKER",
            "type": "search",
            "actionLabel": "ES_COMMON_DOWNLOAD_PAYMENT_TRACKER",
            "actionRole": "BILL_ACCOUNTANT",
            "actionLink": "expenditure/download-bill",
            "customHookName" : "paymentTrackerReport",
            "apiDetails": {
              "serviceName": "/wms/report/payment_tracker",
              "requestParam": {},
              "requestBody": {
                "searchCriteria": {
                    "moduleSearchCriteria": {}
                }
            },
              "minParametersForSearchForm": 1,
              "masterName": "commonUiConfig",
              "moduleName": "paymentTrackerSearchConfig",
              "tableFormJsonPath": "requestBody.pagination",
              "filterFormJsonPath": "requestBody.searchCriteria",
              "searchFormJsonPath": "requestBody.searchCriteria.moduleSearchCriteria"
            },
            "sections": {
              "search": {
                "uiConfig": {
                  "headerStyle": null,
                  "primaryLabel": "ES_COMMON_SEARCH",
                  "secondaryLabel": "ES_COMMON_CLEAR_SEARCH",
                  "minReqFields": 1,
                  "showFormInstruction": "BILL_SELECT_ONE_PARAM_TO_SEARCH",
                  "formClassName": "",
                  "defaultValues": {
                    "ward": "",
                    "projectType": "",
                    "name": "",
                    "projectNumber": "",
                    "createdFrom": "",
                    "createdTo": ""
                  },
                  "fields": [
                    {
                      "label": "COMMON_WARD",
                      "type": "locationdropdown",
                      "isMandatory": false,
                      "disable": false,
                      "populators": {
                          "name": "ward",
                          "type": "ward",
                          "optionsKey": "name",
                          "defaultText": "COMMON_SELECT_WARD",
                          "selectedText": "COMMON_SELECTED",
                          "allowMultiSelect": false
                      }
                  },
                    {
                      "label": "WORKS_PROJECT_TYPE",
                      "type": "dropdown",
                      "isMandatory": false,
                      "disable": false,
                      "populators": { 
                        "name": "projectType", 
                        "optionsKey": "name",
                        // "optionsCustomStyle": {
                        //     "top": "2.3rem"
                        //   },
                          "mdmsConfig": {
                            "masterName": "ProjectType",
                            "moduleName": "works",
                            "localePrefix": "COMMON_MASTERS"
                          }
                      }
                    },
                    {
                        "label": "WORKS_PROJECT_NAME",
                        "type": "text",
                        "isMandatory": false,
                        "disable": false,
                        "preProcess": {
                          "convertStringToRegEx": [
                            "populators.validation.pattern"
                          ]
                        },
                        "populators": {
                          "name": "projectName",
                          "error": "PROJECT_PATTERN_ERR_MSG",
                          "validation": {
                              "pattern": "^[^\\$\"<>?\\\\~`!@$%^()+={}\\[\\]*:;“”‘’]{1,50}$",
                              "minlength": 2
                          }
                        }
                    },
                    {
                      "label": "WORKS_PROJECT_ID",
                      "type": "text",
                      "isMandatory": false,
                      "disable": false,
                      "preProcess": {
                        "convertStringToRegEx": [
                          "populators.validation.pattern"
                        ]
                      },
                      "populators": {
                        "name": "projectId",
                        "error": "PROJECT_PATTERN_ERR_MSG",
                        "validation": {
                          "pattern": "PJ\\/[0-9]+-[0-9]+\\/[0-9]+\\/[0-9]+",
                          "minlength": 2
                        }
                      }
                    },
                    {
                      "label": "ES_COMMON_CREATED_FROM",
                      "type": "date",
                      "isMandatory": false,
                      "disable": false,
                      "key": "createdFrom",
                      "preProcess": {
                        "updateDependent": [
                          "populators.max"
                        ]
                      },
                      "populators": {
                        "name": "createdFrom",
                        "max": "currentDate"
                      }
                    },
                    {
                      "label": "ES_COMMON_CREATED_TO",
                      "type": "date",
                      "isMandatory": false,
                      "disable": false,
                      "key": "createdTo",
                      "preProcess": {
                        "updateDependent": [
                          "populators.max"
                        ]
                      },
                      "populators": {
                        "name": "createdTo",
                        "error": "DATE_VALIDATION_MSG",
                        "max": "currentDate"
                      },
                      "additionalValidation": {
                        "type": "date",
                        "keys": {
                          "start": "createdFrom",
                          "end": "createdTo"
                        }
                      }
                    }
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
                      "label": "EXP_PROJECT_NUMBER",
                      "jsonPath": "projectNumber",
                      "additionalCustomization": true
                    },
                    {
                      "label": "EXP_PROJECT_NAME",
                      "jsonPath": "project.businessObject.name",
                      "additionalCustomization": true
                    },
                    {
                      "label": "EXP_ESTIMATED_AMT",
                      "jsonPath": "estimatedAmount",
                      "additionalCustomization": true
                    },
                    {
                      "label": "EXP_WAGE_PAYMENT_SUCCESS",
                      "jsonPath": "wagebillsuccess",
                      "additionalCustomization": true
                    },
                    {
                      "label": "EXP_WAGE_PAYMENT_FAILED",
                      //"jsonPath": "$.paymentDetails[?(@.billType == 'EXPENSE.WAGE')].remainingAmount",
                      "jsonPath":"wagebillFailed",
                      "additionalCustomization": true
                    },
                    {
                      "label": "EXP_PUR_PAYMENT_SUCCESS",
                      "jsonPath": "purchasebillSuccess",
                      "additionalCustomization": true
                    },
                    {
                      "label": "EXP_PUR_PAYMENT_FAILED",
                      "jsonPath": "purchasebillFailed",
                      "additionalCustomization": true
                    },
                    {
                      "label": "EXP_SUP_PAYMENT_SUCCESS",
                      "jsonPath": "supervisionbillSuccess",
                      "additionalCustomization": true
                    },
                    {
                      "label": "EXP_SUP_PAYMENT_FAILED",
                      "jsonPath": "supervisionbillFailed",
                      "additionalCustomization": true
                    }
                  ],
                  "enableGlobalSearch": false,
                  "enableColumnSort": true,
                  "resultsJsonPath": "aggsResponse.projects",
                  "showCheckBox": false,
                  "checkBoxActionLabel": "ES_COMMON_GENERATE_PAYMENT_ADVICE",
                  "showTableInstruction": "EXP_DOWNLOAD_BILL_INSTRUCTION",
                  "stickyFooter": true
                },
                "children": {},
                "show": true
              }
            },
            "additionalSections": {}
          }
    ]
  }
  