import React, { useEffect } from "react";
import { useTranslation } from "react-i18next";
import { PrivateRoute, BreadCrumb } from "@egovernments/digit-ui-react-components";
import { Switch, useLocation } from "react-router-dom";
import ViewRateAnalysis from "./ViewRateAnalysis";

const RateAnalysisBreadCumbs = ({ location }) => {
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
      path: `/${window.contextPath}/employee/contracts/create-time-extension-response`,
      content: fromScreen ? `${t(fromScreen)} / ${t("BREAD_TE_RESPONSE")}` : t("BREAD_TE_RESPONSE"),
      show: location.pathname.includes("/contracts/create-time-extension-response") ? true : false,
      isBack: fromScreen && true,
    },
  ];
  return <BreadCrumb crumbs={crumbs} spanStyle={{ maxWidth: "min-content" }} />;
};


const App = ({ path }) => {
    const location = useLocation();
    const AnalysisSession = Digit.Hooks.useSessionStorage("RATE_REATE", {});
    const [sessionFormData, setSessionFormData, clearSessionFormData] = AnalysisSession;
    const locationCheck = window.location.href.includes("/employee/ws/new-application");
    // const CreateWorkOrderComponent = Digit?.ComponentRegistryService?.getComponent("CreateWorkOrder");
    // const CreateWOResponseComponent = Digit?.ComponentRegistryService?.getComponent("CreateWOResponse");
    // const TimeExtensionResponse = Digit?.ComponentRegistryService?.getComponent("TimeExtensionResponse");
  
    const getBreadCrumbStyles = (screenType) => {
      // Defining 4 types for now -> create,view,inbox,search
  
      switch (true) {
        case screenType?.includes("/create"):
          return { marginLeft: "0px" };
  
        case screenType?.includes("/view"):
          return { marginLeft: "4px" };
  
        case screenType?.includes("/search"):
          return { marginLeft: "7px" };
        case screenType?.includes("/inbox") || screenType?.includes("/inbox"):
          return { marginLeft: "5px" };
  
        default:
          return { marginLeft: "8px" };
      }
    };
  
    useEffect(() => {
        if (!window.location.href.includes("create-contract") && sessionFormData && Object.keys(sessionFormData) != 0) {
          clearSessionFormData();
        }
    }, [location]);
  
    return (
      <Switch>
        <React.Fragment>
          <div className="ground-container">
            <div style={getBreadCrumbStyles(window.location.href)}>
              <RateAnalysisBreadCumbs location={location} />
            </div>
  
            <PrivateRoute path={`${path}/view-rate-analysis`} component={() => <ViewRateAnalysis />} />
  
           {/* <PrivateRoute path={`${path}/search-contract`} component={() => <SearchContractDetails />} />
            <PrivateRoute path={`${path}/contract-details`} component={() => <ViewContractDetails />} />
            <PrivateRoute path={`${path}/create-contract`} component={() => <CreateWorkOrderComponent parentRoute={path}/>} />
            <PrivateRoute path={`${path}/create-contract-response`} component={() => <CreateWOResponseComponent />} />
            <PrivateRoute path={`${path}/create-time-extension-response`} component={() => <TimeExtensionResponse />} />
            <PrivateRoute
              path={`${path}/inbox`}
              component={() => (
                <Inbox parentRoute={path} businessService="WORKS" filterComponent="contractInboxFilter" initialStates={{}} isInbox={true} />
              )}
            />
            */
        }
          </div>
        </React.Fragment>
      </Switch>
    );
  };
  
  export default App;