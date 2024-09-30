import React, { Fragment, useState, useEffect } from "react";
import { Loader } from "./Loader";
import CardSectionHeader from "./CardSectionHeader";
import { CheckPoint, ConnectingCheckPoints } from "./ConnectingCheckPoints";
import BreakLine from "./BreakLine";
import { useTranslation } from "react-i18next";
import TLCaption from "./TLCaption";
import { Card, Divider, TextBlock, TimelineMolecule, Timeline } from "@egovernments/digit-ui-components";
import Reason from "./Reason";
import TelePhone from "./TelePhone";
import DisplayPhotos from "./DisplayPhotos";
import UnMaskComponent from "./UnMaskComponent";

function OpenImage(imageSource, index, thumbnailsToShow) {
  window.open(thumbnailsToShow?.fullImage?.[0], "_blank");
}

const WorkflowTimeline = ({
  businessService,
  tenantId,
  applicationNo,
  timelineStatusPrefix = "WF_SERVICE_",
  statusAttribute = "status",
  config,
  ...props
}) => {
  const [additionalComment, setAdditionalComment] = useState(false);
  //for testing from url these 2 lines of code are kept here
  // const { estimateNumber } = Digit.Hooks.useQueryParams();
  // applicationNo = applicationNo? applicationNo : estimateNumber
  const { t } = useTranslation();

  const getTimelineCaptions = (checkpoint, index) => {
    let captionDetails = {
      name: "",
      date: "",
      mobileNumber: "",
      wfComment: "",
      additionalComment: "",
      thumbnailsToShow: "",
    };
    if (index === -1) {
      captionDetails.name = checkpoint?.assignes?.[0]?.name;
      captionDetails.date = "";
      captionDetails.mobileNumber = "";
      captionDetails.wfComment = "";
      captionDetails.additionalComment = "";
      captionDetails.thumbnailsToShow = "";
    } else {
      captionDetails.name = checkpoint?.assigner?.name;
      captionDetails.date = `${Digit.DateUtils?.ConvertTimestampToDate(
        checkpoint.auditDetails.lastModifiedEpoch
      )} ${Digit.DateUtils?.ConvertEpochToTimeInHours(checkpoint.auditDetails.lastModifiedEpoch)} ${Digit.DateUtils?.getDayfromTimeStamp(
        checkpoint.auditDetails.lastModifiedEpoch
      )}`;
      captionDetails.mobileNumber = checkpoint?.assigner?.mobileNumber;
      captionDetails.wfComment = checkpoint?.comment ? [checkpoint?.comment] : [];
      (captionDetails.additionalComment = additionalComment && checkpoint?.performedAction === "APPROVE"),
        (captionDetails.thumbnailsToShow = checkpoint?.thumbnailsToShow);
    }

    const caption = {
      date: captionDetails?.date,
      name: captionDetails?.name,
      mobileNumber: captionDetails?.mobileNumber,
      wfComment: captionDetails?.wfComment,
      additionalComment: captionDetails?.additionalComment,
      thumbnailsToShow: checkpoint?.thumbnailsToShow,
    };


    const data = caption;

    const elements = [
      data?.date && <p key="date">{data?.date}</p>,
      <p key="name">{data.name}</p>,
      data?.mobileNumber && (
        <span key="mobileNumber" style={{ display: "inline-flex", width: "fit-content"}}>
          <TelePhone mobile={data?.mobileNumber} />
          <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
          <UnMaskComponent privacy={{}} />
        </span>
      ),
      data?.source && <p key="source">{t("ES_APPLICATION_DETAILS_APPLICATION_CHANNEL_" + data.source.toUpperCase())}</p>,
      data?.comment && <Reason key="comment" otherComment={data?.otherComment} headComment={data?.comment} />,
      data?.additionalComment && (
        <Reason
          key="additionalComment"
          otherComment={data?.otherComment}
          headComment={data?.additionalComment}
          additionalComment={data?.additionalComment}
        />
      ),
      data?.wfComment.length > 0 ? (
        <div key="wfComment">
          {data?.wfComment?.map((e, index) => (
            <div key={index} className="TLComments text-wrap-overflow" style={{ backgroundColor: "unset" }}>
              <h3>{t("WF_COMMON_COMMENTS")}</h3>
              <p>{e}</p>
            </div>
          ))}
        </div>
      ) : null,
      data?.thumbnailsToShow?.thumbs?.length > 0 ? (
        <div key="thumbnailsToShow" className="TLComments">
          <h3>{t("CS_COMMON_ATTACHMENTS")}</h3>
          <DisplayPhotos
            srcs={data?.thumbnailsToShow.thumbs}
            onClick={(src, index) => {
              OpenImage(src, index, data?.thumbnailsToShow);
            }}
          />
        </div>
      ) : null,
    ];

    // return <TLCaption data={caption} OpenImage={OpenImage} />;
    return elements;
  };

  let workflowDetails = Digit.Hooks.useWorkflowDetailsWorks({
    tenantId: tenantId,
    id: applicationNo,
    moduleCode: businessService,
    config: {
      ...config,
      enabled: true,
      cacheTime: 0,
    },
  });

  useEffect(() => {
    if (
      workflowDetails?.data?.applicationBusinessService === "muster-roll-approval" &&
      workflowDetails?.data?.actionState?.applicationStatus === "APPROVED"
    ) {
      setAdditionalComment(true);
    }
  }, [workflowDetails]);


  return (
    <Fragment>
      {workflowDetails?.isLoading && <Loader />}
      {workflowDetails?.data?.timeline?.length > 0 && (
        <React.Fragment>
          {workflowDetails?.breakLineRequired === undefined && (props?.breakLineRequired || props?.breakLineRequired === undefined) ? (
            <BreakLine />
          ) : workflowDetails?.breakLineRequired ? (
            <BreakLine />
          ) : null}
          {!workflowDetails?.isLoading && (
            <Fragment>
              {/* <CardSectionHeader style={{ marginBottom: "16px", marginTop: "32px" }}>
                                {t("WORKS_WORKFLOW_TIMELINE")}
                            </CardSectionHeader> */}
              <TextBlock
                subHeaderClasName={`view-composer-subheader ${workflowDetails?.data?.timeline?.headerclassName}`}
                subHeader={t("WORKS_WORKFLOW_TIMELINE")}
              ></TextBlock>
              {/* {workflowDetails?.data?.timeline && 
                                <ConnectingCheckPoints>
                                    {workflowDetails?.data?.timeline &&
                                        workflowDetails?.data?.timeline.map((checkpoint, index, arr) => {
                                            return (
                                                <React.Fragment key={index}>
                                                    {
                                                        index === 0 && !checkpoint?.isTerminateState &&
                                                            <React.Fragment>
                                                                <CheckPoint
                                                                    keyValue={index}
                                                                    isCompleted={index === 0}
                                                                    label={t(
                                                                        Digit.Utils.locale.getTransformedLocale(`${timelineStatusPrefix}STATE_${checkpoint?.["state"]}`)
                                                                    )}
                                                                    // customChild={getTimelineCaptions(checkpoint, -1)}
                                                                    customClassName="checkpoint-connect-wrap"
                                                                />
                                                            </React.Fragment>
                                                    }   
                                                    <CheckPoint
                                                        keyValue={index}
                                                        isCompleted={checkpoint?.isTerminateState && index === 0}
                                                        label={t(
                                                            Digit.Utils.locale.getTransformedLocale(`${timelineStatusPrefix}STATUS_${checkpoint?.performedAction === "EDIT" ? `${checkpoint?.performedAction}` :   `${checkpoint?.performedAction}`
                                                            }`)
                                                        )}
                                                        customChild={getTimelineCaptions(checkpoint, index)}
                                                    />
                                                </React.Fragment>
                                            );  
                                        })}
                                </ConnectingCheckPoints>
                            } */}
              {/* {workflowDetails?.data?.timeline && (
                <TimelineMolecule>
                  <Timeline
                    key={0}
                    label={t(Digit.Utils.locale.getTransformedLocale(`${timelineStatusPrefix}STATE_${checkpoint?.["state"]}`))}
                    subElements={index === 0 && !checkpoint?.isTerminateState ? [] : getTimelineCaptions(checkpoint, index)}
                    variant={"inprogress"}
                    showConnector={true}
                  />
                </TimelineMolecule>
              )} */}

              {workflowDetails?.data?.timeline && (
                <TimelineMolecule initialVisibleCount={5} hideFutureLabel ={true} hidePastLabel ={workflowDetails?.data?.timeline.length < 5 ? true : false}>
                  {workflowDetails.data.timeline.map((checkpoint, index) => (
                    <Timeline
                      key={index}
                      label={
                        index === 0 && !checkpoint?.isTerminateState
                          ? t(Digit.Utils.locale.getTransformedLocale(`${timelineStatusPrefix}STATE_${checkpoint?.["state"]}`))
                          : t(
                              Digit.Utils.locale.getTransformedLocale(
                                `${timelineStatusPrefix}STATUS_${
                                  checkpoint?.performedAction === "EDIT" ? `${checkpoint?.performedAction}` : `${checkpoint?.performedAction}`
                                }`
                              )
                            )
                      }
                      subElements={index === 0 && !checkpoint?.isTerminateState ? [] : getTimelineCaptions(checkpoint, index)}
                      variant={
                        ((index === 0 && !checkpoint?.isTerminateState) || checkpoint?.variant === "inprogress")
                          ? "inprogress"
                          : ((checkpoint?.isTerminateState && index === 0) || (checkpoint?.variant === "inprogress"))
                          ? "inprogress"
                          : (checkpoint?.variant==="upcoming") ? "upcoming": "completed"
                      }
                      showConnector={true}
                    />
                  ))}
                </TimelineMolecule>
              )}
            </Fragment>
          )}
        </React.Fragment>
      )}
    </Fragment>
  );
};

export default WorkflowTimeline;