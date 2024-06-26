import React, { useEffect, useCallback } from "react";
import { useTranslation } from "react-i18next";
import { Amount, Loader } from "@egovernments/digit-ui-react-components";

const ViewStatement = (props) => {
  const { data, isLoading, arrayProps, getData, getNestedData, config } = props;
  let nestedData = arrayProps?.fields || [];
  let type = arrayProps?.type || "W";
  const { t } = useTranslation();

  // Calculate the grand total
  
  const grandTotal = nestedData.reduce((total, row) => {
    return total + (parseFloat(row.estimatedAmount?.[type]) || 0);
  }, 0);

  /* need to pass the screenType 
     - TO render the column header
  */
  
  const renderHeader = () => {
    const columns = [
      { key: t("WORKS_SNO"), width: "5%" },
      { key: t("SOR Type/ Sub Type"), width: "12.5%" },
      { key: t("WORKS-SORS_COLUMN_CODE"), width: "12.5%" },
      { key: t("Description"), width: "30%" },
      { key: t("Uom"), width: "12.5%" },
      { key: t("Rate"), width: "12.5%" },
    ];

    if (config?.screenType === "UTILIZATION") {
      columns.push({ key: t("Consumed Quantity"), width: "12.5%" });
      columns.push({ key: t("Amount"), width: "12.5%" });
    } else {
      columns.push({ key: t("Estimated Quantity"), width: "12.5%" });
      columns.push({ key: t("Estimated Amount"), width: "12.5%" });
    }

    return columns.map((col, index) => (
      <th key={index} style={{ width: col.width }}>
        {col.key}
      </th>
    ));
  };

  const renderSubHeader = () => {
    const columns = [
      { key: t("WORKS_SNO"), width: "5%" },
      { key: t("WORKS-SORS_COLUMN_CODE"), width: "14.28%" },
      { key: t("Name"), width: "30%" },
      { key: t("Unit"), width: "14.28%" },
      { key: t("Rate"), width: "14.28%" },
      { key: t("Quantity"), width: "14.28%" },
      { key: t("Amount"), width: "14.28%" },
    ];
    return columns.map((col, index) => (
      <th key={index} style={{ width: col.width, padding: "10px", backgroundColor: "#A6A6A6" }}>
        {col.key}
      </th>
    ));
  };

  const renderSubBody = (subRows) => {
    return subRows.map((subRow, subIndex) => (
      <tr key={subIndex}>
        <td style={{ width: "5%" }}>{subRow.sNo}</td>
        <td style={{ width: "14.28%" }}>{subRow.code}</td>
        <td style={{ width: "30%" }}>{subRow.name}</td>
        <td style={{ width: "14.28%" }}>{subRow.unit}</td>
        <td style={{ width: "14.28%" }}>
          <Amount value={subRow.rate} t={t} />
        </td>
        <td style={{ width: "14.28%" }}>
          <Amount value={parseFloat(subRow.quantity).toFixed(2)} t={t} sameDisplay={true} roundOff={false} />
        </td>
        <td style={{ width: "14.28%" }}>
          <Amount value={parseFloat(subRow.amount).toFixed(2)} t={t} />
        </td>
      </tr>
    ));
  };

  const renderSubFooter = (subRows) => {
   
    const subTotal = subRows.reduce((total, subRow) => {
      return total + (parseFloat(subRow.amount) || 0);
    }, 0);
   
    return (
      <tr>
        <td colSpan={6} style={{ textAlign: "right", fontWeight: "400" }}>
          {t("Total")}:
        </td>
        <td style={{ textAlign: "right", fontWeight: "bold" }}>
          <Amount value={subTotal.toFixed(2)} t={t} />
        </td>
      </tr>
    );
  };

  const renderBody = () => {
    return nestedData
      .filter((ob) => (ob?.type ? ob?.type === type : true))
      .map((row, index) => {
        const subRows = row?.subrows?.filter((ob) => ob?.type === type) || [];
        return (
          <React.Fragment key={index}>
            <tr>
              <td style={{ width: "5%" }}>{row.sNo}</td>
              <td style={{ width: "12.5%", fontWeight: "500" }}>{row.sortype}</td>
              <td style={{ width: "12.5%" }}>{row.code}</td>
              <td style={{ width: "30%" }}>{row.description}</td>
              <td style={{ width: "12.5%", fontWeight: "500" }}>{row.uom}</td>
              <td style={{ width: "12.5%", fontWeight: "500" }}>
                <Amount value={parseFloat(row.rate).toFixed(2)} t={t} />
              </td>
              <td style={{ width: "12.5%", fontWeight: "500" }}>
                <Amount value={parseFloat(row.estimatedQuantity?.[type]).toFixed(2)} t={t} roundOff={false} sameDisplay={true} />
              </td>
              <td style={{ width: "12.5%", fontWeight: "500" }}>
                <Amount value={parseFloat(row.estimatedAmount?.[type]).toFixed(2)} t={t} />
              </td>
            </tr>
            {subRows.length > 0 && (
              <React.Fragment>
                <tr>
                  <td style={{ borderBottom: "none" }}></td>
                  <td colSpan={7} style={{ borderBottom: "none", paddingLeft: "20px" }}>
                    <strong>{t(`WORKS_${type}_TABLE_HEADER`)}</strong>
                  </td>
                </tr>
                <tr>
                  <td style={{ borderTop: "none" }}></td>
                  <td colSpan={7} style={{ borderTop: "none", paddingLeft: "20px", paddingRight: "60px" }}>
                    <table
                      className="table sub-table"
                      style={{ width: "100%", borderCollapse: "collapse", boxShadow: "none", borderLeftWidth: "0px", borderRightWidth: "0px" }}
                    >
                      <thead>
                        <tr>{renderSubHeader()}</tr>
                      </thead>
                      <tbody>{renderSubBody(subRows)}</tbody>
                      <tfoot>{renderSubFooter(subRows)}</tfoot>
                    </table>
                  </td>
                </tr>
              </React.Fragment>
            )}
          </React.Fragment>
        );
      });
  };

  return (
    <React.Fragment>
      <table className="table reports-table sub-work-table measurement-table-custom">
        <thead>
          <tr>{renderHeader()}</tr>
        </thead>
        <tbody>{renderBody()}</tbody>
        <tfoot>
          <tr>
            <td colSpan={7} style={{ textAlign: "right", fontWeight: "bold" }}>
              {t("Total")}:
            </td>
            <td style={{ textAlign: "right", fontWeight: "bold" }}>
              <Amount value={grandTotal.toFixed(2)} t={t} />
            </td>
          </tr>
        </tfoot>
      </table>
    </React.Fragment>
  );
};

export default ViewStatement;
