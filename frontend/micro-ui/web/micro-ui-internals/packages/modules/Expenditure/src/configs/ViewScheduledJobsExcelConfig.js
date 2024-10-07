const ViewScheduledJobsExcelConfig = {
    tenantId: "pg",
    moduleName: "ViewScheduledJobsExcelConfig",
    ViewScheduledJobsExcelConfig: [
      {
        label: "EXP_GENERATE_EXCEL_JOBS",
        type: "search",
        actionLabel: "",
        actionRole: "",
        actionLink: "",
        apiDetails: {
          serviceName: "/wms/report/payment-tracker/_search",
          requestParam: {},
          requestBody: {
            reportSearchCriteria: {},
          },
          minParametersForSearchForm: 1,
          masterName: "commonUiConfig",
          moduleName: "ViewScheduledJobsConfig",
          tableFormJsonPath: "requestBody.pagination",
          filterFormJsonPath: "requestBody.reportSearchCriteria",
          searchFormJsonPath: "requestBody.reportSearchCriteria",
        },
        sections: {
          search: {
            uiConfig: {
              headerStyle: null,
              primaryLabel: "ES_COMMON_SEARCH",
              secondaryLabel: "ES_COMMON_CLEAR_SEARCH",
              searchWrapperClassName:"view-scheduled-jobs-serach-wrapper",
              minReqFields: 1,
              showFormInstruction: "",
              defaultValues: {
                status: "",
                scheduleFrom: "",
                scheduleTo: "",
              },
              fields: [
                {
                  label: "EXP_STATUS",
                  type: "dropdown",
                  isMandatory: false,
                  disable: false,
                  populators: {
                    name: "status",
                    optionsKey: "name",
                    optionsCustomStyle: {
                      top: "2.3rem",
                    },
                    options:[
                      {code:"INITIATED",name:"Initiated"},
                      {code:"INPROGRESS",name:"In progress"},
                      {code:"COMPLETED",name:"Completed"},
                      {code:"FAILED",name:"Failed"}
                    ]
                  },
                },
                {
                  label: "EXP_SCHEDULED_FROM",
                  type: "date",
                  isMandatory: false,
                  disable: false,
                  key: "scheduleFrom",
                  preProcess: {
                    updateDependent: ["populators.max"],
                  },
                  populators: {
                    name: "scheduleFrom",
                    max: "currentDate",
                  },
                },
                {
                  label: "EXP_SCHEDULED_TO",
                  type: "date",
                  isMandatory: false,
                  disable: false,
                  key: "scheduleTo",
                  preProcess: {
                    updateDependent: ["populators.max"],
                  },
                  populators: {
                    name: "scheduleTo",
                    error: "DATE_VALIDATION_MSG",
                    max: "currentDate",
                  },
                  additionalValidation: {
                    type: "date",
                    keys: {
                      start: "scheduleFrom",
                      end: "scheduleTo",
                    },
                  },
                },
              ],
            },
            label: "",
            children: {},
            show: true,
          },
          searchResult: {
            label: "",
            uiConfig: {
              columns: [
                {
                  label: "EXP_JOB_ID",
                  jsonPath: "reportNumber",
                  additionalCustomization: true,
                },
                {
                  label: "EXP_SCHEDULED_ON",
                  jsonPath: "auditDetails.createdTime",
                  additionalCustomization: true,
                },
                // {
                //   label: "EXP_NO_OF_PROJECTS_SCHEDULED",
                //   jsonPath: "noOfSorScheduled",
                //   // additionalCustomization: false,
                // },
                // {
                //   label: "EXP_SUCCESSFUL",
                //   jsonPath: "",
                //   // additionalCustomization: true,
                // },
                {
                  label: "EXP_STATUS_ACTION",
                  jsonPath: "status",
                  additionalCustomization: true,
                },
              ],
              enableGlobalSearch: false,
              enableColumnSort: true,
              resultsJsonPath: "reportJobs",
            },
            children: {},
            show: true,
          },
        },
        additionalSections: {},
      },
    ],
  };
  
  export default ViewScheduledJobsExcelConfig;
  