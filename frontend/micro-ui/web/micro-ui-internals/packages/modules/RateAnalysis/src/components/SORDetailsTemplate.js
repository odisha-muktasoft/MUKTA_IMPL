import { Card, Header, Button, Loader, TextInput, DeleteIcon } from "@egovernments/digit-ui-react-components";
import React, { useState, useEffect, useCallback } from "react";
import { useTranslation } from "react-i18next";
import SearchBar from "../../../Estimate/src/pageComponents/SearchBar";
import { has4DecimalPlaces } from "../utils/transformData";


import { calculateTotalAmount } from "../utils/transformData";

const SORDetailsTemplate = (props) => {
  //new component only
  const { t } = useTranslation();
  

  const { pageType, arrayData, register, setValue, watch,  emptyTableMsg } = props;
  const [stateData, setStateData] = useState({});
  const [selectedSOR, setSelectedSOR] = useState(null);
  const [SORDetails, setSORDetails] = useState([]);
  const [showToast, setShowToast] = useState({ show: false, label: "", error: false });
  
  let formData = watch("SORDetails");

  useEffect(() => {
    setSORDetails(arrayData?arrayData:[])

  }, [arrayData]);

  
  

  //setting the value for search sor in the statedata
  useEffect(() => {
    register("searchSor", stateData);
  }, []);
  useEffect(() => {
    setStateData({
      ...stateData,
      selectedSor: selectedSOR,
    });
    setValue("searchSor", stateData);
  }, [selectedSOR]);

  const setFormValue = useCallback(
    (value) => {
      register("SORDetails", value);
    },
    [setValue]
  );

  useEffect(() => {
    setValue("SORDetails", SORDetails);
  }, [SORDetails]);

  const buttonClick = async () => {
    const sor = transformSOR(stateData?.selectedSor);
    sor?.sorId && formData?.push({ ...sor, sorType: props?.config?.sorType });

    setFormValue(formData);
    setSORDetails(formData);
    setStateData({ ...stateData });

    setSelectedSOR(null);
  };

  const remove = (row) => {
    let newSORDetails = SORDetails?.filter((ob) => ob?.sorCode !== row?.sorCode);
    setFormValue(newSORDetails);
    setSORDetails(newSORDetails);
    setStateData({ ...stateData });
  };

  const cellContainerStyle = { display: "flex", flexDirection: "column" };
  const errorCardStyle = { width: "100%", fontSize: "12px", whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" };
  const errorContainerStyles = { display: "block", height: "1rem", overflow: "hidden" };

  const columns = [
    { label: t("RA_SNO"), key: "sno" },
    { label: t("RA_CODE"), key: "sorCode" },
    { label: t("RA_NAME"), key: "description" },
    { label: t("RA_UOM"), key: "uom" },
    { label: t("RA_QTY"), key: "quantity" },
  ];

  if (pageType === "VIEW") {
    columns.splice(4, 0, { label: t("RA_BASIC_RATE"), key: "basicRate" });
    columns.push({ label: t("RA_AMT"), key: "amount" });
  }
  const transformSOR = (sor) => {
    const transformedSOR = {
      sNo: 1,
      description: sor?.description,
      uom: sor?.uom,
      category: "SOR",
      approvedQuantity: sor?.quantity,
      consumedQ: 0,
      sorType: sor?.sorType,
      sorSubType: sor?.sorSubType,
      sorCode: sor?.id,
      currentMBEntry: 0,
      amount: 0,
      measures: [],
      targetId: null,
      sorId: sor?.id,
      quantity: null,
      definedQuantity: sor?.quantity,
    };
    return transformedSOR;
  };

  const SORTypeCodes = {
    MATERIAL: "M",
    MACHINERY: "MH",
    LABOUR: "L",
  };

  const getStyles = (index) => {
    let obj = {};
    switch (index) {
      case 1:
        obj = { width: "1rem" };
        break;
      case 2:
        obj = { width: "12rem" };
        break;
      case 3:
        obj = { width: "70rem" };
        break;
      case 4:
        obj = { width: "10rem" };
        break;
      case 5:
        obj = pageType==="VIEW"?
        { width: "15rem" , textAlign: "right"}:{width: "15rem"};
        break;
      case 6:
        obj = pageType==="VIEW"?
        { width: "16rem" , textAlign: "right"}:{width: "15rem"};
        break;
      case 7:
        obj = pageType==="VIEW"?
        { width: "14rem" , textAlign: "right" }:{ width: "10rem" };
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

  
  const sortedRows = SORDetails.filter((ob) => ob?.sorType === props?.config?.sorType).map((row, index) => ({
    sno: index + 1,
    sorCode: row?.sorCode,
    description: row?.description,
    uom: row?.uom,
    quantity: row?.quantity,
    ...(pageType === 'VIEW' ? { amount: row?.amount,basicRate:row?.basicRate } : {})
  }));

  
  

  useEffect(() => {
    if (window.location.href.includes("update") && props?.config?.customProps?.SORDetails?.length > 0) {
      setSORDetails(props?.config?.customProps?.SORDetails);
    }
  }, [props?.config?.customProps?.SORDetails]);

  

  return (
    <div
     style={{
      paddingRight:"4%"
     }}
    >
      <div className="search-sor-container">
        <span className="search-sor-label">{t(`RA_${props?.config?.sorType}_HEADER`)}</span>
        {pageType !== "VIEW" && (
          <div className="search-sor-button">
            <SearchBar
              stateData={{ ...stateData, SORType: SORTypeCodes[props?.config?.sorType] }}
              selectedSOR={selectedSOR}
              setSelectedSOR={setSelectedSOR}
              placeholder={t("RA_SEARCH_BAR_PLACEHOLDER")}
            />
            <Button label={t("RA_ADD_SOR")} onButtonClick={buttonClick} style={{ padding: "revert" }} className={"add-sor-button"} />
          </div>
        )}
      </div>
      <table className="table reports-table sub-work-table">
        <thead>
          <tr>
            {/*SORDetails?.filter((ob) => ob?.sorType === props?.config?.sorType).length > 0 &&
      columns.map((column, index) => <th key={index}>{column.label}</th>)*/}
      {columns.map((column, index) => <th key={index}>{column.label}</th>)}
          </tr>
        </thead>
        <tbody>
          {/*renderBody*/}
          {
            sortedRows.length>0?
            sortedRows.map((row, rowIndex) => (
            <tr key={rowIndex}>
              {columns.map((column, columnIndex) => (
                <td key={columnIndex} style={getStyles(columnIndex + 1)}>
                  {column?.key === "quantity" && pageType !== "VIEW" ? (
                    <div style={cellContainerStyle}>
                      <TextInput
                        style={{ marginBottom: "0px" }}
                        value={row?.quantity}
                        onChange={(e) => {
                          const { value } = e.target;
                          if (has4DecimalPlaces(value)) {
                            let newSOR = SORDetails?.map((obj) => {
                              if (obj?.sorCode === row?.sorCode) {
                                return { ...obj, quantity: value };
                              }
                              return obj;
                            });
                            setFormValue([...newSOR]);
                            setSORDetails([...newSOR]);
                          }
                        }}
                        inputRef={register({
                          required: true,
                        })}
                        disable={false}
                      />
                    </div>
                  ) : (
                    row[column.key]
                  )}
                </td>
              ))}
              {pageType !== "VIEW" && (
                <td /*style={getStyles(5)}*/>
                  <div style={cellContainerStyle}>
                    {
                      <span onClick={() => remove(row)} className="icon-wrapper">
                        <DeleteIcon fill={"#FF9100"} />
                      </span>
                    }
                  </div>
                  <div style={errorContainerStyles}></div>
                </td>
              )}
            </tr>
          )):<td colSpan={8} style={{ textAlign: "center" }}>
          {t(emptyTableMsg)}
          </td>
        }

          {(sortedRows.length>0&& pageType === "VIEW" )&& (
            <tr>
              <td colSpan={6} style={{ textAlign: "right" }}>
                {t("RA_TOTAL")}
              </td>
              <td style={{ textAlign: "right" }}
              >{calculateTotalAmount(arrayData)}</td>
            </tr>
          )}
        </tbody>
      </table>
      {showToast?.show && (
        <Toast
          labelstyle={{ width: "100%" }}
          error={showToast?.error}
          label={t(showToast?.label)}
          isDleteBtn={true}
          onClose={() => setShowToast({ show: false, label: "", error: false })}
        />
      )}
    </div>
  );
};

export default SORDetailsTemplate;
