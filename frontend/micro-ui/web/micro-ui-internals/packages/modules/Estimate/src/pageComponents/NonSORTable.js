import React, { Fragment, useState, useEffect, useMemo } from "react";
import { 
  AddIcon, 
  DeleteIcon, 
  RemoveIcon, 
  TextInput, 
  CardLabelError, 
  Dropdown, 
  Loader, 
  TextArea,
  InputTextAmount,
  CrossIcon,
  PlusIcon
 } from "@egovernments/digit-ui-react-components";
import { Controller } from "react-hook-form";
import MeasurementSheetTable from "./MeasurementSheetTable";
import cloneDeep from "lodash/cloneDeep";

const NonSORTable = ({ control, watch,config, ...props }) => {
  const populators = config?.populators
  
  const [totalAmount, setTotalAmount] = useState(0);

  const formFieldName = "nonSORTablev1"; // this will be the key under which the data for this table will be present on onFormSubmit
  const formFieldNames = "nonSORDetailsData";
  
  const initialState = [
    {
      key: 0,
      isShow: true,
    },
  ];

  const { t, register, errors, setValue, getValues, formData, unregister } = props;

  // const [rows, setRows] = useState(initialState);
  const [rows, setRows] = useState(
    formData?.[formFieldNames]?.length > 0
      ? formData?.[formFieldNames]
          ?.map((row, index) => {
            return row
              ? {
                  key: index,
                  isShow:row?.isActive ? row?.isActive : !(row?.estimatedAmount==="0"),
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

  useEffect(() => {
    setValue(formFieldNames, [{
      isMeasurementSheet: false
    }])
  }, [])

  const getStyles = (index) => {
    let obj = {};
    switch (index) {
      case 1:
        obj = { width: "1rem" };
        break;
      case 2:
        obj = { width: "30rem" };
        break;
      case 3:
        obj = { width: "12rem" };
        break;
      case 4:
        obj = { width: "10rem" };
        break;
      case 5:
        obj = { width: "15rem" };
        break;
      case 6:
        obj = { width: "18rem" };
        break;
      case 7:
        obj = { width: "10rem" };
        break;
      case 8:
        obj = { width: "3%" };
        break;
      default:
        obj = { width: "1rem" };
        break;
    }
    return obj;
  };
  const columns = [
    t("WORKS_SNO"),
    t("PROJECT_DESC"),
    t("PROJECT_UOM"),
    t("CS_COMMON_RATE"),
    t("WORKS_ESTIMATED_QUANTITY"),
    t("WORKS_ESTIMATED_AMOUNT"),
    t("CS_COMMON_ACTION"),
  ];
  const renderHeader = () => {
    return columns?.map((key, index) => {
      return (
        <th key={index} style={getStyles(index + 1)}>
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

  const addRow = () => {
    const obj = {
      key: null,
      isShow: true,
    };
    obj.key = rows[rows.length - 1].key + 1;
    setRows((prev) => [...prev, obj]);
  };

  const showHideMeasurementSheet = (row, index) => {
    if (!formData?.[formFieldNames]) setValue(formFieldNames, []);
    let noOfRows = cloneDeep(formData?.[formFieldNames] || []);
    noOfRows[index] = {
      ...noOfRows?.[index],
      isMeasurementSheet: !(noOfRows?.[index]?.isMeasurementSheet)
    }
    setValue(formFieldNames, noOfRows);
  };

  const getDropDownDataFromMDMS = (t, row, inputName, props, register, optionKey = "name", options = []) => {
    const { isLoading, data } = Digit.Hooks.useCustomMDMS(
      Digit.ULBService.getStateId(),
      options?.mdmsConfig?.moduleName,
      [{ name: options?.mdmsConfig?.masterName }],
      {
        select: (data) => {
          const optionsData = _.get(data, `${options?.mdmsConfig?.moduleName}.${options?.mdmsConfig?.masterName}`, []);
          return optionsData.filter((opt) => opt?.active).map((opt) => ({ ...opt, name: `${options?.mdmsConfig?.localePrefix}_${opt.code}` }));
        },
        enabled: options?.mdmsConfig ? true : false,
      }
    );

    if (isLoading) {
      return <Loader />;
      //show MDMS data if options are not provided. Options are in use here for pre defined options from config.
      //Usage example : dependent dropdown
    } else
      return (
        <Dropdown
          inputRef={register()}
          option={options?.mdmsConfig ? data : options}
          selected={props?.value}
          optionKey={optionKey}
          t={t}
          select={(e) => {
            props.onChange(e);
          }}
          onBlur={props?.onBlur}
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

  const cellContainerStyle = { display: "flex", flexDirection: "column" };
  const errorCardStyle = { width: "100%", fontSize: "12px", whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" };
  const errorContainerStyles = { display: "block", height: "1rem", overflow: "hidden" };
  const renderBody = useMemo(() => {
    let i = 0;
    return rows.map((row, index) => {
      // if (row.isShow) i++;
      return row.isShow && (
        <>
          <tr key={index} style={!row?.isShow ? {display:'none'}: {}}>
            <td style={getStyles(1)}>{index}</td>

            <td style={getStyles(2)}>
              <div style={cellContainerStyle}>
                <div>
                  <TextInput
                    style={{ marginBottom: "0px", wordWrap: "break-word" }}
                    name={`${formFieldName}.${row.key}.description`}
                    inputRef={register({
                        maxLength:{
                          value:512,
                          message:t(`WORKS_PATTERN_ERR`)
                        },
                        required:true
                    })}
                  />
                </div>
                <div style={errorContainerStyles}>
                  {errors && errors?.[formFieldName]?.[row.key]?.description?.type === "pattern" && (
                    <CardLabelError style={errorCardStyle}>{t(`WORKS_PATTERN_ERR`)}</CardLabelError>
                  )}
                  {errors && errors?.[formFieldName]?.[row.key]?.description?.type === "maxLength" && (
                    <CardLabelError style={errorCardStyle}>{t(`WORKS_DESC_LENGTH_EXCEEDED_512`)}</CardLabelError>
                  )}
                  {errors && errors?.[formFieldName]?.[row.key]?.description?.type === "required" && (
                    <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                  )}
                </div>
              </div>
            </td>

            <td style={getStyles(3)}>
              <div style={cellContainerStyle}>
                <div>
                  <Controller
                    control={control}
                    name={`${formFieldName}.${row.key}.uom`}
                    rules={{
                      required: true,
                      pattern: /^[a-zA-Z0-9_ .$@#\/ ]*$/,
                    }}
                    render={(props) =>
                      getDropDownDataFromMDMS(t, row, "uom", props, register, "name", {
                        mdmsConfig: {
                          masterName: "uom",
                          moduleName: "common-masters",
                          localePrefix: "ES_COMMON_UOM",
                        },
                      })
                    }
                  />
                </div>
                <div style={errorContainerStyles}>
                  {errors && errors?.[formFieldName]?.[row.key]?.uom?.type === "pattern" && (
                    <CardLabelError style={errorCardStyle}>{t(`WORKS_PATTERN_ERR`)}</CardLabelError>
                  )}
                  {errors && errors?.[formFieldName]?.[row.key]?.uom?.type === "required" && (
                    <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                  )}
                </div>
              </div>
            </td>

            <td style={getStyles(4)}>
              <div style={cellContainerStyle}>
                <div>
                  <Controller
                    defaultValue={formData?.[formFieldName]?.[row?.key]?.rate}
                    render={({ onChange, ref, value }) => (
                      <InputTextAmount
                        style={{ marginBottom: "0px", textAlign: "right", paddingRight: "1rem" }}
                        type={"text"}
                        value={formData?.[formFieldName]?.[row?.key]?.rate}
                        name={`${formFieldName}.${row.key}.rate`}
                        onChange={(e) => {
                          onChange(e)
                          setAmountField(e, row)
                        }}
                        inputRef={ref}
                        errorStyle={errors?.[populators.name]}
                        max={populators?.rate?.max}
                        min={0}
                        disable={false}
                        customIcon={populators?.customIcon}
                        customClass={populators?.customClass}
                      />
                    )}
                    name={`${formFieldName}.${row.key}.rate`}
                    rules={{
                      required: true,
                      max:populators?.rate?.max,
                      pattern: /^\s*(?=.*[1-9])\d*(?:\.\d{1,2})?\s*$/,
                    }}
                    control={control}
                   />
                </div>
                <div style={errorContainerStyles}>
                  {errors && errors?.[formFieldName]?.[row.key]?.rate?.type === "pattern" && (
                    <CardLabelError style={errorCardStyle}>{t(`WORKS_AMOUNT_ERR`)}</CardLabelError>
                  )}
                  {errors && errors?.[formFieldName]?.[row.key]?.rate?.type === "max" && (
                    <CardLabelError style={errorCardStyle}>{t(`${populators?.rate?.error}`)}</CardLabelError>
                  )}
                  {errors && errors?.[formFieldName]?.[row.key]?.rate?.type === "required" && (
                    <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                  )}
                </div>
              </div>
            </td>

            <td style={getStyles(5)}>
              <div style={cellContainerStyle}>
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                <div >
                <TextInput
                    style={{ marginBottom: "0px", textAlign: "left", paddingRight: "1rem" }}
                    name={`${formFieldName}.${row.key}.estimatedQuantity`}
                    inputRef={register({
                      required: true,
                      max:populators?.quantity?.max,
                      pattern: /^\s*(?=.*[1-9])\d*(?:\.\d{1,2})?\s*$/,
                    })}
                    onChange={(e) => setAmountField(e, row)}
                  />
                </div>
                <div onClick={() => showHideMeasurementSheet(row, index)}>
                  <PlusIcon />
                </div>
              </div>
                <div style={errorContainerStyles}>
                  {errors && errors?.[formFieldName]?.[row.key]?.estimatedQuantity?.type === "pattern" && (
                    <CardLabelError style={errorCardStyle}>{t(`WORKS_QT_ERR`)}</CardLabelError>
                  )}
                  {errors && errors?.[formFieldName]?.[row.key]?.estimatedQuantity?.type === "max" && (
                    <CardLabelError style={errorCardStyle}>{t(`${populators?.quantity?.error}`)}</CardLabelError>
                  )}
                  {errors && errors?.[formFieldName]?.[row.key]?.estimatedQuantity?.type === "required" && (
                    <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                  )}
                </div>
              </div>
            </td>

            <td style={getStyles(6)}>
              <div>
                <div>
                  <Controller
                    defaultValue={formData?.[formFieldName]?.[row?.key]?.estimatedAmount}
                    render={({ onChange, ref, value }) => (
                      <InputTextAmount
                        value={formData?.[formFieldName]?.[row?.key]?.estimatedAmount}
                        style={{ marginBottom: "0px", textAlign: "right", paddingRight: "1rem" }}
                        type={"text"}
                        name={`${formFieldName}.${row.key}.estimatedAmount`}
                        onChange= {()=>{}}
                        inputRef={ref}
                        disable={true}
                      />
                    )}
                    name={`${formFieldName}.${row.key}.estimatedAmount`}
                    rules={{
                      required: true,
                      pattern: /^\d*\.?\d*$/,
                    }}
                    control={control}
                   />
                </div>
                <div style={errorContainerStyles}>
                </div>
              </div>
            </td>
            <td style={getStyles(8)}>
              <div style={cellContainerStyle}>
                { (
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
              <div>
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
                    formFieldName={`nonSORMeasurementSheetTableData.${index}`}
                  />
                </div>
              </div>
            </td>
            <td colSpan={1} style={getStyles(3)}></td>
          </tr> : null}
          </>
        
      );
    });
  }, [rows,formData])

  
  return (
    <table className="table reports-table sub-work-table" style={{ marginTop: "-2rem" }}>
      <thead>
        <tr>{renderHeader()}</tr>
      </thead>
      <tbody>
        {renderBody}
        <tr>
          <td colSpan={1}></td>
          <td colSpan={4} style={{ textAlign: "right", fontWeight: "600" }}>
            {t("RT_TOTAL")}
          </td>
          <td colSpan={1} style={{ textAlign: "right" }}>
            {Digit.Utils.dss.formatterWithoutRound(totalAmount, "number")}
          </td>
          <td colSpan={1}></td>
        </tr>

        <tr>
          <td colSpan={7} style={{ textAlign: "center" }} onClick={addRow}>
            <span>
              <AddIcon fill={"#F47738"} styles={{ margin: "auto", display: "inline", marginTop: "-2px" }} />
              <label style={{ marginLeft: "10px", fontWeight: "600", color: "#F47738" }}>{t("WORKS_ADD_ITEM")}</label>
            </span>
          </td>
        </tr>
      </tbody>
    </table>
  );
};

export default NonSORTable;
