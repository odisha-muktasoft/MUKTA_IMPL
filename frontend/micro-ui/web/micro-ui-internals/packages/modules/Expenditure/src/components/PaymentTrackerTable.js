import { Table, CheckBox, LinkLabel } from '@egovernments/digit-ui-react-components'
import React, { useEffect, useMemo, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { useHistory } from "react-router-dom";

const PaymentTrackerTable = ({excludeFailed, setExcludeFailed, ...props}) => {
  const { t } = useTranslation();
  const tenantId = Digit.ULBService.getCurrentTenantId();
  const history = useHistory();

  const [tableRows, setTableRows] = useState(props?.tableRows);

  const amountFormatter = (amount) => {
    return Digit.Utils.dss.formatterWithoutRound(Math.round(parseFloat(amount)).toFixed(2),"number",undefined,true,undefined,2);
  }
  
  const tableColumns = useMemo(()=>{
    return [
      {
        Header: t("BILL_NUMBER"),
        accessor: "billNumber",
        Cell: ({ value, column, row }) => {
          return (
            <LinkLabel onClick={() => history.push(`/${window.contextPath}/employee/expenditure/purchase-bill-details?tenantId=${tenantId}&billNumber=${value}&workOrderNumber=${row.original.workOrderNumber}`)}>{String(t(value))}</LinkLabel>
          )
        }
      },
      {
        Header: t("BILL_TYPE"),
        accessor: "billType",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
      {
        Header: t("BILL_AMOUNT"),
        accessor: "total",
        Cell: ({ value, column, row }) => {
          return amountFormatter(value);
        }
      },
      {
        Header: t("PI_NUMBER"),
        accessor: "piNumber",
        Cell: ({ value, column, row }) => {
          if (value === "NA") {
            return String(t("NA"));
          }
          return (
            <LinkLabel onClick={() => history.push(`/${window.contextPath}/employee/expenditure/view-payment?tenantId=${tenantId}&paymentNumber=${row.original.paymentNumber}`)}>{String(t(value))}</LinkLabel>
          )
        }
      },
      {
        Header: t("PARENT_PI"),
        accessor: "parentPi",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
      {
        Header: t("PI_TYPE"),
        accessor: "piType",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
      {
        Header: t("PI_CREATION_DATE"),
        accessor: "piCreationDate",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
      {
        Header: t("PI_AMOUNT"),
        accessor: "paidAmount",
        Cell: ({ value, column, row }) => {
          return amountFormatter(value);
        }
      },
      {
        Header: t("PI_DATE"),
        accessor: "piDate",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
      {
        Header: t("PI_STATUS"),
        accessor: "piStatus",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
    ]
  },[])

  useEffect(() => {
    if (excludeFailed) {
      setTableRows(props?.tableRows.filter(row => row.piStatus !== "FAILED"));
    } else {
      setTableRows(props?.tableRows);
    }
  }, [excludeFailed])

  return (
    <div>
      <CheckBox 
        styles={{marginTop: "24px"}}
        style={{marginLeft: "40px"}}
        onChange={() => setExcludeFailed(!excludeFailed)}
        checked={excludeFailed}
        label={t("EXCLUDE_FAILED_PAYMENT_INSTRUCTIONS")}
      />
      <div style={{marginTop: "0rem", border: "1px solid #D6D5D4",  borderRadius: "2px" }}>
        <Table
          customTableWrapperClassName={"dss-table-wrapper"}
          t={t}
          data={tableRows}
          // totalRecords={tableRows.length}
          columns={tableColumns}
          manualPagination={false}
          isPaginationRequired={false}
          getCellProps={(cellInfo) => {
            return {
              style: {
                padding: "20px 18px",
                // fontSize: "16px",
              },
            };
          }}
        />
      </div>
    </div>
  )
}

export default PaymentTrackerTable