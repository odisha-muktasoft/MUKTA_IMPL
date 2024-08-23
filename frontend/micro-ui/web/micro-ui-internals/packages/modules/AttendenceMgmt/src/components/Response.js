import React, { Fragment } from "react";
import { Link, useLocation } from "react-router-dom";
import { useTranslation } from "react-i18next";
import { PanelCard, Button } from "@egovernments/digit-ui-components";

const Response = () => {
  const { t } = useTranslation();
  const { state } = useLocation();
  if (state?.performedAction === "APPROVE") {
    state.message = `${state?.message} ${t("BILL_CREATED")}`;
  }
  return (
    <>
      <PanelCard
        type={"success"}
        message={t(state?.header)}
        response={state?.id}
        info={state?.info}
        description={state?.message}
        footerChildren={[
          <Link to={`/${window.contextPath}/employee`}>
            <Button label={t("CORE_COMMON_GO_TO_HOME")} variation="primary" type="button" />
          </Link>
        ]}
        children={[state?.message]}
      />
    </>
  );
};

export default Response;
