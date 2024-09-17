import { Table, CheckBox } from '@egovernments/digit-ui-react-components'
import React, { useEffect, useMemo, useState } from 'react'
import { useTranslation } from 'react-i18next'

const PaymentTrackerTable = ({excludeFailed, setExcludeFailed, ...props}) => {
  const { t } = useTranslation();

  const [tableRows, setTableRows] = useState(props?.tableRows);

  const tableColumns = useMemo(()=>{
    return [
      {
        Header: t("BILL_NUMBER"),
        accessor: "billNumber",
        Cell: ({ value, column, row }) => {
          return (
            <div style={{ color: "#F47738", cursor: "pointer" }} onClick={() => {}}>
              {String(t(value))}
            </div>
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
          return String(t(value));
        }
      },
      {
        Header: t("PI_NUMBER"),
        accessor: "pinumber",
        Cell: ({ value, column, row }) => {
          return (
            <div style={{ color: "#F47738", cursor: "pointer" }} onClick={() => {}}>
              {String(t(value))}
            </div>
          )
        }
      },
      {
        Header: t("PARENT_PI"),
        accessor: "parentpi",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
      {
        Header: t("PI_TYPE"),
        accessor: "pitype",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
      {
        Header: t("PI_CREATION_DATE"),
        accessor: "picreationdate",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
      {
        Header: t("PI_AMOUNT"),
        accessor: "paidAmount",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
      {
        Header: t("PI_DATE"),
        accessor: "pidate",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
      {
        Header: t("PI_STATUS"),
        accessor: "pistatus",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
    ]
  },[])

  useEffect(() => {
    if (excludeFailed) {
      setTableRows(props?.tableRows.filter(row => row.pistatus !== "Failed"));
    } else {
      setTableRows(props?.tableRows);
    }
  }, [excludeFailed])

  return (
    <div>
      <CheckBox 
        styles={{marginTop: "24px"}}
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