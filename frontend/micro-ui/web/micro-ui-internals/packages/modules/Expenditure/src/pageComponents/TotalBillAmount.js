import { CardSectionHeader } from "@egovernments/digit-ui-react-components";
import { TextBlock } from "@egovernments/digit-ui-components";
import React, { useEffect, useMemo } from "react";
import { useTranslation } from "react-i18next";

const TotalBillAmount = ({ formData, setValue, ...props }) => {
  const { t } = useTranslation();
  const formFieldNameDeductions = "deductionDetails";
  const formFieldNameBillAmount = "billDetails_billAmt";

  let getTotalAmount = useMemo(() => {
    let totalBillAmount = Digit.Utils.dss.convertFormatterToNumber(formData?.[formFieldNameBillAmount]);
    totalBillAmount = totalBillAmount ? totalBillAmount : 0;
    let totalDeductions = formData?.[formFieldNameDeductions]?.reduce((acc, row) => {
      let amountDeductions = parseFloat(row?.amount);
      amountDeductions = amountDeductions ? amountDeductions : 0;
      return amountDeductions + parseFloat(acc);
    }, 0);
    totalDeductions = totalDeductions ? totalDeductions : 0;
    return totalBillAmount - totalDeductions;
  }, [formData]);

  useEffect(() => {
    setValue("totalBillAmount", getTotalAmount);
  }, [getTotalAmount]);

  return (
    <div style={{ display: "flex", justifyContent: "flex-end", ...props?.containerStyles }}>
      <div
        style={{
          display: "flex",
          flexDirection: "row",
          justifyContent: "space-between",
          padding: "1rem",
          border: "1px solid #D6D5D4",
          borderRadius: "4px",
        }}
      >
        {/* <CardSectionHeader style={{ marginRight: "1rem", marginBottom: "0px", color: "#505A5F" }}>
          {t("EXP_NET_PAYABLE")}
        </CardSectionHeader> */}
        <TextBlock subHeader={t("EXP_NET_PAYABLE")} subHeaderClasName={"net-payable-classname"}></TextBlock>
        <CardSectionHeader
          style={{ marginBottom: "0px", fontFamily: "Roboto", fontSize: "28px", fontWeight: 700, lineHeight: "32.81px", textAlign: "left" }}
        >{`₹ ${Digit.Utils.dss.formatterWithoutRound(getTotalAmount, "number")}`}</CardSectionHeader>
      </div>
    </div>
  );
};

export default TotalBillAmount;
