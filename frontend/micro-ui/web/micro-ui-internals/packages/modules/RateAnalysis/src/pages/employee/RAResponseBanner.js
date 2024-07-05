import React from "react";
import { useTranslation } from "react-i18next";
import { Link } from "react-router-dom";
import { EditIcon, AddNewIcon, InboxIcon , ArrowRightInbox , CreateLoiIcon, CardText, ArrowLeftWhite } from "@egovernments/digit-ui-react-components";

import { useHistory } from "react-router-dom";

import { Banner, Card, ActionBar, SubmitBar } from "@egovernments/digit-ui-react-components"; // Import the Banner component you provided
const RAResponseBanner = () => {

    const { t } = useTranslation();
    const history = useHistory();

    // Get the current URL
    const currentURL = window.location.href;

    // console.log(currentURL);

    // Create a URL object from the current URL
    const url = new URL(currentURL);

    // Get the value of the "compositionId" query parameter
    const compositionId = url.searchParams.get('compositionId');
    const sorId = url.searchParams.get('sorId');
    const effectiveFrom = url.searchParams.get('fromeffective');
    const isUpdate = url.searchParams.get('isUpdate');

    // Now you can work with the response object as needed



    const goToHome = () => {
        history.push({
            pathname: `/${window?.contextPath}/employee`

        });
    };

    // Customize the message based on success or failure
    const message = true
        ? (isUpdate ? t("RA_SUCCESSFUL_UPDATE_MESSAGE") : t("RA_SUCCESSFUL_CREATE_MESSAGE"))
        : t("RA_ERROR_MESSAGE");

    return (
        <React.Fragment>
            <Card>
                <div>
                    <Banner
                        applicationNumber={compositionId}
                        successful={true}
                        message={message}
                        info={t("RA_REFERENCE_NUMBER")}
                        whichSvg={"tick"}
                            />
                </div>

                <div style={{ display: 'flex', gap: '25px' }}>

                    <div className="link reponse-link" >
                        <ArrowLeftWhite fill="#F47738" style={{ display:"inline",marginRight:"0.5rem",marginTop:"3px"}} /> 
                        <Link to={`/${window.contextPath}/workbench-ui/employee/workbench/mdms-search-v2?moduleName=WORKS-SOR&masterName=SOR`}>
                            {t("RA_GO_TO_SEARCH_SOR")}
                        </Link>
                    </div>

                    <div className="link reponse-link">
                        <AddNewIcon style={{ width: '24px', height: '24px' }} />
                        <Link to={`/${window.contextPath}/employee/rateAnalysis/view-rate-analysis?sorId=${sorId}&fromeffective=${effectiveFrom}`}>
                            {t("RA_VIEW_RATE_ANALYSIS")}
                        </Link>
                    </div>
                </div>

            </Card>

            <ActionBar>
                <SubmitBar label={t("RA_GO_HOME")} onSubmit={goToHome} />
            </ActionBar>
        </React.Fragment>

    );
};
export default RAResponseBanner;