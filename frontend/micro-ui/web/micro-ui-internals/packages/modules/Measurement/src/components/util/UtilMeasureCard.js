import { Button, CardLabelError, CardSectionHeader, CloseSvg } from "@egovernments/digit-ui-react-components";
import React, { useReducer, Fragment, useState } from "react";
import { useTranslation } from "react-i18next";
import MeasureRow from "../MeasureRow";
import UtilMeasureRow from "./UtilMeasureRow";

const getStyles = (index) => {
  let obj = {};
  switch (index) {
    case 1:
      obj = { width: "0.5rem" };
      break;
    case 2:
      obj = { width: "0.5rem" };
      break;
    case 3:
      obj = { width: "45rem" };
      break;
    case 4:
      obj = { width: "9rem" };
      break;
    case 5:
      obj = { width: "9rem" };
      break;
    default:
      obj = { width: "9rem" };
      break;
  }
  return obj;
};
const validate = (value) => {
  if (value === null || value === undefined || value === "" || value === 0 || value === "0") {
    return 1;
  } else {
    return value;
  }
};
const initialValue = (element, li) => {
  let valid = true;
  if (element?.additionalDetails?.measureLineItems?.length > 0) {
    if (li?.number !== "" && li?.number !== "0" && li?.number !== 0) valid = false;
    if (li?.width !== "" && li?.width !== "0" && li?.width !== 0) valid = false;
    if (li?.length !== "" && li?.length !== "0" && li?.length !== 0) valid = false;
    if (li?.height !== "" && li?.height !== "0" && li?.height !== 0) valid = false;
  } else {
    if (element.number !== "" && element.number !== "0" && element.number !== 0) valid = false;
    if (element.width !== "" && element.width !== "0" && element.width !== 0) valid = false;
    if (element.length !== "" && element.length !== "0" && element.length !== 0) valid = false;
    if (element.height !== "" && element.height !== "0" && element.height !== 0) valid = false;
  }
  return valid;
};

