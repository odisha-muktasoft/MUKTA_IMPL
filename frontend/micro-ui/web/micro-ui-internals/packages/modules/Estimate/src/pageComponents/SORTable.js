import React, { Fragment, useState, useEffect, useMemo } from "react";
import {
  AddIcon,
  DeleteIcon,
  RemoveIcon,
  TextInput,
  CardLabelError,
  Dropdown, Loader,
  TextArea,
  InputTextAmount,
  LabelFieldPair,
  CardLabel,
  SubmitBar,
  PlusIcon,
  CrossIcon 
} from "@egovernments/digit-ui-react-components";
import { Controller } from "react-hook-form";
import cloneDeep from "lodash/cloneDeep";
import MeasurementSheetTable from "./MeasurementSheetTable";


const SORTable = ({ control, watch, config, ...props }) => {
  const sorMDMSDATA = {
    mdms: [
      {
        "id": "af0d7096-86d6-4730-8d10-648d008e9d95",
        "tenantId": "pg.citya",
        "schemaCode": "SOR.SOR",
        "uniqueIdentifier": "SOR001C",
        "data": {
          "Id": "SOR001C",
          "UOM": "KG",
          "Rate": 35000,
          "active": true,
          "SORType": "Works",
          "enabled": true,
          "SORSubtype": "Labour",
          "SORVariant": "Third floor",
          "effectiveTo": "2023-09-01T16:24:00.000Z",
          "effectiveFrom": "2023-10-07T16:24:00.000Z",
          "SORdescription": "\"K.B. bricks (25 Cm x 12Cm x 8Cm) having crushing strength not less than 75 Kg./Cm2 with dimensional tolerance ± 8 percent."
        },
        "isActive": true,
        "auditDetails": {
          "createdBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "lastModifiedBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "createdTime": 1694622368724,
          "lastModifiedTime": 1694622368724
        }
      },
      {
        "id": "ba676f9f-9710-4607-b589-5b14b8afdcd1",
        "tenantId": "pg.citya",
        "schemaCode": "SOR.SOR",
        "uniqueIdentifier": "SOR001B",
        "data": {
          "Id": "SOR001B",
          "UOM": "KG",
          "Rate": 30000,
          "active": true,
          "SORType": "Works",
          "enabled": true,
          "SORSubtype": "Labour",
          "SORVariant": "Second floor",
          "effectiveTo": "2023-09-01T16:24:00.000Z",
          "effectiveFrom": "2023-10-07T16:24:00.000Z",
          "SORdescription": "\"K.B. bricks (25 Cm x 12Cm x 8Cm) having crushing strength not less than 75 Kg./Cm2 with dimensional tolerance ± 8 percent."
        },
        "isActive": true,
        "auditDetails": {
          "createdBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "lastModifiedBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "createdTime": 1694622358679,
          "lastModifiedTime": 1694622358679
        }
      },
      {
        "id": "76eb1039-e123-43e0-bf66-166efe5def7c",
        "tenantId": "pg.citya",
        "schemaCode": "SOR.SOR",
        "uniqueIdentifier": "SOR001A",
        "data": {
          "Id": "SOR001A",
          "UOM": "KG",
          "Rate": 30000,
          "active": true,
          "SORType": "Works",
          "enabled": true,
          "SORSubtype": "Labour",
          "SORVariant": "First floor",
          "effectiveTo": "2023-09-01T16:24:00.000Z",
          "effectiveFrom": "2023-10-07T16:24:00.000Z",
          "SORdescription": "\"K.B. bricks (25 Cm x 12Cm x 8Cm) having crushing strength not less than 75 Kg./Cm2 with dimensional tolerance ± 8 percent."
        },
        "isActive": true,
        "auditDetails": {
          "createdBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "lastModifiedBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "createdTime": 1694622350709,
          "lastModifiedTime": 1694622350709
        }
      },
      {
        "id": "a5164677-611d-4859-9164-c8aa6a583ec5",
        "tenantId": "pg.citya",
        "schemaCode": "SOR.SOR",
        "uniqueIdentifier": "SOR001",
        "data": {
          "Id": "SOR001",
          "UOM": "KG",
          "Rate": 20000,
          "active": true,
          "SORType": "Works",
          "enabled": true,
          "SORSubtype": "Labour",
          "SORVariant": "Ground floor",
          "effectiveTo": "2023-09-01T16:24:00.000Z",
          "effectiveFrom": "2023-10-07T16:24:00.000Z",
          "SORdescription": "\"K.B. bricks (25 Cm x 12Cm x 8Cm) having crushing strength not less than 75 Kg./Cm2 with dimensional tolerance ± 8 percent."
        },
        "isActive": true,
        "auditDetails": {
          "createdBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "lastModifiedBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "createdTime": 1694622305755,
          "lastModifiedTime": 1694622305755
        }
      },
      {
        "id": "da506755-2ca4-4115-88fe-ee5ee8191e1f",
        "tenantId": "pg.citya",
        "schemaCode": "SOR.SOR1",
        "uniqueIdentifier": "Works",
        "data": {
          "UOM": "1",
          "Rate": 200,
          "active": true,
          "SORType": "Works",
          "enabled": true,
          "SORSubtype": "Labour",
          "SORVariant": "Ground floor",
          "effectiveTo": "2023-08-29T09:27:00.000Z",
          "effectiveFrom": "2023-09-21T09:27:00.000Z",
          "SORdescription": "Test"
        },
        "isActive": true,
        "auditDetails": {
          "createdBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "lastModifiedBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "createdTime": 1694597309652,
          "lastModifiedTime": 1694597309652
        }
      },
      {
        "id": "5caa710d-25f4-4d47-b625-b1e2b23cfcd4",
        "tenantId": "pg.citya",
        "schemaCode": "SOR.Variant",
        "uniqueIdentifier": "Fourth floor",
        "data": {
          "code": "Fourth floor",
          "active": true,
          "SORType": "Works"
        },
        "isActive": true,
        "auditDetails": {
          "createdBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "lastModifiedBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "createdTime": 1694596681835,
          "lastModifiedTime": 1694596681835
        }
      },
      {
        "id": "f3c6534e-e0b5-4f2d-9488-d0915db5d320",
        "tenantId": "pg.citya",
        "schemaCode": "SOR.Variant",
        "uniqueIdentifier": "Third floor",
        "data": {
          "code": "Third floor",
          "active": true,
          "SORType": "Works"
        },
        "isActive": true,
        "auditDetails": {
          "createdBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "lastModifiedBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "createdTime": 1694596668890,
          "lastModifiedTime": 1694596668890
        }
      },
      {
        "id": "1364d591-3b3c-449a-9c5b-417e268ee8c5",
        "tenantId": "pg.citya",
        "schemaCode": "SOR.Variant",
        "uniqueIdentifier": "Second floor",
        "data": {
          "code": "Second floor",
          "active": true,
          "SORType": "Works"
        },
        "isActive": true,
        "auditDetails": {
          "createdBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "lastModifiedBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "createdTime": 1694596660968,
          "lastModifiedTime": 1694596660968
        }
      },
      {
        "id": "32315258-1e48-4ab1-9d34-2b6f6ea46316",
        "tenantId": "pg.citya",
        "schemaCode": "SOR.Variant",
        "uniqueIdentifier": "First floor",
        "data": {
          "code": "First floor",
          "active": true,
          "SORType": "Works"
        },
        "isActive": true,
        "auditDetails": {
          "createdBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "lastModifiedBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "createdTime": 1694596657246,
          "lastModifiedTime": 1694596657246
        }
      },
      {
        "id": "2b7095d5-b424-438c-a3fe-6da9f6f2cc02",
        "tenantId": "pg.citya",
        "schemaCode": "SOR.Variant",
        "uniqueIdentifier": "Ground floor",
        "data": {
          "code": "Ground floor",
          "active": true,
          "SORType": "Works"
        },
        "isActive": true,
        "auditDetails": {
          "createdBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "lastModifiedBy": "9dab4705-22fe-456c-a9db-9340a445de17",
          "createdTime": 1694596649106,
          "lastModifiedTime": 1694596649106
        }
      }
    ]
  };

  const populators = config?.populators

  const [totalAmount, setTotalAmount] = useState(0);

  const formFieldName = "nonSORTablev1";
  const formFieldNames = "SORDetailsData";
  const measurementFormData = "measurementFormData";
  const initialState = [];

  const { t, register, errors, setValue, getValues, formData, unregister } = props;

  const [rows, setRows] = useState(
    formData?.[formFieldNames]?.length > 0
      ? formData?.[formFieldNames]
        ?.map((row, index) => {
          return row
            ? {
              key: index,
              isShow: row?.isActive ? row?.isActive : !(row?.estimatedAmount === "0"),
            }
            : {
              key: index + 1000,
              isShow: false,
            };
        })
        ?.filter((row) => row)
      : initialState
  );


  const setTotal = (formData) => {
    const tableData = formData?.[formFieldName];

    const result = tableData
      ?.filter((tableRow, idx) => {
        let include = false;
        rows?.map((row) => {
          if (row.isShow && row.key === idx) include = true;
        });
        return include;
      })
      ?.reduce((acc, curr) => acc + parseFloat(curr?.estimatedAmount || 0), 0);

    setTotalAmount((prevState) => {
      return (Math.round(result * 100) / 100).toFixed(2);
    });
  };

  useEffect(() => {
    setTotal(formData);
  }, [formData, rows]);

  const getStyles = (index) => {
    let obj = {};
    switch (index) {
      case 1:
        obj = { width: "1rem", minWidth: "50px" };
        break;
      case 2:
        obj = { width: "10rem", minWidth: "50px" };
        break;
      case 3:
        obj = { width: "10rem", minWidth: "50px" };
        break;
      case 4:
        obj = { width: "30rem", minWidth: "50px" };
        break;
      case 5:
        obj = { width: "10rem", minWidth: "50px" };
        break;
      case 6:
        obj = { width: "10rem", minWidth: "50px" };
        break;
      case 7:
        obj = { width: "10rem", minWidth: "50px" };
        break;
      case 8:
        obj = { width: "3%", minWidth: "50px" };
        break;
      default:
        obj = { width: "1rem", minWidth: "50px" };
        break;
    }
    return obj;
  };
  const columns = [
    t("WORKS_SNO"),
    t("SOR Type / Sub Type"),
    t("Code"),
    t("Description"),
    t("UOM"),
    t("Rate (₹)"),
    t("Estimated Quantity"),
    t("Estimated Amount"),
    t("CS_COMMON_ACTION"),
  ];
  const renderHeader = () => {
    return columns?.map((key, index) => {
      return (
        <th key={index} style={{ ...getStyles(index + 1), minWidth: "50px", padding: "10px", margin: "0px" }}>
          {" "}
          {key}{" "}
        </th>
      );
    });
  };

  const showDelete = () => {
    let countIsShow = 0;
    rows.map((row) => row.isShow && countIsShow++);
    if (countIsShow === 1) {
      return false;
    }
    return true;
  };

  const removeRow = (row) => {
    const noOfRows = cloneDeep(rows);
    const noOfRowsData = cloneDeep(formData?.[formFieldNames]);
    noOfRows.splice(row?.key, 1);
    noOfRowsData?.splice(row?.key, 1);

    const reIndexData = noOfRows?.map((data, index) => {
      return {
        ...data,
        key: index
      }
    });

    setValue(formFieldNames, noOfRowsData);
    setRows((prev) => reIndexData);
  };

  const getDropDownDataFromMDMSOfSOR = (t, props, register, optionKey = "name") => {
    const mdmsData = cloneDeep(sorMDMSDATA?.mdms || []);
    let data = mdmsData?.map((value) => {
      return {
        "i18nKey": value?.data?.SORdescription,
        "code": value?.data?.SORdescription,
        "name": value?.data?.SORdescription,
      }
    })

    // if (isSORMDMSLoading) {
    //   return <Loader />;
    // } else
    return (
      <Dropdown
        inputRef={register()}
        option={data ? data : options}
        selected={props?.value}
        optionKey={optionKey}
        t={t}
        select={(e) => {
          props.onChange(e);
        }}
        // onBlur={props?.onBlur}
        optionCardStyles={{ maxHeight: "15rem" }}
        style={{ marginBottom: "0px" }}
      />
    );
  };

  const setAmountField = (e, row) => {
    const quantity = parseFloat(watch(`${formFieldName}.${row.key}.estimatedQuantity`));
    const ratePerUnit = parseFloat(watch(`${formFieldName}.${row.key}.rate`));
    if (!ratePerUnit || !quantity) {
      setValue(`${formFieldName}.${row.key}.estimatedAmount`, 0);
      return;
    }
    const amountToSet = parseFloat(quantity * ratePerUnit).toFixed(2);
    setValue(`${formFieldName}.${row.key}.estimatedAmount`, amountToSet);
  };

  const showHideMeasurementSheet = (row, index) => {
    let noOfRows = cloneDeep(formData?.[formFieldNames]);
    noOfRows[index] = {
      ...noOfRows?.[index],
      isMeasurementSheet: !(noOfRows?.[index]?.isMeasurementSheet)
    }
    setValue(formFieldNames, noOfRows);
  };

  const onSORSearchADDClick = (e) => {

    let data = cloneDeep(formData?.[formFieldNames] || []);

    data.push({
      sorType: `${sorMDMSDATA?.mdms?.[0]?.data?.SORType || ""} ${sorMDMSDATA?.mdms?.[0]?.data?.SORSubType || ""}`,
      sordescription: sorMDMSDATA?.mdms?.[0]?.data?.SORdescription,
      uom: sorMDMSDATA?.mdms?.[0]?.data?.UOM,
      rate: sorMDMSDATA?.mdms?.[0]?.data?.Rate,
      schemaCode: sorMDMSDATA?.mdms?.[0]?.schemaCode,
      estimatedQuantity: 0,
      estimatedAmount: 0,
      dataLength: data?.length + 1,
      measurementSheetData: [],
      isMeasurementSheet: false
    });

    const obj = {
      key: null,
      isShow: true,
    };

    setValue(formFieldNames, data);

    if (rows?.[rows?.length - 1]?.key == 0 || rows?.[rows?.length - 1]?.key) {
      obj.key = rows?.[rows?.length - 1]?.key + 1;
    } else {
      obj.key = rows?.[rows?.length - 1]?.key ? rows?.[rows?.length - 1]?.key : 0;
    }

    setRows((prev) => [...prev, obj]);
  }
  const cellContainerStyle = { display: "flex", flexDirection: "column" };
  const errorCardStyle = { width: "100%", fontSize: "12px", whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" };
  const errorContainerStyles = { display: "block", height: "1rem", overflow: "hidden" };
  const renderBody = useMemo(() => {
    let i = 0;
    return rows.map((row, index) => {
      if (row.isShow) i++;
      return row.isShow && (
        <>
          <tr key={index} style={!row?.isShow ? { display: 'none' } : {}}>
            <td style={getStyles(1)}>{i}</td>

            <td style={getStyles(2)}>
              <div style={cellContainerStyle}>
                {formData?.[formFieldNames]?.[row?.key]?.sorType || "NA"}
              </div>
            </td>

            <td style={getStyles(3)}>
              <div style={cellContainerStyle}>
                {formData?.[formFieldNames]?.[row?.key]?.schemaCode || "NA"}
              </div>
            </td>

            <td style={getStyles(4)}>
              <div style={cellContainerStyle}>
                {formData?.[formFieldNames]?.[row?.key]?.sordescription ? <div class="tooltip">
                  <span class="textoverflow" style={{ "--max-width": `40ch`, whiteSpace: "nowrap", width: "95%", textOverflow: "ellipsis" }}>
                    {String(t(formData?.[formFieldNames]?.[row?.key]?.sordescription))}
                  </span>
                  <span class="tooltiptext" style={{ whiteSpace: "nowrap" }}>
                    {String(t(formData?.[formFieldNames]?.[row?.key]?.sordescription))}
                  </span>
                </div> : "NA"}
              </div>
            </td>

            <td style={getStyles(5)}>
              <div style={cellContainerStyle}>
                {formData?.[formFieldNames]?.[row?.key]?.uom || "NA"}
              </div>
            </td>

            <td style={getStyles(6)}>
              <div style={{ ...cellContainerStyle, textAlign: "right" }}>
                {formData?.[formFieldNames]?.[row?.key]?.rate || 0}
              </div>
            </td>

            <td style={getStyles(6)}>
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                <div style={{ ...cellContainerStyle, border: "1px solid rgba(214, 213, 212, var(--tw-border-opacity))", width: "80%", textAlign: "right", padding: "5px" }}>
                  {formData?.[formFieldNames]?.[row?.key]?.estimatedQuantity || 0}
                </div>
                <div onClick={() => showHideMeasurementSheet(row, index)}>
                  <PlusIcon />
                </div>
              </div>

            </td>
            <td style={getStyles(7)}>
              <div style={{ ...cellContainerStyle, textAlign: "right" }}>
                {formData?.[formFieldNames]?.[row?.key]?.estimatedAmount || 0}
              </div>
            </td>

            <td style={getStyles(8)}>
              <div style={cellContainerStyle}>
                {(
                  <span onClick={() => removeRow(row)} className="icon-wrapper">
                    <DeleteIcon fill={"#B1B4B6"} />
                  </span>
                )}
              </div>
              <div style={errorContainerStyles}></div>
            </td>
          </tr>
          {formData?.[formFieldNames]?.[row?.key]?.isMeasurementSheet ? <tr>
            <td colSpan={1} style={getStyles(1)}></td>
            <td colSpan={7} style={getStyles(2)}>
              <div key={`SOR${formFieldNames} + ${row?.key}`}>
                <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                  <h2 style={{ fontWeight: "700" }}>Measurement Sheet</h2>
                  <div onClick={() => showHideMeasurementSheet(row, index)}>
                    <CrossIcon />
                  </div>
                </div>
                <div style={{ padding: "0px 20px" }}>
                  <MeasurementSheetTable
                    control={control}
                    watch={watch}
                    config={config}
                    indexValue={row?.key}
                    data={formData?.[formFieldNames]?.[row?.key]?.measurementSheetData}
                    formFieldNames={formFieldNames}
                    props={props}
                    key={`${formFieldNames} + ${row?.key}`}
                    formFieldName={`sorMeasurementSheetTableData.${index}`}
                  />
                </div>
              </div>
            </td>
            <td colSpan={1} style={getStyles(3)}></td>
          </tr> : null}
        </>

      );
    });
  }, [rows, formData])


  return (
    <>
      <LabelFieldPair>
        <CardLabel style={{ fontSize: "16px", fontStyle: "bold", fontWeight: "600" }}>{`${t(`WORKS_SEARCH_SOR`)}:`}</CardLabel>
        <div className="field" style={{ width: "40%" }}>
          <div>
            <Controller
              control={control}
              name={`${"SeachSORDropDown"}`}
              rules={{
                required: true,
                pattern: /^[a-zA-Z0-9_ .$@#\/ ]*$/,
              }}
              render={(props) =>
                getDropDownDataFromMDMSOfSOR(t, props, register, "name")
              }
            />
          </div>
        </div>
        <div style={{ alignSelf: 'flex-start', marginLeft: "1rem", width: "10%" }} >
          <SubmitBar
            label={t("SOR_ADD")}
            style={{ width: "90%" }}
            onSubmit={onSORSearchADDClick}
          />
        </div>
      </LabelFieldPair>
      <table className="table reports-table sub-work-table">
        <thead>
          <tr>{renderHeader()}</tr>
        </thead>
        <tbody>
          {renderBody}
          <tr>
            <td colSpan={1}></td>
            <td colSpan={6} style={{ textAlign: "right", fontWeight: "600" }}>
              {t("Grand Total")}
            </td>
            <td colSpan={1} style={{ textAlign: "right" }}>
              {Digit.Utils.dss.formatterWithoutRound(totalAmount, "number")}
            </td>
            <td colSpan={1}></td>
          </tr>

        </tbody>
      </table>
    </>
  );
};

export default SORTable;
