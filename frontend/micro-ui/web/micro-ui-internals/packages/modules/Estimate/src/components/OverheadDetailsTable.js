import { EditIcon, DownloadImgIcon, InfoBannerIcon, Modal, Row, StatusTable, Amount,CardSectionHeader } from "@egovernments/digit-ui-react-components";
import React, { useState, useCallback, useMemo } from "react";
import { useTranslation } from "react-i18next";
import { useHistory, Link } from "react-router-dom";
import { TextBlock } from "@egovernments/digit-ui-components";

const OverheadDetailsTable = ({ data }) => {
  const tableStyles = data?.tableStyles;
  const { rowStyle, cellStyle, tableStyle } = tableStyles;
  const { t } = useTranslation();
  const [showModal, setShowModal] = useState(null);
  const renderHeader = (headers) => {
    return headers?.map((key, index) => {
      return (
        <th key={index} style={cellStyle?.[index]}>
          {" "}
          {t(key)}{" "}
        </th>
      );
    });
  };
  const Heading = (props) => {
    return <h1 className="heading-m">{props.label}</h1>;
  };

  const Close = () => (
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#FFFFFF">
      <path d="M0 0h24v24H0V0z" fill="none" />
      <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z" />
    </svg>
  );

  const CloseBtn = (props) => {
    return (
      <div className="icon-bg-secondary" onClick={props.onClick}>
        <Close />
      </div>
    );
  };

  const renderRow = useCallback(
    (row, index) => {
      return (
        <tr style={rowStyle}>
          {row?.map((lineItem, idx) => {
            let extraStyles = {};
            if (lineItem === "Total") extraStyles = { fontWeight: "bold" };
            else if (lineItem?.type === "link")
              return (
                <td>
                  <div className="link">
                    <Link to={lineItem?.path}>{String(lineItem.label ? lineItem.label : t("ES_COMMON_NA"))}</Link>
                  </div>
                </td>
              );
            else if (lineItem?.type === "paymentStatus")
              return (
                <td>
                  <div class="tooltip">
                    <span class="textoverflow" style={{ display: "flex", ...lineItem?.styles, alignItems: "center" }}>
                      <p>{String(lineItem.value)}</p>
                      {lineItem?.hoverIcon && <InfoBannerIcon styles={{ "margin-left": "10px" }} fill={"#ff0000"} />}
                    </span>
                    {lineItem?.iconHoverTooltipText && (
                      <span class="tooltiptext" style={{ whiteSpace: "nowrap", ...lineItem?.toolTipStyles }}>
                        {lineItem?.iconHoverTooltipText}
                      </span>
                    )}
                  </div>
                </td>
              );
            else if (lineItem?.type === "modal") {
              return (
                <td>
                  <div className="link" onClick={() => setShowModal(lineItem)}>
                    {String(lineItem.label ? lineItem.label : t("ES_COMMON_NA"))}
                  </div>
                </td>
              );
            }
            return <td style={{ ...cellStyle?.[idx], ...extraStyles }}>{lineItem}</td>;
          })}
        </tr>
      );
    },
    [data, showModal]
  );

  const renderBody = (rows) => {
    return rows?.filter(innerArray => !(innerArray.includes("Total")))?.map((row, index) => {
      return renderRow(row, index);
    });
  };

  let totalAmount = data?.tableRows?.filter(innerArray => innerArray.includes("Total"))?.[0]?.[3] 
  totalAmount = totalAmount?.includes(",") ? parseFloat(totalAmount?.replace(/,/g, '')) : totalAmount;
  let formattedTotalAmount = isNaN(totalAmount) ? 0 : parseFloat(totalAmount)?.toFixed(2);
  return (
    <React.Fragment>
      <table className="table reports-table sub-work-table" style={tableStyle}>
        <thead>
          <tr>{renderHeader(data?.headers)}</tr>
        </thead>
        <tbody>{renderBody(data?.tableRows)}</tbody>
        {showModal && (
          <Modal
            headerBarMain={<Heading label={showModal?.infoCardDetails?.header} />}
            headerBarEnd={
              <CloseBtn
                onClick={() => {
                  setShowModal(null);
                }}
              />
            }
            hideSubmit={true}
            popupStyles={{ overflowY: "auto" }} //maxHeight: "calc(100% - 90px)"
            headerBarMainStyle={{ marginBottom: "0px" }}
            popupModuleMianStyles={{ paddingTop: "0px" }}
          >
            <StatusTable style={{ padding: "10px", paddingTop: "0px" }}>
              {showModal?.infoCardDetails?.values?.map((row, idx) => (
                <Row
                  className="border-none"
                  rowContainerStyle={{ margin: "0px" }}
                  labelStyle={{ width: "50%" }}
                  key={idx}
                  label={row?.title}
                  text={row?.value}
                ></Row>
              ))}
            </StatusTable>
          </Modal>
        )}
      </table>
      {/* <div style={{ display: "flex", flexDirection: "row", justifyContent: "flex-end", margin: "20px" }}>
     <div style={{ display: "flex", flexDirection: "row", fontSize: "16px" }}>
       <span style={{ fontWeight: "bold", marginTop:"6px" }}>
       {t("WORKS_TABLE_TOTAL_AMOUNT")} :
       </span>
       <span style={{ marginLeft: "8px" }}>
         <Amount customStyle={{ textAlign: "right", fontSize:"24px", fontWeight:"700" }} value={Digit.Utils.dss.formatterWithoutRound(formattedTotalAmount, "number", undefined, true, undefined, 2) || 0} sameDisplay={true} t={t} roundOff={false} rupeeSymbol={true}></Amount>
       </span>
     </div>
     </div> */}

      <div style={{ display: "flex", justifyContent: "flex-end", marginTop: "1.5rem", width: "100%" }}>
        <div
          className={"total_amount_wrapper"}
        >
          {/* <CardSectionHeader
            style={{ marginRight: "1rem", marginBottom: "0px", color: "#505A5F",width:"fit-content" }}
          >{`${t("WORKS_TABLE_TOTAL_AMOUNT")} :`}</CardSectionHeader> */}
          {/* <CardSectionHeader style={{ marginBottom: "0px",width:"fit-content" }}>
            {
              <Amount
                customStyle={{ textAlign: "right", fontSize: "24px", fontWeight: "700" }}
                value={Digit.Utils.dss.formatterWithoutRound(formattedTotalAmount, "number", undefined, true, undefined, 2) || 0}
                sameDisplay={true}
                t={t}
                roundOff={false}
                rupeeSymbol={true}
              ></Amount>
            }
          </CardSectionHeader> */}
          <TextBlock subHeader={`${t("WORKS_TABLE_TOTAL_AMOUNT")} :`} subHeaderClassName={"table_total_amount"}></TextBlock>
          <TextBlock
            subHeader={
              <Amount
                customStyle={{ textAlign: "right", fontSize: "24px", fontWeight: "700" }}
                value={Digit.Utils.dss.formatterWithoutRound(formattedTotalAmount, "number", undefined, true, undefined, 2) || 0}
                sameDisplay={true}
                t={t}
                roundOff={false}
                rupeeSymbol={true}
              ></Amount>
            }
            subHeaderClassName={"table_total_amount_value"}
          ></TextBlock>
        </div>
      </div>
    </React.Fragment>
  );
};

export default OverheadDetailsTable;
