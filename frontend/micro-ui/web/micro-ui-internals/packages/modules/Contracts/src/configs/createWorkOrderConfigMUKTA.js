const createWorkOrderConfigMUKTA = ({defaultValues, documents, officerInCharge, nameOfCBO}) => {

  return {
    tenantId: "od",
    moduleName: "commonMuktaUiConfig",
    CreateWorkOrderConfig: [
      {
        defaultValues: {
          basicDetails_projectID: defaultValues?.basicDetails_projectID,
          basicDetails_dateOfProposal: defaultValues?.basicDetails_dateOfProposal,
          basicDetails_projectName: defaultValues?.basicDetails_projectName,
          workOrderAmountRs : defaultValues?.workOrderAmountRs
        },
        metaData: {
          showNavs: true
        },
        form: [
          {
            head: "",
            subHead: "",
            body: [
              {
                inline: true,
                label: "WORKS_PROJECT_ID",
                isMandatory: false,
                key: "basicDetails_projectID",
                type: "text",
                disable: true,
                appendColon : true,
                populators: {
                  name: "basicDetails_projectID",
                  customClass: "fc-header-texts"
                }
              },
              {
                inline: true,
                label: "WORKS_DATE_PROPOSAL",
                isMandatory: false,
                key: "basicDetails_dateOfProposal",
                type: "text",
                disable: true,
                appendColon : true,
                populators: {
                  name: "basicDetails_dateOfProposal",
                  customClass: "fc-header-texts"
                }
              },
              {
                inline: true,
                label: "WORKS_PROJECT_NAME",
                isMandatory: false,
                key: "basicDetails_projectName",
                type: "text",
                disable: true,
                appendColon : true,
                populators: {
                  name: "basicDetails_projectName",
                  customClass: "fc-header-texts"
                }
              },
              {
                inline: true,
                label: "PROJECTS_DESCRIPTION",
                isMandatory: false,
                key: "basicDetails_projectDesc",
                type: "text",
                disable: true,
                appendColon : true,
                populators: {
                  name: "basicDetails_projectDesc",
                  customClass: "fc-header-texts"
                }
              }
            ]
          },
          {
            navLink: "WO_Details",
            head: "",
            body: [
              {
                isMandatory: true,
                key: "nameOfCBO",
                type: "radioordropdown",
                label: "COMMON_NAME_OF_CBO",
                disable: false,
                populators: {
                  name: "nameOfCBO",
                  optionsKey: "name",
                  error: "WORKS_REQUIRED_ERR",
                  required: false,
                  // optionsCustomStyle: {
                  //   top: "2.5rem"
                  // },
                  options : nameOfCBO
                }
              },
              {
                inline: true,
                label: "COMMON_CBO_ID",
                isMandatory: false,
                key: "cboID",
                type: "text",
                disable: true,
                populators: {
                  name: "cboID",
                  customClass: "disabled-text-field"
                }
              },
              {
                isMandatory: true,
                key: "roleOfCBO",
                type: "radioordropdown",
                label: "COMMON_ROLE_OF_CBO",
                disable: false,
                populators: {
                  name: "roleOfCBO",
                  optionsKey: "name",
                  error: "WORKS_REQUIRED_ERR",
                  required: false,
                  // optionsCustomStyle: {
                  //   top: "2.5rem"
                  // },
                  mdmsConfig: {
                    masterName: "CBORoles",
                    moduleName: "works",
                    localePrefix: "COMMON_MASTERS"
                  }
                }
              },
              {
                isMandatory: true,
                key: "nameOfOfficerInCharge",
                type: "radioordropdown",
                label: "COMMON_NAME_OF_OFFICER_IN_CHARGE",
                disable: false,
                populators: {
                  name: "nameOfOfficerInCharge",
                  optionsKey: "name",
                  error: "WORKS_REQUIRED_ERR",
                  required: false,
                  // optionsCustomStyle: {
                  //   top: "2.5rem"
                  // },
                  options : officerInCharge
                }
              },
              {
                inline: true,
                label: "COMMON_DESGN_OF_OFFICER_IN_CHARGE",
                isMandatory: false,
                key: "designationOfOfficerInCharge",
                type: "text",
                disable: true,
                populators: {
                  name: "designationOfOfficerInCharge",
                  customClass: "disabled-text-field"
                }
              },
              {
                inline: true,
                label: "COMMON_PROJECT_COMP_PERIOD_DAYS",
                isMandatory: true,
                key: "projectCompletionPeriodInDays",
                type: "number",
                disable: false,
                preProcess: {
                  convertStringToRegEx: [
                    "populators.validation.pattern"
                  ]
                },
                populators: {
                  name: "projectCompletionPeriodInDays",
                  error: "COMMON_PATTERN_ERR_MSG_PROJECT_COMP_PERIOD",
                  validation: {
                    pattern: /^(?:0|[1-9]\d*)(?:\.(?!.*000)\d+)?$/,
                    maxlength: 10
                  }
                }
              },
              {
                inline: true,
                label: "COMMON_WORK_ORDER_AMT_RS",
                isMandatory: true,
                key: "workOrderAmountRs",
                type: "number",
                disable: true,
                populators: {
                  name: "workOrderAmountRs",
                }
              }
            ]
          },
          {
            navLink: "WO_Details",
            head: "COMMON_LABOUR_AND_MATERIAL_ANALYSIS",
            body: [
              {
                key: "labourAndMaterialAnalysis",
                type: "component",
                component: "ViewEstimateDocs",
                withoutLabel: true,
                customProps : {
                  documents : documents
                }
              }
            ]
          },
          {
            navLink: "WO_Details",
            head: "",
            body: [
              {
                type: "documentUpload",
                withoutLabel: true,
                module: "Work Order",
                error: "WORKS_REQUIRED_ERR",
                name: "documents",
                customClass: "",
                localePrefix: "WO"
              }
            ]
          },
          {
            navLink: "Terms_And_Conditions",
            sectionFormCategory: "termsAndConditions",
            head: "COMMON_TERMS_AND_CONDITIONS",
            body: [
              {
                key: "termsAndConditions",
                type: "component",
                component: "WOTermsAndConditions",
                withoutLabel: true,
              }
            ]
          }
        ]
      }
    ]
  }
}

export default createWorkOrderConfigMUKTA;