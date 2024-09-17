import React from 'react'
import { Header, Loader, ViewComposer, MultiLink } from "@egovernments/digit-ui-react-components";
import { useTranslation } from 'react-i18next';
import { paymentTrackerViewConfig } from '../../configs/paymentTrackerViewConfig';

const PaymentTrackerView = () => {
  const {t} = useTranslation();
  const tenantId = Digit.ULBService.getCurrentTenantId();
  const { projectId } = Digit.Hooks.useQueryParams();

  const projectSearchCriteria = {
    url: `/project/v1/_search?limit=10&offset=0&tenantId=${tenantId}`,

    body: {
      Projects: [
        {
          tenantId: tenantId,
          projectNumber: projectId
        }
      ],
      apiOperation: "SEARCH"
    }
  }

  let { isLoading: isProjectLoading, data : projectData } = Digit.Hooks.useCustomAPIHook(projectSearchCriteria);
  
  const billSearchCriteria = {
    url: "/wms/report/payment_tracker",

    body: {
      "searchCriteria": {
        "tenantId": "pg.citya",
        "moduleSearchCriteria": {
          "ward": "string",
        },
        "limit": 10,
        "after_key": "PJ/2023-24/000172",
      }
    }
  };

  let { isLoading: isBillLoading, data : billData } = Digit.Hooks.useCustomAPIHook(billSearchCriteria);

  // billData = {
  //   "total": {
  //     "estimatedAmount": 0,
  //     "paymentDetails": [
  //       {
  //         "billType": "EXPENSE.PURCHASE",
  //         "total": 1412312,
  //         "paidAmount": 1410000,
  //         "remainingAmount": 2312
  //       }
  //     ]
  //   },
  //   "projects": [
  //     {
  //       "projectNumber": "PJ/2023-24/000169",
  //       "estimatedAmount": 2250000,
  //       "total": 2250000,
  //       "paymentDetails": [
  //         {
  //           billNumber: "123456",
  //           billType: "Wage Bill",
  //           total: 1000,
  //           pinumber: "123456",
  //           parentpi: "123456",
  //           pitype: "Water",
  //           picreationdate: "2021-01-01",
  //           paidAmount: 10000,
  //           pidate: "2021-01-01",
  //           pistatus: "Successful",
  //         },
  //         {
  //           billNumber: "786521",
  //           billType: "Purchase Bill",
  //           total: 2000,
  //           pinumber: "123456",
  //           parentpi: "123456",
  //           pitype: "Water",
  //           picreationdate: "2021-01-01",
  //           paidAmount: 10000,
  //           pidate: "2021-01-01",
  //           pistatus: "Partial",
  //         },
  //         {
  //           billNumber: "786521",
  //           billType: "Supervision Bill",
  //           total: 2000,
  //           pinumber: "123456",
  //           parentpi: "123456",
  //           pitype: "Water",
  //           picreationdate: "2021-01-01",
  //           paidAmount: 10000,
  //           pidate: "2021-01-01",
  //           pistatus: "Failed",
  //         },
  //         {
  //           "billType": "EXPENSE.PURCHASE",
  //           "total": 1412312,
  //           "paidAmount": 1410000,
  //           "remainingAmount": 2312
  //         },
  //       ]
  //     }
  //   ],
  //  "afterKey": "PJ/2023-24/000169"
  // }

  console.log("heyhey", projectData, billData);


  const HandleDownloadPdf = () => {
    // Digit.Utils.downloadEgovPDF("measurementBook/measurement-book", { contractNumber : workOrderNumber, measurementNumber : mbNumber, tenantId }, `project-payments-${projectId}.pdf`);
  };

  const config = paymentTrackerViewConfig(projectData?.Project[0], billData?.aggsResponse?.projects[0], projectId);

  if (isProjectLoading || isBillLoading) {
    return <Loader />;
  }

  console.log(config);
  return (
    <React.Fragment>
      <div className={"employee-application-details"} style={{ marginBottom: "15px" }}>
        <Header className="works-header-view" styles={{ marginLeft: "0px", paddingTop: "10px" }}>
          {t("PJ_PAYMENT_TRACKER")}
        </Header>
        <MultiLink onHeadClick={() => HandleDownloadPdf()} downloadBtnClassName={"employee-download-btn-className"} label={t("CS_COMMON_DOWNLOAD")} />
      </div>
      <ViewComposer data={config} isLoading={false} />
    </React.Fragment>
  );
};

export default PaymentTrackerView;