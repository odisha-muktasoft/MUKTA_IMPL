import { Table, ArrowDown } from '@egovernments/digit-ui-react-components'
import React, { useMemo } from 'react'
import { useTranslation } from 'react-i18next'

const PaymentTrackerTable = (props) => {
  const { t } = useTranslation();

  const tableColumns = useMemo(()=>{
    return [
      {
        Header: t("BILL_NUMBER"),
        accessor: "number",
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
        accessor: "type",
        Cell: ({ value, column, row }) => {
          return String(t(value));
        }
      },
      {
        Header: t("BILL_AMOUNT"),
        accessor: "amount",
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
        accessor: "piamount",
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

  return (
    <div>
      <p>Exclude failed payment instructions</p>
      <div style={{marginTop: "1rem", border: "1px solid #D6D5D4",  borderRadius: "2px" }}>
        <Table
          t={t}
          data={props.tableRows}
          totalRecords={props.tableRows.length}
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