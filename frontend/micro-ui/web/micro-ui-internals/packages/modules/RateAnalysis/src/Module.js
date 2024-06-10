import { Loader } from "@egovernments/digit-ui-react-components";
import React from "react";
import { useRouteMatch } from "react-router-dom";
import EmployeeApp from "./pages/employee";
// import MeasurementCard from "./components/MeasurementCard";
// import MeasureTable from "./components/MeasureTable";
// import MeasureCard from "./components/MeasureCard";
// import MeasureRow from "./components/MeasureRow";
// import ViewOnlyCard from "./components/ViewOnlyCard";
// import MeasurementHistory from "./components/MBHistoryTable";

import ViewRateAnalysis from "./pages/employee/ViewRateAnalysis";
import CreateRateAnalysis from "./pages/employee/CreateRateAnalysis";
import SORDetailsTemplate from "./components/SORDetailsTemplate";
import searchSor from "../../Estimate/src/pageComponents/searchSor";
import ExtraCharges from "./components/ExtraCharges";
import RateAmountGroup from "./components/rateAmountGroup";
import RateCardWithRightButton from "./components/ratecardbutton";
import TableWithOutHead from "./components/specficAmountTable";
import ViewTotalAmount from "./components/viewTotalAmount";
import WrapperSORDetailsTemplate from "./components/sor_wrapper";
import ExtraChargesViewTable from "./components/extra_charges_view_table";
import RAResponseBanner from "./pages/employee/RAResponseBanner";

const RateAnalysisModule = ({ stateCode, userType, tenants }) => {
  const { path, url } = useRouteMatch();
  const language = Digit.StoreData.getCurrentLanguage();
  const tenantId = Digit.ULBService.getCurrentTenantId();
  const moduleCode = ["rateanalysis", "common-masters", "workflow", tenantId];
  const { isLoading, data: store } = Digit.Services.useStore({
    stateCode,
    moduleCode,
    language,
  });

  if (isLoading) {
    return <Loader />;
  }

  return <EmployeeApp path={path} stateCode={stateCode} />;
};

const componentsToRegister = {
  // MeasurementCard,
  // MeasurementModule,
  // MeasureCard,
  // MeasureTable,
  // MeasureRow,
  // ViewOnlyCard,
  // MeasurementHistory
  ViewRateAnalysis,
  RateAnalysisModule,
  CreateRateAnalysis,
  SORDetailsTemplate,
  searchSor,
  ExtraCharges,
  RateAmountGroup,
  RateCardWithRightButton,
  TableWithOutHead,
  ViewTotalAmount,
  WrapperSORDetailsTemplate,
  ExtraChargesViewTable,
  RAResponseBanner
};

export const initRateAnalysisComponents = () => {
  Object.entries(componentsToRegister).forEach(([key, value]) => {
    Digit.ComponentRegistryService.setComponent(key, value);
  });
};
