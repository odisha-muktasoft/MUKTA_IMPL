export const CreateConfig = ({ defaultValue, measurement }) => {
    return {
      CreateConfig: [
        {
          defaultValues: defaultValue, // Use the default values here
  
          form: [
            {
              head: "",
              subHead: "",
              body: [
                {
                  inline: true,
                  label: "RA_SOR_CODE",
                  isMandatory: false,
                  key: "SORCode",
                  type: "paragraph",
                  disable: true,
                  appendColon: false,
                  populators: {
                    name: "SORCode",
                    customStyle :{marginBottom:"-5px", marginTop:"10px"},
                    customParaStyle : {marginBottom:"revert"}
                  },
                },
                {
                  inline: true,
                  label: "RA_SOR_TYPE",
                  isMandatory: false,
                  key: "SORType",
                  type: "paragraph",
                  disable: true,
                  appendColon: false,
                  populators: {
                    customStyle :{marginBottom:"-5px"},
                    customParaStyle : {marginBottom:"revert"},
                    name: "SORType",
                    // "customClass": "fc-header-texts"
                  },
                },
                {
                  inline: true,
                  label: "RA_SOR_SUBTYPE",
                  isMandatory: false,
                  key: "SORSubType",
                  type: "paragraph",
                  disable: true,
                  appendColon: false,
                  populators: {
                    name: "SORSubType",
                    //customClass: "",
                    customStyle :{marginBottom:"-5px"},
                    customParaStyle : {marginBottom:"revert"}
                  },
                },
                {
                  inline: true,
                  label: "RA_SOR_VARIENT",
                  isMandatory: false,
                  key: "SORVarient",
                  type: "paragraph",
                  disable: true,
                  appendColon: false,
                  populators: {
                    name: "SORVarient",
                    customStyle :{marginBottom:"-5px"},
                    customParaStyle : {marginBottom:"revert"}
                    // "customClass": "fc-header-texts"
                  },
                },
                {
                  inline: true,
                  label: "RA_UOM",
                  isMandatory: false,
                  key: "uom",
                  type: "paragraph",
                  disable: true,
                  appendColon: false,
                  populators: {
                    name: "uom",
                    customStyle :{marginBottom:"-5px"},
                    customParaStyle : {marginBottom:"revert"},
                    //customClass: "",
                  },
                },
                {
                  inline: true,
                  label: "RA_RATE_DEFINED",
                  isMandatory: false,
                  key: "rateDefinedForQty",
                  type: "paragraph",
                  disable: true,
                  appendColon: false,
                  populators: {
                    name: "rateDefinedForQty",
                    customStyle :{marginBottom:"-5px"},
                    customParaStyle : {marginBottom:"revert"},
                    //customClass: "",
                  },
                },
                {
                  inline: true,
                  label: "RA_DESCRIPTION",
                  isMandatory: false,
                  key: "description",
                  type: "paragraph",
                  disable: true,
                  appendColon: false,
                  populators: {
                    name: "description",
                    customStyle :{marginBottom:"-5px"},
                    customParaStyle : {marginBottom:"revert"},
                    // customClass: "",
                  },
                },
                {
                  inline: true,
                  label: "RA_STATUS",
                  isMandatory: false,
                  key: "status",
                  type: "paragraph",
                  disable: true,
                  appendColon: false,
                  populators: {
                    name: "status",
                    customStyle :{marginBottom:"-5px"},
                    customParaStyle : {marginBottom:"revert", color:defaultValue?.status?.includes("INACTIVE") ? "red": "green"},
                    // customClass: "",
                  },
                },
              ],
            },
            {
              head : "RA_ANALYSIS_DETAILS",
              subHead: "",
              //forOnlyUpdate : "",
              body: [
                // {
                //   type: "component",
                //   component: "MeasurementHistory",
                //   withoutLabel: true,
                //   key: "MeasurementHistory",
                //   useFieldArray: true,
                //   "customProps" : {
                //     "contractNumber" : defaultValue?.contractNumber,
                //     "measurementNumber" : measurement?.measurementNumber
                //   }
                // },
                {
                  "inline": true,
                  "label": "RA_DATE",
                  "isMandatory": true,
                  "key": "effective_form_date",
                  "type": "date",
                  "disable": false,
                  // "preProcess" : {
                  //   "updateDependent" : ["populators.validation.max"]
                  // },
                  "populators": {
                    "name": "effective_form_date",
                    "validation":{
                      "max":"currentDate"
                    }
                  }
                },
                {
                  "inline": true,
                  "label": "RA_ANALYSIS_QUANTITY_DEFINED",
                  "isMandatory": true,
                  "key": "analysis_qty_defined",
                  "type": "text",
                  "disable": false,
                  // "preProcess": {
                  //   "convertStringToRegEx": [
                  //     "populators.validation.pattern"
                  //   ]
                  // },
                  "populators": {
                    "name": "analysis_qty_defined",
                    // "error": "PROJECT_PATTERN_ERR_MSG_PROJECT_NAME",
                    // "validation": {
                    //   "pattern": "^[a-zA-Z0-9\\/{ \\/ .\\- _$@#\\' } ]*$",
                    //   "minlength": 2,
                    //   "maxlength" : 128
                    // }
                  }
                },
              ],
            },
            {
              head: "RA_LABOUR",
              subHead: "",
              body: [
                {
                  type: "component",
                  component: "SORDetailsTemplate",
                  withoutLabel: true,
                  key: "SORDetails_Labour",
                  mode: "CREATE",
                  sorType : "LABOUR",
                  useFieldArray: true,
                },
              ],
            },
            {
              head: "RA_MATERIAL",
              subHead: "",
              body: [
                {
                  type: "component",
                  component: "SORDetailsTemplate",
                  withoutLabel: true,
                  key: "SORDetails_Material",
                  mode: "CREATE",
                  sorType : "MATERIAL",
                  useFieldArray: true,
                },
              ],
            },
            {
              head: "RA_MACHINERY",
              subHead: "",
              body: [
                {
                  type: "component",
                  component: "SORDetailsTemplate",
                  withoutLabel: true,
                  key: "SORDetails_Machinery",
                  mode: "CREATE",
                  sorType : "MACHINERY",
                  useFieldArray: true,
                },
              ],
            },
            {
              head: "RA_EXTRACHARGES",
              subHead: "",
              body: [
                {
                  type: "component",
                  component: "ExtraCharges",
                  withoutLabel: true,
                  key: "extraCharges",
                  mode: "CREATE",
                  sorType : "EXTRACHARGES",
                  useFieldArray: true,
                },
              ],
            },
          ],
        },
      ],
    };
  };