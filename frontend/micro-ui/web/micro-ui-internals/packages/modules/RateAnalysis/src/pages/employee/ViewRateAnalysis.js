import { Header, ActionBar, SubmitBar, Menu, Card, Loader, ViewComposer, MultiLink } from "@egovernments/digit-ui-react-components";
import React, { useState, useEffect } from "react";
import { useTranslation } from "react-i18next";
import { useHistory } from "react-router-dom";

import { viewRateAnalysisdataconfig } from "../../configs/viewRateAnalysisConfig";

const ViewRateAnalysis = () => {
  const { t } = useTranslation();
  const history = useHistory();
  const tenantId = Digit.ULBService.getCurrentTenantId();

  const userInfo = Digit.UserService.getUser();
  const userRoles = userInfo?.info?.roles?.map((roleData) => roleData?.code);

  const queryStrings = Digit.Hooks.useQueryParams();

  let dataPaylod = {
    sorDetails: {
      tenantId: tenantId,
      sorCodes: [`${queryStrings?.sorId}`],
      effectiveFrom: `${queryStrings.fromeffective}`,
    },
  };

  let { isLoading, isError, data: applicationDetails, error } = Digit.Hooks.rateAnalysis.useViewRateAnalysisDetails(tenantId, dataPaylod);

  //

  let config = null;
  useEffect(() => {}, [tenantId, isLoading, applicationDetails, queryStrings]);

  // console.log(queryStrings?.sorid)
  const redirectToCreateBill = (contractType) => {
    if (userRoles.includes("MDMS_STATE_ADMIN") === true) {
      if (contractType === "CREATE_EDIT_RATE_ANALYSIS") {
        history.push(
          `/${window?.contextPath}/employee/rateanalysis/update-rate-analysis?compositionid=${applicationDetails?.rateAnalysisDetail.compositionId}&sorid=${queryStrings?.sorId}`
        );
      }
    } else if (userRoles.includes("MDMS_CITY_ADMIN") === true) {
      if (contractType === "CREATE_EDIT_RATE_ANALYSIS") {
        //TODO:[need to add revise rate screen path]
        // history.push(
        //   `/${window?.contextPath}/employee/rateanalysis/update-rate-analysis?compositionid=${applicationDetails?.rateAnalysisDetail.compositionId}&sorid=${queryStrings?.sorId}`
        // );
      }
    }
    //rateanalysis/update-rate-analysis?compositionid=CMP_000017&sorid=SOR_000005
  };
  const [displayMenu, setDisplayMenu] = useState(false);
  const actionULB = [];

  if (userRoles.includes("MDMS_STATE_ADMIN") === true) {
    actionULB.push({
      code: "CREATE_EDIT_RATE_ANALYSIS",
      name: t("CREATE_EDIT_RATE_ANALYSIS"),
    });
  } else if (userRoles.includes("MDMS_CITY_ADMIN") === true) {
    actionULB.push({
      code: "REVISE_RATE_ANALYSIS",
      name: t("REVISE_RATE_ANALYSIS"),
    });
  }

  function onActionSelect(action) {
    if (action?.code === "CREATE_EDIT_RATE_ANALYSIS") {
      redirectToCreateBill("CREATE_EDIT_RATE_ANALYSIS");
    }
    if (action?.code === "REVISE_RATE_ANALYSIS") {
      redirectToCreateBill("REVISE_RATE_ANALYSIS");
    }
  }

  config = viewRateAnalysisdataconfig(
    applicationDetails?.groupedByHead,
    applicationDetails?.rateAnalysisDetail,
    queryStrings?.sorId,
    t,
    applicationDetails?.infoCard
  );

  if (isLoading) {
    return <Loader />;
  }

  return (
    <React.Fragment>
      {
        <div className={"employee-application-details"} style={{ marginBottom: "15px" }}>
          {
            <Header className="works-header-view" styles={{ marginLeft: "0px", paddingTop: "10px" }}>
              {t("RA_VIEW_RATE_HEADER")}
            </Header>
          }
        </div>
      }
      <ViewComposer data={config} isLoading={false} />
      <ActionBar>
        {displayMenu ? <Menu localeKeyPrefix={"WORKS"} options={actionULB} optionKey={"name"} t={t} onSelect={onActionSelect} /> : null}
        <SubmitBar label={t("ACTIONS")} onSubmit={() => setDisplayMenu(!displayMenu)} />
      </ActionBar>
    </React.Fragment>
  );
};

export default ViewRateAnalysis;
