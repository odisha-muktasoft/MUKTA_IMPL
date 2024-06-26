import React, { useState,useEffect, useMemo } from "react";
import { useTranslation } from "react-i18next";
import { Header, Loader, Button, AddFilled, ActionBar, SubmitBar ,Toast, FilterFormField} from "@egovernments/digit-ui-react-components";
import { InboxSearchComposer } from "@egovernments/digit-ui-react-components";
import { useHistory, useLocation, Link } from "react-router-dom";
import searchSORConfig from "../../configs/searchSORConfig";

const SearchSOR = () => {
  const { t } = useTranslation();
  const history = useHistory();
  const tenantId = Digit.ULBService.getStateId();
  const currentDate = Digit.Utils.pt.convertDateToEpoch(Date.now());
  const sorseachresults = Digit.SessionStorage.get("RA_SCHEDULE_JOBS_REQUEST_DATA") || {};
  const [triggerApiCall, setTriggerApiCall] = useState(false);  
  const [showToast, setShowToast] = useState({show : false, label : "", error : false});
  const data = searchSORConfig?.SearchSORConfig?.[0];

  useEffect(() => {
    Digit.SessionStorage.set("RA_SCHEDULE_JOBS_REQUEST_DATA",{});
  }, []);

  let configs = data;


  const reqCriteria = {
    url: "/rate-analysis/v1/scheduler/_create",
    params: {
      tenantId: tenantId,
      limit: 10,
      offset: 0,
    },
    body: {
      apiOperation: "CREATE",
      Schedule: {
        tenantId: tenantId,
        effectiveFrom: currentDate,
        sorIds: sorseachresults?.sorIds,
      },
    },
    config: {
      enabled: triggerApiCall,
    },
  };


  const { isLoading, data: reviseratesdata ,revalidate} = Digit.Hooks.useCustomAPIHook(reqCriteria);

  const handleSchedulerCreate = () => {
    setTriggerApiCall(true);  
    revalidate();
  };

  useEffect(() => {
  }, [triggerApiCall]);

  useEffect(() => {
    if (reviseratesdata) {
      if (reviseratesdata.ResponseInfo.status === "successful") {
        const jobId = reviseratesdata.ScheduledJobs?.[0]?.jobId || "";
        setShowToast({ show: true, label: `Revision of rates is scheduled. JOB ID ${jobId}`, error: false });
      } else {
        setShowToast({ show: true, label: "Failed to revise rates", error: true });
      }
    }
  }, [reviseratesdata]);


  if (isLoading) {
    return <Loader />;
  }

  return (
    <React.Fragment>
      <div className="jk-header-btn-wrapper">
        <Header className="works-header-search">{t(configs?.label)}</Header>
        <Button
          label={t(configs?.actionLabel)}
          variation="secondary"
          onButtonClick={() => {
            history.push(`/${window?.contextPath}/employee/${configs?.actionLink}`);
          }}
          type="button"
        />
      </div>
      <div className="inbox-search-wrapper">
        <InboxSearchComposer configs={configs}></InboxSearchComposer>
      </div>
      <ActionBar>
          <SubmitBar label={t("RA_REVISE_RATE")} onSubmit={() => handleSchedulerCreate()} />
      </ActionBar>
      {showToast?.show && (
      <Toast  labelstyle={{width:"100%"}} error={showToast?.error} label={t(showToast?.label)} isDleteBtn={true} onClose={() => setShowToast({show : false, label : "", error : false})} />
      )}
    </React.Fragment>
  );
};

export default SearchSOR;
