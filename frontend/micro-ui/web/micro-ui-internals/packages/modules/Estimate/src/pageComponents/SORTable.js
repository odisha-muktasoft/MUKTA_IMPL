import React, { Fragment, useState, useEffect, useMemo } from "react";
import { 
  DeleteIcon, 
  TextInput, 
  CardLabelError, 
  Dropdown, 
  Loader, 
  CrossIcon, 
  PlusIcon,
  LabelFieldPair, 
  CardLabel, 
  SubmitBar
} from "@egovernments/digit-ui-react-components";
import { Controller } from "react-hook-form";
import _ from "lodash";
import MeasurementSheetTable from "./MeasurementSheetTable";
import cloneDeep from "lodash/cloneDeep";


const SORTable = ({ control, watch, config, ...props }) => {
  const populators = config?.populators

  const [totalAmount, setTotalAmount] = useState(0);

  const formFieldName = "SORTablev1"; // this will be the key under which the data for this table will be present on onFormSubmit
  const formFieldSearchName = "searchSORinSORv1"
  const initialState = [
    {
      key: 1,
      isShow: true,
    },
  ];

  const { t, register, errors, setValue, getValues, formData, unregister } = props;

  // const [rows, setRows] = useState(initialState);
  const [rows, setRows] = useState(
    formData?.[formFieldName]?.length > 2
      ? formData?.[formFieldName]
        ?.map((row, index) => {
          return row
            ? {
              key: index,
              isShow: row?.isActive ? row?.isActive : !(row?.estimatedAmount === "0"),
              isMeasurementSheet: false
            }
            : {
              key: index + 1000,
              isShow: false,
              isMeasurementSheet: false
            };
        })
        ?.filter((row) => row)
      : initialState
  );


  const setTotal = (formData) => {
    const tableData = formData?.[formFieldName];

    const result = tableData?.filter((tableRow, idx) => {
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
        obj = { width: "1rem" };
        break;
      case 2:
        obj = { width: "10rem" };
        break;
      case 3:
        obj = { width: "10rem" };
        break;
      case 4:
        obj = { width: "30rem" };
        break;
      case 5:
        obj = { width: "10rem" };
        break;
      case 6:
        obj = { width: "10rem" };
        break;
      case 7:
        obj = { width: "30rem" };
        break;
      case 8:
        obj = { width: "10rem" };
        break;
      default:
        obj = { width: "1rem" };
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
    const countRows = rows.reduce((acc, row) => {
      return row.isShow ? acc + 1 : acc
    }, 0)
    if (countRows === 1) {
      //clear the 1st rows data

      formData?.[formFieldName]?.map((row, index) => {
        if (row) {
          setValue(`${formFieldName}.${index}.description`, '')
          setValue(`${formFieldName}.${index}.rate`, "0")
          setValue(`${formFieldName}.${index}.uom`, '')
          setValue(`${formFieldName}.${index}.estimatedQuantity`, '')
          setValue(`${formFieldName}.${index}.estimatedAmount`, "0")
        }
      })

      return
    }

    //make a new state here which doesn't have this key
    const updatedState = rows.map((e) => {
      if (e.key === row.key) {
        return {
          key: e.key,
          isShow: false,
        };
      }
      return e;
    });
    setValue(`${formFieldName}.${row.key}.estimatedAmount`, 0);
    setRows((prev) => updatedState);
  };
  const showHideMeasurementSheet = (row, index) => {
    let noOfRows = cloneDeep(rows)
    noOfRows[index] = {
      ...noOfRows?.[index],
      isMeasurementSheet: !(noOfRows?.[index]?.isMeasurementSheet)
    }
    // const obj = {
    //   key: null,
    //   isShow: true,
    // };
    // obj.key = rows[rows.length - 1].key + 1;
    // setRows((prev) => [...prev, obj]);
    setRows(noOfRows);
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

  console.log(rows, "pojqpowjepojqwpoe")
  const cellContainerStyle = { display: "flex", flexDirection: "column", fontWeight: "700" };
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
                Earth Work
              </div>
            </td>

            <td style={getStyles(3)}>
              <div style={cellContainerStyle}>
                EW-00008
              </div>
            </td>

            <td style={getStyles(5)}>
              <div style={cellContainerStyle}>
                Wall painting in the Ward 1, Wall painting and ...
              </div>
            </td>

            <td style={getStyles(5)}>
              <div style={cellContainerStyle}>
                CUM
              </div>
            </td>

            <td style={getStyles(5)}>
              <div style={cellContainerStyle}>
                64.00
              </div>
            </td>

            <td style={getStyles(5)}>
              <div style={cellContainerStyle}>
                <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                  <TextInput
                    style={{ marginBottom: "0px", textAlign: "left", paddingRight: "1rem" }}
                    name={`${formFieldName}.${row.key}.estimatedQuantity`}
                    inputRef={register({
                      required: true,
                      // pattern: /^[0-9]*$/,
                      max: populators?.quantity?.max,
                      pattern: /^\s*(?=.*[1-9])\d*(?:\.\d{1,2})?\s*$/,
                    })}
                    onChange={(e) => setAmountField(e, row)}
                  />
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

            <td style={getStyles(5)}>
              <div style={cellContainerStyle}>
                6004.00
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
          {row?.isMeasurementSheet && <tr>
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
                    props={props}
                  />
                </div>
              </div>
            </td>
            <td colSpan={1} style={getStyles(3)}></td>
          </tr>}
        </>

      );
    });
  }, [rows, formData])


  return (
    <>
      <LabelFieldPair>
        <CardLabel style={{ fontSize: "16px", fontStyle: "bold", fontWeight: "600" }}>{`${t(`WORKS_SEARCH_SOR`)}:`}</CardLabel>
        <TextInput
          className={"field"}
          placeholder={t("WORKS_SOR_INPUT_PLACEHOLDER")}
          textInputStyle={{ width: "32%" }}
          inputRef={register({
            required: false,
            pattern: /^[a-zA-Z0-9_ .$@#\/ ]*$/
          })}
          name={`${formFieldSearchName}.sor`}
        />
        <div style={{ alignSelf: 'flex-start', marginLeft: "1rem" }} >
          <SubmitBar
            label={t("SOR_ADD")}
            onSubmit={() => { }}
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
