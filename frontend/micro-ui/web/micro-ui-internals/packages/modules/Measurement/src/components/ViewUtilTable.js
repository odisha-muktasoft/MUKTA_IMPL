import { AddIcon, TextInput, Amount, Button, Dropdown, Loader, DeleteIcon, TextArea } from "@egovernments/digit-ui-react-components";

import React, { Fragment, useEffect, useCallback } from "react";
import { useTranslation } from "react-i18next";

import UtilMeasureCard from "./util/UtilMeasureCard";

let defaultSOR = {
  amount: 0,
  consumedQ: 0,
  sNo: 1,
  uom: null,
  description: "",
  unitRate: 0,
  category: "NON-SOR",
  targetId: null,
  approvedQuantity: 0,
  currentMBEntry: 0,
  measures: [
    {
      sNo: 1,
      targetId: null,
      isDeduction: false,
      description: null || "   ",
      id: 0,
      height: 0,
      width: 0,
      length: 0,
      number: 0,
      noOfunit: 0,
      rowAmount: 0,
      consumedRowQuantity: 0,
    },
  ],
};

function hasDecimalPlaces(number, decimalPlaces) {
  if (number == "") {
    return true;
  }
  var numStr = number.toString();
  // Using regex to check if its accepting upto given decimal places
  var regex = new RegExp(`^[0-9]+(\\.[0-9]{0,${decimalPlaces}})?$`);
  return regex.test(numStr);
}

