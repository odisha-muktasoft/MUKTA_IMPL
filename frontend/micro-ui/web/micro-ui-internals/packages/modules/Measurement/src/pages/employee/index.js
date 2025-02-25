import React, { useEffect } from "react";
import { useTranslation } from "react-i18next";
import { PrivateRoute, AppContainer } from "@egovernments/digit-ui-react-components";
import { BreadCrumb } from "@egovernments/digit-ui-components";
import { Switch, useLocation } from "react-router-dom";
import ViewMeasurement from "./ViewMeasurement";
import SearchMeasurement from "./SearchMeasurement";
import InboxMeasurement from "./InboxMeasurement";
import CreateMeasurement from "./CreateMeasurement";
import SearchPlain from "./SearchPlain";

import ResponseBanner from "./ResponseBanner";
import UpdateMeasurement from "./UpdateMeasurement";
import ViewUtilization from "./viewUtilization";

const MeasurementBreadCrumbs = ({ location }) => {
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
      path: `/${window.contextPath}/employee/measurement/search`,
      content: t("MB_SEARCH_MEASUREMENT"),
      show: location.pathname.includes("/measurement/search") ? true : false,
      isBack: fromScreen && true,
    },
    {
      path: `/${window.contextPath}/employee/measurement/create`,
      content: fromScreen ? `${t(fromScreen)} / ${t("MB_MEASUREMENT_BOOK")}` : t("MB_MEASUREMENT_BOOK"),
      show: location.pathname.includes("/measurement/create") ? true : false,
      isBack: fromScreen && true,
    },
    {
      path: `/${window.contextPath}/employee/measurement/inbox`,
      content: fromScreen ? `${t(fromScreen)} / ${t("MB_INBOX")}` : t("MB_INBOX"),
      show: location.pathname.includes("/measurement/inbox") ? true : false,
      isBack: fromScreen && true,
    },
    {
      path: `/${window.contextPath}/employee/measurement/update`,
      content: fromScreen ? `${t(fromScreen)} / ${t("MB_MEASUREMENT_BOOK")}` : t("MB_MEASUREMENT_BOOK"),
      show: location.pathname.includes("/measurement/update") ? true : false,
      isBack: fromScreen && true,
    },
    {
      path: `/${window.contextPath}/employee/measurement/view`,
      content: fromScreen ? `${t(fromScreen)} / ${t("MB_VIEW_MEASUREMENT_BOOK")}` : t("MB_VIEW_MEASUREMENT_BOOK"),
      show: location.pathname.includes("/measurement/view") ? true : false,
      isBack: fromScreen && true,
    },
    {
      path: `/${window.contextPath}/employee/measurement/utilizationstatement`,
      content: fromScreen ? `${t(fromScreen)} / ${t("MB_VIEW_UTLIZATION")}` : t("MB_VIEW_UTLIZATION"),
      show: location.pathname.includes("/measurement/utilizationstatement") ? true : false,
      isBack: fromScreen && true,
    },
  ];
  return <BreadCrumb crumbs={crumbs} />;
};

const App = ({ path }) => {
  const location = useLocation();
  return (
    <Switch>
      <AppContainer 
      >
        {!location.pathname.includes("/response") && (
          <React.Fragment>
            <MeasurementBreadCrumbs location={location} />
          </React.Fragment>
        )}
        <PrivateRoute path={`${path}/create`} component={() => <CreateMeasurement {...{ path }} />} />
        <PrivateRoute path={`${path}/search`} component={() => <SearchMeasurement {...{ path }} />} />
        <PrivateRoute path={`${path}/inbox`} component={() => <InboxMeasurement {...{ path }} />} />
        <PrivateRoute path={`${path}/view`} component={() => <ViewMeasurement {...{ path }} />} />
        <PrivateRoute path={`${path}/response`} component={() => <ResponseBanner {...{ path }} />} />
        <PrivateRoute path={`${path}/searchplain`} component={() => <SearchPlain {...{ path }} />} />
        <PrivateRoute path={`${path}/update`} component={() => <UpdateMeasurement {...{ path }} />} />
        <PrivateRoute path={`${path}/utilizationstatement`} component={() => <ViewUtilization {...{ path }} />} />
      </AppContainer>
    </Switch>
  );
};

export default App;