const UtilMeasureCard = React.memo(({ columns, fields = [], register, setValue, tableData, tableKey, tableIndex, unitRate, mode }) => {
  const { t } = useTranslation();
  const [error, setError] = useState({ message: "", enable: false });

  const reducer = (state, action) => {
    // console.log(state, action, "reducer");
    switch (action.type) {
      case "ADD_ROW":
        const { state: newRow } = action;
        return [...state, newRow];
      case "ADD_MEASURE":
        const {
          state: { id: idMeasure, additionalDetails: additionaldetails },
        } = action;
        let findIndexMeasure = state.findIndex((row, index) => {
          return index + 1 === idMeasure;
        });
        state[findIndexMeasure]["additionalDetails"] = additionaldetails;
        return [...state];
      case "UPDATE_ROW":
        setError({ message: "", enable: false });
        const {
          state: { id, value, row, type, additionalDetails },
        } = action;
        let findIndex = state.findIndex((row, index) => {
          return index + 1 === id;
        });
        state[findIndex][type] = value;
        //added condition for measurement create that for multimeasure l,b,h will be 0 and num of items is equal to total of multi measure
        if (mode === "CREATE") {
          state[findIndex][type] = 0;
          state[findIndex]["additionalDetails"] = additionalDetails;
        }

        const element = state[findIndex];
        let calculatedValue = validate(element?.number) * validate(element?.length) * validate(element?.width) * validate(element?.height);
        //calculating current value according to multimeasure present inside additional details
        if (mode === "CREATE")
          calculatedValue = element?.additionalDetails?.measureLineItems?.reduce((sum, row, index) => {
            state[findIndex].additionalDetails.measureLineItems[index].quantity = initialValue(element, row)
              ? 0
              : validate(row.number) * validate(row.length) * validate(row.width) * validate(row.height);
            state[findIndex].additionalDetails.measureLineItems[index].quantity = initialValue(element, row)
              ? 0
              : state[findIndex]?.additionalDetails?.measureLineItems[index]?.quantity.toFixed(5).slice(-1) === "5"
              ? (Math.ceil(state[findIndex]?.additionalDetails?.measureLineItems[index]?.quantity * 10000) / 10000).toFixed(4)
              : state[findIndex]?.additionalDetails?.measureLineItems[index]?.quantity.toFixed(4);
            return sum + parseFloat(row?.quantity);
          }, 0);
        if (initialValue(element)) {
          calculatedValue = 0;
        }
        state[findIndex].noOfunit = calculatedValue
          ? calculatedValue.toFixed(5).slice(-1) === "5"
            ? (Math.ceil(calculatedValue * 10000) / 10000).toFixed(4)
            : calculatedValue.toFixed(4)
          : 0;
        if (mode === "CREATE") state[findIndex]["numItems"] = calculatedValue;
        state[findIndex].rowAmount = unitRate * calculatedValue || 0;

        if (element?.additionalDetails?.measureLineItems?.length == 1 && element?.additionalDetails?.measureLineItems?.[0]?.quantity == 0) {
          state[findIndex].number = 0;
          state[findIndex].length = 0;
          state[findIndex].width = 0;
          state[findIndex].height = 0;
        }

        let allHaveZeroProperties = element?.additionalDetails?.measureLineItems?.every(
          (obj) => obj.width === 0 && obj.height === 0 && obj.length === 0 && obj.number === 0
        );
        if (allHaveZeroProperties) {
          state[findIndex].number = 0;
          state[findIndex].length = 0;
          state[findIndex].width = 0;
          state[findIndex].height = 0;
        }

        return [...state];
      case "REMOVE_ROW":
        const { id: rowIdToRemove } = action;
        const updatedTableState = state.filter((row, index) => index + 1 !== rowIdToRemove);
        return [...updatedTableState];
      case "REMOVE_MEASURE_ROW":
        const { id: measureId, measurelineitemNo } = action;
        let findIndexofMeasure = state.findIndex((row, index) => {
          return index + 1 === measureId;
        });

        //removing the multi measure which is deleted and updating the multimeasurelineitems no in sequence order
        let updatedmeasureLineItems = state
          .filter((row, index) => index + 1 === measureId)
          ?.map((row) => {
            if (!row.additionalDetails || !row.additionalDetails.measureLineItems) return [];
            const filteredMeasureLineItems = row.additionalDetails.measureLineItems.filter((ob) => ob?.measurelineitemNo !== measurelineitemNo);
            // Reorder measureLineItems to ensure they are in sequence
            //const reorderedMeasureLineItems = filteredMeasureLineItems.map((item, index) => ({ ...item, measurelineitemNo: index + 1 }));
            return filteredMeasureLineItems;
          })?.[0];
        if (updatedmeasureLineItems) state[findIndexofMeasure]["additionalDetails"]["measureLineItems"] = updatedmeasureLineItems;

        //calculating the new total value and setting to the noofunits
        const ele = state[findIndexofMeasure];
        let calculatedvalue = ele?.additionalDetails?.measureLineItems?.reduce((sum, row, index) => {
          state[findIndexofMeasure].additionalDetails.measureLineItems[index].quantity = initialValue(ele, row)
            ? 0
            : validate(row.number) * validate(row.length) * validate(row.width) * validate(row.height);
          state[findIndexofMeasure].additionalDetails.measureLineItems[index].quantity = initialValue(ele, row)
            ? 0
            : state[findIndexofMeasure]?.additionalDetails?.measureLineItems[index]?.quantity.toFixed(5).slice(-1) === "5"
            ? (Math.ceil(state[findIndexofMeasure]?.additionalDetails?.measureLineItems[index]?.quantity * 10000) / 10000).toFixed(4)
            : state[findIndexofMeasure]?.additionalDetails?.measureLineItems[index]?.quantity.toFixed(4);
          return sum + parseFloat(row?.quantity);
        }, 0);

        //let calculatedValue = validate(element.number) * validate(element.length) * validate(element.width) * validate(element.height);
        if (initialValue(ele)) {
          calculatedvalue = 0;
        }
        state[findIndexofMeasure].noOfunit = calculatedvalue ? calculatedvalue?.toFixed(4) : 0;
        state[findIndexofMeasure].rowAmount = unitRate * calculatedvalue || 0;

        return [...state];
      case "CLEAR_STATE":
        setError({ message: "", enable: false });
        const clearedTableState = state.map((item) => ({
          ...item,
          additionalDetails:
            mode === "CREATE" && item?.additionalDetails
              ? { ...item?.additionalDetails, measureLineItems: [{ number: 0, width: 0, length: 0, height: 0, quantity: 0, measurelineitemNo: 0 }] }
              : item?.additionalDetails
              ? { ...item?.additionalDetails }
              : {},
          height: 0,
          description: mode === "CREATE" ? item?.description : "",
          width: 0,
          length: 0,
          number: 0,
          noOfunit: 0,
          rowAmount: 0,
        }));
        return [...clearedTableState];

      default:
        return state;
    }
  };

  const [state, dispatch] = useReducer(reducer, fields);

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

  const renderBody = () => {
    return state?.map((value, index) => {
      return (
        <>
          <UtilMeasureRow value={value} index={index} key={index} rowState={state?.[index]} dispatch={dispatch} mode={mode} fields={state} />

          <tr key={index + 1}>
            <td style={mode === "CREATE" || mode === "VIEW" ? { verticalAlign: "top" } : {}}>
              <div style={{ marginBottom: "21px" }}></div>
            </td>

            <td  colspan="5"    style={mode === "VIEW" ? { verticalAlign: "top" , textAlign:"right"} : {}}>Total</td>
            <td style={mode === "VIEW" ? { verticalAlign: "top" } : {}}></td>
          </tr>
        </>
      );
    });
  };

  const total =
    state?.reduce?.((acc, curr) => (curr.isDeduction == true ? acc - parseFloat(curr?.noOfunit) : acc + parseFloat(curr?.noOfunit)), 0) || 0;
  return (
    <Fragment>
      <div>
        <CardSectionHeader style={{ fontSize: "18px" }}>{t("WORKS_MEASUREMENT_TABLE_HEADER")}</CardSectionHeader>
        {/* <span className="measure-table-header" onClick={() => {
          tableData[tableIndex].showMeasure = false;
          setValue(tableData);
        }}>
        <CloseSvg />
    </span>*/}
      </div>
      <table className="table reports-table sub-work-table">
        <thead>
          <tr>{renderHeader()}</tr>
        </thead>
        <tbody>{renderBody()}</tbody>
      </table>
    </Fragment>
  );
});

export default UtilMeasureCard;
