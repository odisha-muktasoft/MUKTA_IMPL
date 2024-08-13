import React, { useEffect, useState, Fragment } from "react";
import { Link, useHistory, useLocation } from "react-router-dom";
import { useTranslation } from "react-i18next";
import { Banner, Card, LinkLabel, AddFileFilled, ArrowLeftWhite, ActionBar } from "@egovernments/digit-ui-react-components";

import { PanelCard, SubmitBar } from "@egovernments/digit-ui-components";

const CreateProjectResponse = () => {
  const { t } = useTranslation();
  const history = useHistory();
  const queryStrings = Digit.Hooks.useQueryParams();
  const [projectIDsList, setProjectIDsList] = useState(queryStrings?.projectIDs.split(","));
  const loggedInUserRoles = Digit.Utils.getLoggedInUserDetails("roles");
  const [isEstimateCreator, setIsEstimateCreator] = useState(false);
  const [isResponseSuccess, setIsResponseSuccess] = useState(
    queryStrings?.isSuccess === "true" ? true : queryStrings?.isSuccess === "false" ? false : true
  );
  const { state } = useLocation();

  useEffect(() => {
    setIsEstimateCreator(loggedInUserRoles?.includes("ESTIMATE_CREATOR"));
  }, []);

  const navigate = (page) => {
    switch (page) {
      case "search-project": {
        history.push(`/${window.contextPath}/employee/project/search-project`);
        break;
      }
      case "create-estimate": {
        history.push(
          `/${window.contextPath}/employee/estimate/create-detailed-estimate?tenantId=${queryStrings?.tenantId}&projectNumber=${projectIDsList?.[0]}`
        );
        break;
      }
      case "home-screen": {
        history.push(`/${window.contextPath}/employee`);
        break;
      }
    }
  };

  // return (
  //     <Card>
  //         <Banner
  //             successful={isResponseSuccess}
  //             message={t(state?.message)}
  //             info={`${state?.showProjectID ? t("WORKS_PROJECT_ID") : ""}`}
  //             multipleResponseIDs={projectIDsList}
  //             whichSvg={`${isResponseSuccess ? "tick" : null}`}
  //         />
  // <div style={{display: "flex"}}>
  //     <LinkLabel style={{ display: "flex", marginRight : "3rem" }} onClick={()=>navigate('search-project')}>
  //         <ArrowLeftWhite  fill="#C84C0E" style={{marginRight: "8px", marginTop : "3px"}}/>{t("PROJECT_GO_TO_SEARCH_PROJECT")}
  //     </LinkLabel>
  //     {isResponseSuccess && isEstimateCreator && <LinkLabel style={{ display: "flex" }} onClick={()=>navigate('create-estimate')}>
  //         <AddFileFilled style={{marginRight: "8px", marginTop : "3px"}}/>{t("COMMON_CREATE_ESTIMATE")}
  //     </LinkLabel>  }
  // </div>
  //         <ActionBar>
  //             <Link to={`/${window.contextPath}/employee`}>
  //                 <SubmitBar label={t("CORE_COMMON_GO_TO_HOME")} />
  //             </Link>
  //         </ActionBar>
  //     </Card>
  // )

  const children = [
    <div style={{ display: "flex" }}>
      <LinkLabel style={{ display: "flex", marginRight: "3rem" }} onClick={() => navigate("search-project")}>
        <ArrowLeftWhite fill="#C84C0E" style={{ marginRight: "8px", marginTop: "3px" }} />
        {t("PROJECT_GO_TO_SEARCH_PROJECT")}
      </LinkLabel>
      {isResponseSuccess && isEstimateCreator && (
        <LinkLabel style={{ display: "flex" }} onClick={() => navigate("create-estimate")}>
          <AddFileFilled style={{ marginRight: "8px", marginTop: "3px" }} fill={"#C84C0E"} />
          {t("COMMON_CREATE_ESTIMATE")}
        </LinkLabel>
      )}
    </div>,
  ];

  const footerChildren = [
    <Link to={`/${window.contextPath}/employee`}>
      <SubmitBar label={t("CORE_COMMON_GO_TO_HOME")} />
    </Link>,
  ];
  return (
    <>
      <PanelCard
        type={isResponseSuccess ? "success" : "error"}
        message={t(state?.message)}
        multipleResponses={projectIDsList}
        info={`${state?.showProjectID ? t("WORKS_PROJECT_ID") : ""}`}
        footerChildren={footerChildren}
        children={children}
      />
    </>
  );
};

export default CreateProjectResponse;
