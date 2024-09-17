import { CardSectionHeader } from '@egovernments/digit-ui-react-components';
import React from 'react'
import { useTranslation } from 'react-i18next'

const ViewTotalPaymentAmount = (props) => {

  const { t } = useTranslation();

  const amount = props?.tableRows?.map(row => (props?.excludeFailed ? (row.pistatus === 'Failed' ? 0 : row.paidAmount) : row.paidAmount)).reduce((acc, curr) => acc + curr, 0);

  return (
    <div style={{ display: "flex", justifyContent: "flex-end", marginTop: "16px"}}>
        <CardSectionHeader style={{ marginRight: "2rem", marginTop: "1rem", fontWeight:"700" }}>{t("TOTAL")}</CardSectionHeader>
        <div style={{ display: "flex", flexDirection: 'row', justifyContent: "space-between", padding: "1rem", border: "1px solid #D6D5D4", borderRadius: "5px" }}>
            <CardSectionHeader style={{ fontSize:"24px", fontWeight:"700"}}>{`₹ ${Digit.Utils.dss.formatterWithoutRound(Math.round(parseFloat(amount)).toFixed(2),"number",undefined,true,undefined,2)}`}</CardSectionHeader>
        </div>
    </div>
  )
}

export default ViewTotalPaymentAmount