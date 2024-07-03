import React, { useEffect, useCallback, useState } from "react";
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
      { key: t("WORKS_SORS_COLUMN_TYPE"), width: "12.5%" },
      { key: t("WORKS-SORS_COLUMN_CODE"), width: "5.5%" },
      { key: t("WORKS-SORS_COLUMN_DESCRIPTION"), width: "35%" },
      { key: t("WORKS-SORS_COLUMN_UOM"), width: "8.5%" },
      { key: t("WORKS-SORS_COLUMN_RATE"), width: "12.5%" },
    ];

    if (config?.screenType === "UTILIZATION") {
      columns.push({ key: t("WORKS_SORS_COLUMN_CONSUMED_QTY"), width: "12.5%" });
      columns.push({ key: t("WORKS_SORS_COLUMN_CONSUMED_AMT"), width: "12.5%" });
    } else {
      columns.push({ key: t("WORKS_SORS_COLUMN_ESTIMATED_QTY"), width: "12.5%" });
      columns.push({ key: t("WORKS_SORS_COLUMN_ESTIMATED_AMT"), width: "12.5%" });
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
      { key: t("WORKS-SORS_COLUMN_CODE"), width: "5.28%" },
      { key: t("WORKS-SORS_SUB_COLUMN_NAME"), width: "40%" },
      { key: t("WORKS-SORS_SUB_COLUMN_UNIT"), width: "9.28%" },
      { key: t("WORKS-SORS_COLUMN_RATE"), width: "14.28%" },
      { key: t("WORKS-SORS_SUB_COLUMN_QTY"), width: "14.28%" },
      { key: t("WORKS-SORS_COLUMN_AMT"), width: "14.28%" },
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
        <td style={{ width: "5%" }}>{subIndex + 1}</td>
        <td style={{ width: "5.28%" }}>{subRow.code}</td>
        <td style={{ width: "30%" }}>{subRow.name}</td>
        <td style={{ width: "9.28%" }}>{subRow.unit}</td>
        <td style={{ width: "14.28%", textAlign: "right" }}>
          <div>
            {Digit.Utils.dss.formatterWithoutRound(
              parseFloat((subRow?.rate === undefined ? 0 : subRow?.rate).toFixed(2)),
              "number",
              undefined,
              true,
              undefined,
              2
            )}{" "}
          </div>
        </td>
        <td style={{ width: "14.28%", textAlign: "right" }}>
          <Amount value={parseFloat(subRow?.quantity === undefined ? 0 : subRow?.quantity).toFixed(4)} t={t} sameDisplay={true} roundOff={false} />
        </td>
        <td style={{ width: "14.28%", textAlign: "right" }}>
          <Amount
            value={Digit.Utils.dss.formatterWithoutRound(
              parseFloat(subRow?.amount === undefined ? 0 : subRow?.amount).toFixed(2),
              "number",
              undefined,
              true,
              undefined,
              2
            )}
            t={t}
            roundOff={false}
            sameDisplay={true}
          />
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
          {t("MB_ONLY_AMOUNT")}:
        </td>
        <td style={{ textAlign: "right", fontWeight: "bold" }}>
          <Amount
            value={Digit.Utils.dss.formatterWithoutRound(parseFloat(subTotal).toFixed(2), "number", undefined, true, undefined, 2)}
            t={t}
            roundOff={false}
            sameDisplay={true}
          />
        </td>
      </tr>
    );
  };
  let check = false;
  const renderBody = () => {
    return nestedData
      .filter((ob) => (ob?.type ? (ob?.type === "W" ? true : ob?.type === type) : true))
      .map((row, index) => {
        const subRows = row?.subrows?.filter((ob) => ob?.type === type) || [];

        check = true;
        return (
          <React.Fragment key={index}>
            <tr>
              <td style={{ width: "5%" }}>{row.sNo}</td>
              <td style={{ width: "12.5%", fontWeight: "500" }}>{`${t(`WORKS_SOR_TYPE_${row.sortype}`)} / ${t(
                `WORKS_SOR_SUBTYPE_${row?.sorSubType}`
              )}`}</td>
              <td style={{ width: "6.5%" }}>{row.code}</td>
              <td style={{ width: "35%" }}>{row.description}</td>
              <td style={{ width: "8.5%", fontWeight: "500" }}>{row.uom}</td>
              <td style={{ width: "12.5%", fontWeight: "500", textAlign: "right" }}>
                <Amount value={parseFloat(row.rate).toFixed(2)} t={t} roundOff={false} sameDisplay={true} />
              </td>
              <td style={{ width: "12.5%", fontWeight: "500", textAlign: "right" }}>
                <Amount value={parseFloat(row.estimatedQuantity?.[type]).toFixed(4)} t={t} roundOff={false} sameDisplay={true} />
              </td>
              <td style={{ width: "12.5%", fontWeight: "500", textAlign: "right" }}>
                <Amount value={parseFloat(row.estimatedAmount?.[type]).toFixed(2)} t={t} roundOff={false} sameDisplay={true} />
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
                      className=" sub-table"
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

            {subRows.length === 0 && row?.type === "W" && (
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
                      className=" sub-table"
                      style={{ width: "100%", borderCollapse: "collapse", boxShadow: "none", borderLeftWidth: "0px", borderRightWidth: "0px" }}
                    >
                      <thead>
                        <tr>{renderSubHeader()}</tr>
                      </thead>
                      <tbody>
                        {
                          <tr key={0}>
                            <td colSpan={8} style={{ marginLeft: "10px", color: "#9E9E9E", textAlign: "center" }}>
                              {t("STATEMENT_NO_DATA_PRESENT")}
                            </td>
                          </tr>
                        }
                      </tbody>
                    </table>
                  </td>
                </tr>
              </React.Fragment>
            )}

            {subRows.length === 0 && row?.type !== "W" && (
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
                      className=" sub-table"
                      style={{ width: "100%", borderCollapse: "collapse", boxShadow: "none", borderLeftWidth: "0px", borderRightWidth: "0px" }}
                    >
                      <thead>
                        <tr>{renderSubHeader()}</tr>
                      </thead>
                      <tbody>
                        {
                          <tr key={row.sNo}>
                            <td style={{ width: "5%" }}>{row.sNo}</td>
                            <td style={{ width: "5.28%" }}>{row.code}</td>
                            <td style={{ width: "30%" }}>{row.description}</td>
                            <td style={{ width: "9.28%" }}>{row.uom}</td>
                            <td style={{ width: "14.28%", textAlign: "right" }}>
                              <div>{parseFloat(row.rate).toFixed(2)} </div>
                            </td>
                            <td style={{ width: "14.28%", textAlign: "right" }}>
                              <Amount value={parseFloat(row.estimatedQuantity?.[type]).toFixed(4)} t={t} sameDisplay={true} roundOff={false} />
                            </td>
                            <td style={{ width: "14.28%", textAlign: "right" }}>
                              <Amount value={parseFloat(row.estimatedAmount?.[type]).toFixed(2)} t={t} roundOff={false} sameDisplay={true} />
                            </td>
                          </tr>
                        }
                          
                        <tr>
                          <td colSpan={6} style={{ textAlign: "right", fontWeight: "400" }}>
                            {t("MB_ONLY_AMOUNT")}:
                          </td>
                          <td style={{ textAlign: "right", fontWeight: "bold" }}>
                            <Amount value={parseFloat(row.estimatedAmount?.[type]).toFixed(2)} t={t} roundOff={false} sameDisplay={true} />
                          </td>
                        </tr>
                      
                      </tbody>
                     
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
      <table className=" reports-table sub-work-table measurement-table-custom">
        <thead>
          <tr>{renderHeader()}</tr>
        </thead>
        <tbody>{renderBody()}</tbody>
        <tfoot>
          {check ? (
            <tr>
              <td colSpan={7} style={{ textAlign: "right", fontWeight: "bold" }}>
                {config?.screenType === "UTILIZATION" ? t("UTILIZATION_STATEMENT_GRAND_TOTAL") : t("STATEMENT_GRAND_TOTAL")}:
              </td>
              <td style={{ textAlign: "right", fontWeight: "bold" }}>
                <Amount
                  value={Digit.Utils.dss.formatterWithoutRound(parseFloat(grandTotal).toFixed(2), "number", undefined, true, undefined, 2)}
                  t={t}
                  roundOff={false}
                  sameDisplay={true}
                />
              </td>
            </tr>
          ) : (
            <td colSpan={8} style={{ marginLeft: "10px", color: "#9E9E9E", textAlign: "center" }}>
              {t("STATEMENT_NO_DATA_PRESENT")}
            </td>
          )}
        </tfoot>
      </table>
    </React.Fragment>
  );
};

export default ViewStatement;
