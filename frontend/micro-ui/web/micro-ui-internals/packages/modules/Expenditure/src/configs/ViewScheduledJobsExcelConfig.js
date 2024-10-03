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
              SearchCriteria: {},
          },
          minParametersForSearchForm: 1,
          masterName: "commonUiConfig",
          moduleName: "ViewScheduledJobsConfig",
          tableFormJsonPath: "requestBody.Pagination",
          filterFormJsonPath: "requestBody.SearchCriteria",
          searchFormJsonPath: "requestBody.SearchCriteria",
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
                      {code:"SCHEDULED",name:"Scheduled"},
                      {code:"IN_PROGRESS",name:"In progress"},
                      {code:"COMPLETED",name:"Completed"}
                    ]
                  },
                },
                {
                  label: "EXP_SCHEDULED_FROM",
                  type: "date",
                  isMandatory: false,
                  disable: false,
                  key: "schedulefFrom",
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
                  jsonPath: "jobId",
                  additionalCustomization: true,
                },
                {
                  label: "EXP_SCHEDULED_ON",
                  jsonPath: "auditDetails.createdTime",
                  additionalCustomization: true,
                },
                {
                  label: "EXP_NO_OF_PROJECTS_SCHEDULED",
                  jsonPath: "noOfSorScheduled",
                  additionalCustomization: false,
                },
                {
                  label: "RA_SUCCESSFUL",
                  jsonPath: "",
                  additionalCustomization: true,
                },
                {
                  label: "RA_STATUS",
                  jsonPath: "status",
                  additionalCustomization: true,
                },
              ],
              enableGlobalSearch: false,
              enableColumnSort: true,
              resultsJsonPath: "ScheduledJobs",
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
  