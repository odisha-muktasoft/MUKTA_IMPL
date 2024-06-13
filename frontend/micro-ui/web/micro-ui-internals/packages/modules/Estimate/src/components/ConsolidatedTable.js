import React from "react";
import { useTranslation } from "react-i18next";
import { Amount } from "@egovernments/digit-ui-react-components";

const GroupedTable = (props) => {
  const { t } = useTranslation();

  let data = props?.arrayProps?.fields || [];
  let type = props?.arrayProps?.type || "W";
  // Function to calculate totals for a specific type (M, L, MH) within subrows
  const calculateTypeTotal = (subrows, type) => {
    return subrows.reduce((acc, subrow) => {
      if (subrow.type === type) {
        acc.quantity += parseFloat(subrow.quantity) || 0;
        acc.amount += parseFloat(subrow.amount) || 0;
      }
      return acc;
    }, { quantity: 0, amount: 0 });
  };

  // Function to group by SORID and calculate totals for each type
  const groupAndCalculateTotals = () => {
    const groupedData = {};

    // Iterate through each item in data array
    data.forEach(item => {
      // Iterate through each subrow of the item
      item.subrows.forEach(subrow => {
        const { sNo, code, description, uom, rate, sortype } = item;

        // Check if the SORID (code) exists in groupedData, if not, initialize it
        if (!groupedData[subrow.code]) {
          groupedData[subrow.code] = {
            sNo,
            code: subrow.code,
            description: subrow.name, // Use subrow name for description
            uom: subrow.unit, // Use subrow unit for UOM
            rate: subrow.rate,
            sortype,
            totalQuantity: parseFloat(subrow.quantity) || 0,
            totalAmount: parseFloat(subrow.amount) || 0
          };
        } else {
          // If SORID already exists in groupedData, update totals
          groupedData[subrow.code].totalQuantity += parseFloat(subrow.quantity) || 0;
          groupedData[subrow.code].totalAmount += parseFloat(subrow.amount) || 0;
        }
      });
    });

    // Convert object to array of values
    return Object.values(groupedData);
  };

  // Render table header
  const renderHeader = () => {
    const columns = [
      { key: t("WORKS_SNO"), width: "5%" },
      { key: t("Code"), width: "15%" },
      { key: t("Name"), width: "25%" },
      { key: t("UOM"), width: "10%" },
      { key: t("Rate"), width: "10%" },
      { key: t("Total M Quantity"), width: "15%" },
      { key: t("Total L Quantity"), width: "15%" },
      { key: t("Total MH Quantity"), width: "15%" }
    ];
    return (
      <tr>
        {columns.map((col, index) => (
          <th key={index} style={{ width: col.width }}>
            {col.key}
          </th>
        ))}
      </tr>
    );
  };

  // Render table body
  const renderBody = () => {
    const groupedData = groupAndCalculateTotals();

    return groupedData.map((row, index) => (
      <tr key={index}>
        <td style={{ width: "5%" }}>{row.sNo}</td>
        <td style={{ width: "15%" }}>{row.code}</td>
        <td style={{ width: "25%" }}>{row.description}</td>
        <td style={{ width: "10%" }}>{row.uom}</td>
        <td style={{ width: "10%" }}>
          <Amount value={parseFloat(row.rate).toFixed(2)} t={t} />
        </td>
        <td style={{ width: "15%" }}>
          <Amount value={parseFloat(row.totalM).toFixed(2)} t={t} />
        </td>
        <td style={{ width: "15%" }}>
          <Amount value={parseFloat(row.totalL).toFixed(2)} t={t} />
        </td>
        <td style={{ width: "15%" }}>
          <Amount value={parseFloat(row.totalMH).toFixed(2)} t={t} />
        </td>
      </tr>
    ));
  };

  return (
    <React.Fragment>
      <table className="table reports-table">
        <thead>{renderHeader()}</thead>
        <tbody>{renderBody()}</tbody>
      </table>
    </React.Fragment>
  );
};

export default GroupedTable;
