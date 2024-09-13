import React from 'react'
import { Header, Loader, ViewComposer, MultiLink } from "@egovernments/digit-ui-react-components";
import { useTranslation } from 'react-i18next';
import { paymentTrackerViewConfig } from '../../configs/paymentTrackerViewConfig';

const PaymentTrackerView = () => {
  const {t} = useTranslation();
  const tenantId = Digit.ULBService.getCurrentTenantId();
  const {projectId} = Digit.Hooks.useQueryParams();

  // const requestCriteria = {
  //   url: "/mukta-mukta-services/measurement/_search",

  //   body: {
  //     contractNumber: workOrderNumber,
  //     tenantId: tenantId,
  //     measurementNumber: mbNumber,
  //     key: "View"
  //   },
  //   changeQueryName:mbNumber,
  // };

  // let { isLoading: isMeasurementLoading, data: allData } = Digit.Hooks.useCustomAPIHook(requestCriteria);
  let isLoading = false;

  const HandleDownloadPdf = () => {
    // Digit.Utils.downloadEgovPDF("measurementBook/measurement-book", { contractNumber : workOrderNumber, measurementNumber : mbNumber, tenantId }, `project-payments-${projectId}.pdf`);
  };

  const config = paymentTrackerViewConfig();

  if (isLoading && config != null) {
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