import React,{Fragment} from "react";
import { Link, useLocation } from "react-router-dom";
import { useTranslation } from "react-i18next";
import { ActionBar, Banner, Card, CardText } from "@egovernments/digit-ui-react-components";
import { PanelCard, SubmitBar } from "@egovernments/digit-ui-components";

const Response = () => {
  const { t } = useTranslation();
  const { state } = useLocation();
  if (state?.performedAction === "APPROVE") {
    state.message = `${state?.message} ${t("BILL_CREATED")}`;
  }
  return (
    // <Card>
    //     <Banner
    //         successful={true}
    //         message={state?.header}
    //         info={state?.info}
    //         applicationNumber={state?.id}
    //         whichSvg={"tick"}
    //     />

    //     <CardText>{state?.message}</CardText>

    // <ActionBar>
    //     <Link to={`/${window.contextPath}/employee`}>
    //         <SubmitBar label={t("CORE_COMMON_GO_TO_HOME")} />
    //     </Link>
    // </ActionBar>
    // </Card>

    <>
      <PanelCard
        type={"success"}
        message={t(state?.header)}
        applicationNumber={state?.id}
        info={state?.info}
        footerChildren={[
          <ActionBar>
            <Link to={`/${window.contextPath}/employee`}>
              <SubmitBar label={t("CORE_COMMON_GO_TO_HOME")} />
            </Link>
          </ActionBar>,
        ]}
        children={[state?.message]}
      />
    </>
  );
};

export default Response;
