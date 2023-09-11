import React from "react";
import { PrivateRoute, BreadCrumb } from "@egovernments/digit-ui-react-components";
import { useTranslation } from "react-i18next";
import { Switch, useLocation } from "react-router-dom";
import FundAllocationRegister from "./FundAllocationRegister";

const App = ({ path }) => {

  const MastersBreadCrumb = ({ location }) => {
    const { t } = useTranslation();
    const search = useLocation().search;
    const fromScreen = new URLSearchParams(search).get("from") || null;
    const crumbs = [
      {
          path: `/${window?.contextPath}/employee`,
          content: t("WORKS_MUKTA"),
          show: true,
      },
      {
        path: `/${window.contextPath}/employee/mukta/fund-allocation-register`,
        content: fromScreen ? `${t(fromScreen)} / ${t("MUTKA_FUND_ALLOCATION_REGISTER")}` : t("MUTKA_FUND_ALLOCATION_REGISTER"),
        show: location.pathname.includes("/mukta/fund-allocation-register") ? true : false,
        isBack: fromScreen && true,
      },
    ];
    return <BreadCrumb crumbs={crumbs} spanStyle={{ maxWidth: "min-content" }} />;
  };


  return (
    <Switch>
      <React.Fragment>
        <MastersBreadCrumb location={location} />
        <div>
          <PrivateRoute path={`${path}/sample`} component={() => <div>Sample Screen loaded</div>} />
          <PrivateRoute path={`${path}/fund-allocation-register`} component={() => <FundAllocationRegister />} />
        </div>
      </React.Fragment>
    </Switch>
  );
};

export default App;
