import { TextInput, Dropdown, DeleteIcon, Button, AddIcon } from "@egovernments/digit-ui-react-components";
import React from "react";
import { useTranslation } from "react-i18next";
import { Fragment } from "react";

function has4DecimalPlaces(number, decimalPlaces) {
  if (number == "" || isNaN(number)) return true;
  var numStr = number.toString();
  // Using regex to check if its accepting upto 4 decimal places
  var regex = new RegExp(`^\\d+(\\.\\d{0,${decimalPlaces}})?$`);
  return regex.test(numStr);
}

const MeasureInputAtom = ({ id, row, mode, disable = false, fieldKey, value, dispatch, InputDecimalValidation, measurelineitemNo, style }) => {
  return (
    <td style={style ? style : {}}>
      <TextInput
        value={fieldKey === "description" ? value : value > 0 && value}
        //value={value}
        style={mode === "CREATE" || mode === "VIEW" ? { marginBottom: "0px" } : {}}
        type={fieldKey == "description" ? "text" : "number"}
        onChange={(newValue) => {
          //newValue.target.value = fieldKey == "description" ? newValue?.target?.value :  limitDecimalDigits(newValue.target.value);
          if (
            fieldKey === "description" ||
            (newValue?.target?.value && parseFloat(newValue?.target?.value) >= 0) ||
            newValue?.target?.value === "" ||
            newValue?.target?.value === null
          ) {
            let updatedMeasureLineItems = [];
            if (mode === "CREATE") {
              updatedMeasureLineItems = row?.additionalDetails?.measureLineItems?.length > 0 ? [...row?.additionalDetails?.measureLineItems] : [];
              let findMeasureIndex = updatedMeasureLineItems?.findIndex((ob) => ob?.measurelineitemNo === measurelineitemNo);
              updatedMeasureLineItems[findMeasureIndex][fieldKey] = newValue?.target?.value === "" ? 0 : newValue?.target?.value;
            }
            //on addition of multimeasure updating its value inside additional details
            if (InputDecimalValidation?.active) {
              //calling the input validation here to check if the input is under provided decimal places
              if (has4DecimalPlaces(parseFloat(newValue.target.value), InputDecimalValidation?.noOfDecimalPlaces))
                dispatch({
                  type: "UPDATE_ROW",
                  state:
                    mode === "CREATE"
                      ? {
                          id: id,
                          value: newValue.target.value,
                          row: row,
                          type: fieldKey,
                          additionalDetails: { ...row?.additionalDetails, measureLineItems: updatedMeasureLineItems },
                        }
                      : { id: id, value: newValue.target.value, row: row, type: fieldKey },
                });
            } else {
              dispatch({
                type: "UPDATE_ROW",
                state:
                  mode === "CREATE"
                    ? {
                        id: id,
                        value: newValue.target.value,
                        row: row,
                        type: fieldKey,
                        additionalDetails: { ...row?.additionalDetails, measureLineItems: updatedMeasureLineItems },
                      }
                    : { id: id, value: newValue.target.value, row: row, type: fieldKey },
              });
            }
          }
        }}
        disable={disable}
      />
    </td>
  );
};

const UtilMeasureRow = ({ value, index, rowState, dispatch, mode, fields }) => {
  const { t } = useTranslation();
  const options = [
    { label: t("MB_YES"), code: true },
    { label: t("MB_NO"), code: false },
  ];
  const InputDecimalValidation = {
    active: true,
    noOfDecimalPlaces: 4,
  };
  let firstMeasurelineitem = value?.additionalDetails?.measureLineItems?.[0];
  return (
    <>
      <tr key={index}>
        <td style={mode === "CREATE" || mode === "VIEW" ? { verticalAlign: "top" } : {}}>
          <div style={{ marginBottom: "21px" }}>{index + 1}</div>
        </td>

        <td style={mode === "CREATE" || mode === "VIEW" ? { verticalAlign: "top" } : {}}>{rowState?.isDeduction ? t("MB_YES") : t("MB_NO")}</td>
        <td style={mode === "VIEW" ? { verticalAlign: "top" } : {}}>{rowState?.description}</td>

        <MeasureInputAtom
          dispatch={dispatch}
          row={value}
          disable={mode.includes("VIEW")}
          fieldKey={"unit"}
          id={index + 1}
          value={value?.additionalDetails?.measureLineItems?.length > 0 ? firstMeasurelineitem?.["number"] : rowState?.["number"]}
          mode={mode}
          InputDecimalValidation={InputDecimalValidation}
          measurelineitemNo={firstMeasurelineitem?.measurelineitemNo}
          style={mode === "CREATE" || mode === "VIEW" ? { verticalAlign: "top" } : {}}
        />
        <MeasureInputAtom
          dispatch={dispatch}
          row={value}
          disable={mode.includes("VIEW")}
          fieldKey={"rate"}
          id={index + 1}
          value={value?.additionalDetails?.measureLineItems?.length > 0 ? firstMeasurelineitem?.["length"] : rowState?.["length"]}
          mode={mode}
          InputDecimalValidation={InputDecimalValidation}
          measurelineitemNo={firstMeasurelineitem?.measurelineitemNo}
          style={mode === "CREATE" || mode === "VIEW" ? { verticalAlign: "top" } : {}}
        />
        <MeasureInputAtom
          dispatch={dispatch}
          row={value}
          disable={mode.includes("VIEW")}
          fieldKey={"quantity"}
          id={index + 1}
          value={value?.additionalDetails?.measureLineItems?.length > 0 ? firstMeasurelineitem?.["width"] : rowState?.["width"]}
          mode={mode}
          InputDecimalValidation={InputDecimalValidation}
          measurelineitemNo={firstMeasurelineitem?.measurelineitemNo}
          style={mode === "CREATE" || mode === "VIEW" ? { verticalAlign: "top" } : {}}
        />
        <MeasureInputAtom
          dispatch={dispatch}
          row={value}
          disable={mode.includes("VIEW")}
          fieldKey={"amount"}
          id={index + 1}
          value={value?.additionalDetails?.measureLineItems?.length > 0 ? firstMeasurelineitem?.["height"] : rowState?.["height"]}
          mode={mode}
          InputDecimalValidation={InputDecimalValidation}
          measurelineitemNo={firstMeasurelineitem?.measurelineitemNo}
          style={mode === "CREATE" || mode === "VIEW" ? { verticalAlign: "top" } : {}}
        />
      </tr>
    </>
  );
};

export default UtilMeasureRow;