const ViewUtilTable = (props) => {
  const { register, setValue, arrayProps = {}, config = {}, watch, type = false } = props;
  let { key: tableKey, mode } = config;
  mode = props?.props?.mode || props?.config?.mode ? props?.props?.mode || props?.config?.mode : mode;
  let { fields, append, remove } = arrayProps || {};
  console.log(type);
  const options = {
    masterName: "UOM",
    moduleName: "common-masters",
    localePrefix: "ES_COMMON_UOM",
  };

  
  const setFormValue = useCallback(
    (value) => {
      setValue(tableKey, value);
      setValue(`${tableKey}table`, value);
    },
    [setValue, tableKey]
  );

  const requestCriteria = {
    url: "/mdms-v2/v1/_search",
    body: {
      MdmsCriteria: {
        moduleDetails: [
          {
            moduleName: options?.moduleName,
            masterDetails: [
              {
                name: options?.masterName,
              },
            ],
          },
        ],
        tenantId: Digit.ULBService.getCurrentTenantId(),
      },
    },
    config: {
      select: (data) => {
        const optionsData = _.get(data?.MdmsRes, `${options?.moduleName}.${options?.masterName}`, []);
        return optionsData
          ?.filter((opt) => opt?.active === undefined || opt?.active === true)
          .map((opt) => ({ ...opt, name: `${options?.localePrefix}_${opt.code}` }));
      },
      enabled: mode == "CREATEALL" || mode === "CREATERE",
    },
  };
  const { isLoading, data: UOMData } = Digit.Hooks.useCustomAPIHook(requestCriteria);

  const { t } = useTranslation();
  const sum = parseFloat(fields?.reduce((acc, row) => acc + parseFloat(row?.amount), 0)?.toFixed?.(2)) || 0;
  let formattedSum = isNaN(sum) ? 0 : parseFloat(sum)?.toFixed(2);

  useEffect(() => {
    // console.log("tableKey, fields",tableKey, fields)
    register(tableKey, fields);
    register(`${tableKey}table`, fields);
  }, []);
  const getStyles = (index) => {
    let obj = {};
    if (type) {
      switch (index) {
        case 1:
          obj = { width: "1rem" };
          break;
        case 2:
          obj = { width: "6%" };
          break;
        case 4:
          obj = { width: "27rem" };

          break;
        case 5:
          obj = { width: "27rem" };
          break;
        case 3:
          obj = { width: "50%" };
          break;
        case 7:
          obj = { width: "27rem" };

          break;

        default:
          obj = { width: "27rem" };
          break;
      }
    } else {
      switch (index) {
        case 1:
          obj = { width: "1rem" };
          break;
        case 2:
          obj = { width: "10%" };
          break;
        case 4:
          obj = { width: "45%" };

          break;
        case 5:
          if (mode === "VIEWRE" && tableKey === "NONSOR") obj = { width: "0rem" };
          obj = { width: "27rem" };
          break;
        case 3:
          obj = { width: "27rem" };
          break;
        case 7:
          obj = { width: "130rem" };

          break;
        case 9:
          obj = { width: "130rem" };
          // if (tableKey === "SOR" && mode === "CREATERE") obj = { width: "84rem" };
          break;
        case 11:
          obj = { width: "0rem" };
          break;
        default:
          obj = { width: "27rem" };
          break;
      }
    }
    return obj;
  };

  const getColumns = (mode, t) => {
    if (type) {
      return [t("S.NO"), t("Code"), t("Description"), t("UOM"), t("Rate"), t("Quantity"), t("Amount")];
    } else {
      return [t("S.NO"), t("SOR Type/Sub Type"), t("code"), t("Description"), t("UOM"), t("Rate"), t("Consumed Quantity"), t("Amount")];
    }
  };

  let columns = getColumns(mode, t);

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

  const getMeasureCardColumns = () => {
    if (mode === "CREATEALL" || mode === "VIEWES" || mode === "CREATERE" || mode === "VIEWRE")
      return [
        t("WORKS_SNO"),
        t("Code"),
        t("WORKS_ESTIMATE_DESCRIPTION"),
        t("WORKS_ESTIMATE_ONLY_NUMBER"),
        t("WORKS_ESTIMATE_LENGTH"),
        t("WORKS_ESTIMATE_WIDTH"),
        t("WORKS_ESTIMATE_HEIGHT"),
        t("WORKS_ESTIMATE_QUANTITY"),
      ];
    else return [t("S.No"), t("Code"), t("Description"), t("Unit"), t("Rate"), t("Quantity"), t("Amount")];
  };

  const renderBody = () => {
    // Update the state with the new data
    const handleInputChange = useCallback((key, value, index) => {
      const field = fields[index] || {};
      field[key] = value;
      if (tableKey === "NONSOR" && key === "unitRate") {
        field["amount"] = parseFloat(field[key]) * field["currentMBEntry"] || 0;
      }

      fields[index] = { ...field };
      if (tableKey === "NONSOR" && key === "unitRate" && !hasDecimalPlaces(field[key], 2)) {
        return;
      }
      setFormValue(fields);
    });
    return fields?.map((row, index) => {
      const consumedQty = row.currentMBEntry || 0;
      const initialState = { tableState: row?.measures };
      const optionsData = UOMData?.map((obj) => ({ code: obj?.code, name: obj?.name }));
      if (isLoading) {
        return <Loader />;
      } else {
        return !type ? (
          <>
            <tr key={index}>
              <td>{index + 1}</td>
              {
                <>
                  {/*added this dummy line because project creation and search is failing will check this once it works */}
                  {/*((mode === "VIEWES") && tableKey === "SOR") &&<td>{`${t(`${"Works_D"}`)}/ ${t(`${"SC_D"}`)}`}</td>*/}
                  {/* tableKey === "SOR" &&
                    (mode === "CREATEALL" || mode === "VIEWES" || mode === "CREATERE" || mode === "VIEWRE") &&
                    (row?.sorType || row?.sorSubType ? (
                      <td>{`${t(`WORKS_SOR_TYPE_${row?.sorType}`)}/ ${t(`WORKS_SOR_SUBTYPE_${row?.sorSubType}`)}`}</td>
                    ) : (
                      <td>{t(" ")}</td>
                    ))*/}
                  {/*
                    (mode === "VIEW" || mode === "CREATEALL" || mode === "VIEWES" || mode === "VIEWES" || mode === "CREATERE" || mode === "VIEWRE") &&
                    tableKey === "SOR" && <td>{row?.sorCode}</td>
                    */}

                  <td>{row.uom}</td>

                  <td>
                    <Amount
                      customStyle={{ textAlign: "right" }}
                      value={
                        Digit.Utils.dss.formatterWithoutRound(parseFloat(row?.unitRate).toFixed(2), "number", undefined, true, undefined, 2) || 0
                      }
                      t={t}
                      roundOff={false}
                      sameDisplay={true}
                    ></Amount>
                  </td>
                  <td>{row.description}</td>
                </>
              }

              {mode != "CREATEALL" && mode != "VIEWES" && mode != "VIEWRE" && mode != "CREATERE" && (
                <>
                  <td>
                    <Amount customStyle={{ textAlign: "right" }} value={row?.approvedQuantity?.toFixed?.(2) || 0} t={t} roundOff={false}></Amount>
                  </td>
                  <td>
                    <Amount customStyle={{ textAlign: "right" }} value={row?.consumedQ?.toFixed?.(2) || 0} t={t} roundOff={false}></Amount>
                  </td>
                </>
              )}
              <td>
                <Amount customStyle={{ textAlign: "right" }} value={consumedQty?.toFixed(4)} t={t} roundOff={false}></Amount>
                {/*<span className="measurement-table-input">
                  <TextInput
                    style={{ width: "90%", marginTop: "12px" }}
                    textInputStyle={{ marginTop: "7px" }}
                    key={row?.id} // important to include key with field's id
                    // {...register(`${tableKey}.${index}.currentMBEntry`)}
                    value={consumedQty?.toFixed(4)}
                    onChange={() => {}}
                    disable={initialState.length > 0 ? "true" : "false"}
                  />
            </span>*/}
              </td>

              <td>
                <Amount
                  customStyle={{ textAlign: "right" }}
                  value={Digit.Utils.dss.formatterWithoutRound(parseFloat(row?.amount).toFixed(2), "number", undefined, true, undefined, 2) || 0}
                  t={t}
                  roundOff={false}
                  sameDisplay={true}
                ></Amount>
              </td>
            </tr>
            {row?.showMeasure && !initialState.length > 0 && (
              <tr>
                <td colSpan={"1"}></td>
                <td
                  colSpan={
                    (mode == "CREATEALL" || mode == "CREATERE") && tableKey !== "SOR"
                      ? mode === "CREATERE" || mode === "VIEWRE"
                        ? 7
                        : 5
                      : mode === "CREATERE" || mode === "VIEWRE"
                      ? 9
                      : 7
                  }
                >
                  <UtilMeasureCard
                    columns={getMeasureCardColumns()}
                    unitRate={row.unitRate}
                    fields={row?.measures || []}
                    register={register}
                    setValue={setFormValue}
                    tableKey={tableKey}
                    tableData={fields}
                    tableIndex={index}
                    mode={mode}
                  />
                </td>
              </tr>
            )}
          </>
        ) : (
          <>
            <tr key={index}>
              <td>{index + 1}</td>
              {
                <>
                  {/*added this dummy line because project creation and search is failing will check this once it works */}
                  {/*((mode === "VIEWES") && tableKey === "SOR") &&<td>{`${t(`${"Works_D"}`)}/ ${t(`${"SC_D"}`)}`}</td>*/}
                  {/* tableKey === "SOR" &&
                    (mode === "CREATEALL" || mode === "VIEWES" || mode === "CREATERE" || mode === "VIEWRE") &&
                    (row?.sorType || row?.sorSubType ? (
                      <td>{`${t(`WORKS_SOR_TYPE_${row?.sorType}`)}/ ${t(`WORKS_SOR_SUBTYPE_${row?.sorSubType}`)}`}</td>
                    ) : (
                      <td>{t(" ")}</td>
                    ))*/}
                  {/*
                    (mode === "VIEW" || mode === "CREATEALL" || mode === "VIEWES" || mode === "VIEWES" || mode === "CREATERE" || mode === "VIEWRE") &&
                    tableKey === "SOR" && <td>{row?.sorCode}</td>
                    */}

                  <td>
                    <Amount
                      customStyle={{ textAlign: "right" }}
                      value={
                        Digit.Utils.dss.formatterWithoutRound(parseFloat(row?.unitRate).toFixed(2), "number", undefined, true, undefined, 2) || 0
                      }
                      t={t}
                      roundOff={false}
                      sameDisplay={true}
                    ></Amount>
                  </td>
                  <td>{row.description}</td>
                </>
              }

              {mode != "CREATEALL" && mode != "VIEWES" && mode != "VIEWRE" && mode != "CREATERE" && (
                <>
                  <td>
                    <Amount customStyle={{ textAlign: "right" }} value={row?.approvedQuantity?.toFixed?.(2) || 0} t={t} roundOff={false}></Amount>
                  </td>
                  <td>
                    <Amount customStyle={{ textAlign: "right" }} value={row?.consumedQ?.toFixed?.(2) || 0} t={t} roundOff={false}></Amount>
                  </td>
                </>
              )}
              <td>
                <Amount customStyle={{ textAlign: "right" }} value={consumedQty?.toFixed(4)} t={t} roundOff={false}></Amount>
                {/*<span className="measurement-table-input">
                  <TextInput
                    style={{ width: "90%", marginTop: "12px" }}
                    textInputStyle={{ marginTop: "7px" }}
                    key={row?.id} // important to include key with field's id
                    // {...register(`${tableKey}.${index}.currentMBEntry`)}
                    value={consumedQty?.toFixed(4)}
                    onChange={() => {}}
                    disable={initialState.length > 0 ? "true" : "false"}
                  />
            </span>*/}
              </td>

              <td>
                <Amount
                  customStyle={{ textAlign: "right" }}
                  value={Digit.Utils.dss.formatterWithoutRound(parseFloat(row?.amount).toFixed(2), "number", undefined, true, undefined, 2) || 0}
                  t={t}
                  roundOff={false}
                  sameDisplay={true}
                ></Amount>
              </td>
            </tr>
            {row?.showMeasure && !initialState.length > 0 && (
              <tr>
                <td colSpan={"1"}></td>
                <td
                  colSpan={
                    (mode == "CREATEALL" || mode == "CREATERE") && tableKey !== "SOR"
                      ? mode === "CREATERE" || mode === "VIEWRE"
                        ? 7
                        : 5
                      : mode === "CREATERE" || mode === "VIEWRE"
                      ? 9
                      : 7
                  }
                >
                  <UtilMeasureCard
                    columns={getMeasureCardColumns()}
                    unitRate={row.unitRate}
                    fields={row?.measures || []}
                    register={register}
                    setValue={setFormValue}
                    tableKey={tableKey}
                    tableData={fields}
                    tableIndex={index}
                    mode={mode}
                  />
                </td>
              </tr>
            )}
          </>
        );
      }
    });
  };

  return (
    <React.Fragment>
      <table className="table reports-table sub-work-table measurement-table-custom">
        <thead>
          <tr>{renderHeader()}</tr>
        </thead>
        <tbody>
          {renderBody()}
          <tr>
            {(mode == "CREATEALL" || mode == "CREATERE") && tableKey == "NONSOR" && (
              <td
                colSpan={mode === "CREATERE" ? 8 : 6}
                style={{ textAlign: "center" }}
                onClick={() => {
                  append({
                    amount: 0,
                    consumedQ: 0,
                    category: "NON-SOR",
                    sNo: fields?.length + 1,
                    currentMBEntry: 0,
                    uom: null,
                    description: "",
                    unitRate: "",
                    contractNumber: "",
                    targetId: "",
                    approvedQuantity: "",
                    measures: [],
                  });
                }}
              >
                <span>
                  <AddIcon fill={"#F47738"} styles={{ margin: "auto", display: "inline", marginTop: "-2px" }} />
                  <label style={{ marginLeft: "10px", fontWeight: "600", color: " #F47738" }}>{t("WORKS_ADD_SOR")}</label>
                </span>
              </td>
            )}
          </tr>
          <tr>
            <td colSpan={!type ? 7 : 6}>
              <div style={{ display: "flex", flexDirection: "row", justifyContent: "flex-end", margin: "5px" }}>
                <div style={{ display: "flex", flexDirection: "row", fontSize: "16px" }}>
                  <span style={{ fontWeight: "bold", marginTop: "0px" }}>{t("WORKS_TABLE_TOTAL_AMOUNT")}</span>
                </div>
              </div>
            </td>
            <td colSpan={8}>
              <div style={{ display: "flex", flexDirection: "row", justifyContent: "flex-end", margin: "5px" }}>
                <div style={{ display: "flex", flexDirection: "row", fontSize: "16px" }}>
                  <span style={{ marginLeft: "8px" }}>
                    <Amount
                      customStyle={{ textAlign: "right", fontSize: "24px", fontWeight: "700" }}
                      value={Digit.Utils.dss.formatterWithoutRound(formattedSum, "number", undefined, true, undefined, 2) || 0}
                      t={t}
                      roundOff={false}
                      rupeeSymbol={true}
                      sameDisplay={true}
                    ></Amount>
                  </span>
                </div>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
      {/*<div style={{ display: "flex", flexDirection: "row", justifyContent: "flex-end", margin: "20px" }}>
        <div style={{ display: "flex", flexDirection: "row", fontSize: "16px" }}>
          <span style={{ fontWeight: "bold", marginTop: "6px" }}>{t("WORKS_TABLE_TOTAL_AMOUNT")} :</span>
          <span style={{ marginLeft: "8px" }}>
            <Amount
              customStyle={{ textAlign: "right", fontSize: "24px", fontWeight: "700" }}
              value={Digit.Utils.dss.formatterWithoutRound(formattedSum, "number", undefined, true, undefined, 2) || 0}
              t={t}
              roundOff={false}
              rupeeSymbol={true}
              sameDisplay={true}
            ></Amount>
          </span>
        </div>
          </div>*/}
    </React.Fragment>
  );
};

export default ViewUtilTable;
