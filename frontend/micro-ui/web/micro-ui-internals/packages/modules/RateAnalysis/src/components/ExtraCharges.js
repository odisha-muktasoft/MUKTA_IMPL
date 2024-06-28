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
  InputTextAmount
} from "@egovernments/digit-ui-react-components";
import { Controller } from "react-hook-form";
import _ from "lodash";
import { has4DecimalPlaces } from "../utils/transformData";

const ExtraCharges = ({ control, watch, config, ...props }) => {
  const populators = config?.populators;

  const formFieldName = "extraCharges"; // this will be the key under which the data for this table will be present on onFormSubmit
  const initialState = [
    {
      key: 1,
      description: "",
      applicableOn: "",
      calculationType: "",
      figure: "",
      isShow: true,
    },
  ];

  const { t, register, errors, setValue, getValues, formData, unregister } = props;
  const [rows, setRows] = useState(formData?.[formFieldName]?.length > 0 ? formData?.[formFieldName] : initialState);

  useEffect(() => {
    if (!formData?.[formFieldName] || formData?.[formFieldName]?.length === 0) {
      setValue(formFieldName, initialState);
      setRows(initialState);
    }
  }, [formData, setValue]);

  const getStyles = (index) => {
    let obj = {};
    switch (index) {
      case 1:
        obj = { width: "1rem" };
        break;
      case 2:
        obj = { width: "70rem" };
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
    t("RA_SNO"),
    t("RA_DESCRIPTION"),
    t("RA_APPLICABLE_ON"),
    t("RA_CALCULATION_TYPE"),
    t("RA_FIGURE"),
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

  const removeRow = (rowIndex) => {
    const updatedRows = rows.map((row, index) =>
      index === rowIndex ? { ...row, isShow: false } : row
    );
    setRows(updatedRows);
  };

  const addRow = () => {
    const newRow = {
      key: rows.length + 1,
      description: "",
      applicableOn: "",
      calculationType: "",
      figure: "",
      isShow: true,
    };
    console.log(rows,"added rows");
    setRows([...rows, newRow]);
  };

  const getCalculationType = () => {
    return [
      { code: "PERCENTAGE", name: "percentage" },
      { code: "FIXED", name: "fixed" }
    ];
  };

  const getDropDownDataFromMDMS = (t, row, inputName, props, register, optionKey = "name", options = []) => {
    const requestCriteria = {
      url: "/mdms-v2/v2/_search",
      body: {
        MdmsCriteria: {
          tenantId: "pg",
          schemaCode: "WORKS-SOR.Overhead",
        },
      },
      changeQueryName: "sorOverhead"
    };

    let { isLoading, data } = Digit.Hooks.useCustomAPIHook(requestCriteria);

    data = data?.mdms?.map((ob) => (ob?.data));

    if (isLoading) {
      return <Loader />;
    } else {
      return (
        <Dropdown
          inputRef={register()}
          option={data}
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
    }
  };

  const setAmountField = (e, rowIndex) => {
    const updatedRows = rows.map((row, index) =>
      index === rowIndex ? { ...row, figure: e.target.value } : row
    );
    console.log(updatedRows,"set amount field rows");
    setRows(updatedRows);
    setValue(`${formFieldName}[${rowIndex}].figure`, e.target.value);
  };

  const cellContainerStyle = { display: "flex", flexDirection: "column" };
  const errorCardStyle = { width: "100%", fontSize: "12px", whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" };
  const errorContainerStyles = { display: "block", height: "1rem", overflow: "hidden" };

  console.log(formData,"fromdata")
  console.log(rows,"main rowss")
  const renderBody = useMemo(() => {
    let i = 0;
    return rows.map((row, rowIndex) => {
      if (row.isShow) i++;
      return row.isShow && (
        <tr key={rowIndex} style={!row?.isShow ? { display: 'none' } : {}}>
          <td style={getStyles(1)}>{i}</td>

          <td style={getStyles(2)}>
            <div style={cellContainerStyle}>
              <div>
                <TextInput
                  style={{ marginBottom: "0px", wordWrap: "break-word" }}
                  name={`${formFieldName}[${rowIndex}].description`}
                  //value={formData?.extraCharges?.[rowIndex]?.description || row.description}
                  defaultValue={window.location.href.includes("update") ? (formData?.extraCharges?.[rowIndex]?.description || row.description) : null}
                  inputRef={register({
                    maxLength: {
                      value: 512,
                      message: t(`WORKS_PATTERN_ERR`)
                    },
                    required: false
                  })}
                />
              </div>
              <div style={errorContainerStyles}>
                {errors && errors?.[formFieldName]?.[rowIndex]?.description?.type === "pattern" && (
                  <CardLabelError style={errorCardStyle}>{t(`WORKS_PATTERN_ERR`)}</CardLabelError>
                )}
                {errors && errors?.[formFieldName]?.[rowIndex]?.description?.type === "maxLength" && (
                  <CardLabelError style={errorCardStyle}>{t(`WORKS_DESC_LENGTH_EXCEEDED_512`)}</CardLabelError>
                )}
                {errors && errors?.[formFieldName]?.[rowIndex]?.description?.type === "required" && (
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
                  name={`${formFieldName}[${rowIndex}].applicableOn`}
                  defaultValue={row.applicableOn}
                  rules={{
                    required: false,
                    pattern: /^[a-zA-Z0-9_ .$@#\/ ]*$/,
                  }}
                  render={(props) =>
                    getDropDownDataFromMDMS(t, row, "applicableOn", props, register, "description")
                  }
                />
              </div>
              <div style={errorContainerStyles}>
                {errors && errors?.[formFieldName]?.[rowIndex]?.uom?.type === "pattern" && (
                  <CardLabelError style={errorCardStyle}>{t(`WORKS_PATTERN_ERR`)}</CardLabelError>
                )}
                {errors && errors?.[formFieldName]?.[rowIndex]?.uom?.type === "required" && (
                  <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                )}
              </div>
            </div>
          </td>

          <td style={getStyles(4)}>
            <div style={cellContainerStyle}>
              <div>
                <Controller
                  control={control}
                  name={`${formFieldName}[${rowIndex}].calculationType`}
                  rules={{
                    required: false,
                    pattern: /^[a-zA-Z0-9_ .$@#\/ ]*$/,
                  }}
                  render={(props) => (
                    <Dropdown
                      inputRef={register()}
                      option={getCalculationType()}
                      selected={props?.value || row?.calculationType}
                      optionKey={"name"}
                      t={t}
                      select={(e) => {
                        props.onChange(e);
                      }}
                      onBlur={props?.onBlur}
                      optionCardStyles={{ maxHeight: "15rem" }}
                      style={{ marginBottom: "0px" }}
                    />
                  )}
                />
              </div>
              <div style={errorContainerStyles}>
                {errors && errors?.[formFieldName]?.[rowIndex]?.uom?.type === "pattern" && (
                  <CardLabelError style={errorCardStyle}>{t(`WORKS_PATTERN_ERR`)}</CardLabelError>
                )}
                {errors && errors?.[formFieldName]?.[rowIndex]?.uom?.type === "required" && (
                  <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                )}
              </div>
            </div>
          </td>

          <td style={getStyles(5)}>
            <div style={cellContainerStyle}>
              <div>
                <TextInput
                  style={{ marginBottom: "0px", textAlign: "left", paddingRight: "1rem" }}
                  name={`${formFieldName}[${rowIndex}].figure`}
                  //value={formData?.extraCharges?.[rowIndex]?.figure || row.figure}
                  defaultValue={window.location.href.includes("update") ? (formData?.extraCharges?.[rowIndex]?.figure || row.figure) : null}
                  inputRef={register({
                    required: false,
                    max: populators?.quantity?.max,
                    pattern: /^\s*(?=.*[1-9])\d*(?:\.\d{1,2})?\s*$/,
                  })}
                  onChange={(e) => {
                    if(has4DecimalPlaces(parseFloat(e?.target.value))){
                      setAmountField(e, rowIndex)
                    }
                    else
                    {
                      e.target.value = e?.target.value.slice(0, e?.target.value.length - 1);
                    }
                  }
                }
                />
              </div>
              <div style={errorContainerStyles}>
                {errors && errors?.[formFieldName]?.[rowIndex]?.estimatedQuantity?.type === "pattern" && (
                  <CardLabelError style={errorCardStyle}>{t(`WORKS_QT_ERR`)}</CardLabelError>
                )}
                {errors && errors?.[formFieldName]?.[rowIndex]?.estimatedQuantity?.type === "max" && (
                  <CardLabelError style={errorCardStyle}>{t(`${populators?.quantity?.error}`)}</CardLabelError>
                )}
                {errors && errors?.[formFieldName]?.[rowIndex]?.estimatedQuantity?.type === "required" && (
                  <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                )}
              </div>
            </div>
          </td>

          <td style={getStyles(8)}>
            <div style={cellContainerStyle}>
              {(
                <span onClick={() => rows.length > 1 ? removeRow(rowIndex) : {}} className="icon-wrapper">
                  <DeleteIcon fill={rows.length > 1 ? "#FF9100" : "#B1B4B6"} />
                </span>
              )}
            </div>
            <div style={errorContainerStyles}></div>
          </td>
        </tr>
      );
    });
  }, [rows, formData]);

  return (
    <table className="table reports-table sub-work-table">
      <thead>
        <tr>{renderHeader()}</tr>
      </thead>
      <tbody>
        {renderBody}
        <tr>
          <td colSpan={7} style={{ textAlign: "center" }} onClick={addRow}>
            <span>
              <AddIcon fill={"#F47738"} styles={{ margin: "auto", display: "inline", marginTop: "-2px" }} />
              <label style={{ marginLeft: "10px", fontWeight: "600", color: "#F47738" }}>{t("RA_ADD_ITEM")}</label>
            </span>
          </td>
        </tr>
      </tbody>
    </table>
  );
};

export default ExtraCharges;
