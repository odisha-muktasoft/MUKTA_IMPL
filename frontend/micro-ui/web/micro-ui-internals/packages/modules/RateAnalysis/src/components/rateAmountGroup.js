import { Card, Header, Button, Loader, Row, StatusTable, LinkButton } from "@egovernments/digit-ui-react-components";
import React, { Fragment, useState, useEffect } from "react";
import { useTranslation } from "react-i18next";
import ViewTotalEstAmount from "../../../Estimate/src/components/ViewTotalEstAmount";

const RateAmountGroup = (props) => {
  const { t } = useTranslation();
  const tenantId = Digit.ULBService.getCurrentTenantId();
  const [existingData, setExistingData] = useState(0.0);

  const {
    mode,
    detail: { newValue, sorId },
  } = props;

 

    const requestCriteria = {
      url: "/mdms-v2/v2/_search",
      body: {
        MdmsCriteria: {
          tenantId: tenantId,
          filters: 
            {
             sorId:sorId
            },
            schemaCode:"WORKS-SOR.Rates",
            limit:100,
            offset:0,
          
        },
      },
      changeQueryName: "ratesQuery",
    };

  // const requestCriteria = {
  //   url: "/mdms-v2/v2/_search",
  //   body: {
  //     MdmsCriteria: {
  //       tenantId: tenantId,
  //       moduleDetails: [
  //         {
  //           moduleName: "WORKS-SOR",
  //           masterDetails: [
  //             {
  //               name: "Rates",
  //               filter: `[?(@.sorId=='${sorId}')]`,
  //             },
  //           ],
  //         },
  //       ],
  //     },
  //   },
  //   changeQueryName: "ratesQuery",
  // };

  const { isLoading, data: RatesData } = Digit.Hooks.useCustomAPIHook(requestCriteria);
  useEffect(() => {
    
    //setExistingData(RatesData?.MdmsRes?.["WORKS-SOR"]?.Rates[0]?.rate===undefined?0.0:RatesData?.MdmsRes?.["WORKS-SOR"]?.Rates[0]?.rate);
    setExistingData(RatesData?.mdms.length!==0?
      RatesData?.mdms[0].data?.rate===undefined?0.0:RatesData?.mdms[0].data?.rate:0.0);
   // console.log(RatesData?.mdms[0].data?.rate,"wel");
  }, [RatesData]);

  return (
    <React.Fragment>
      <div
        className="flex"
        style={{
          display: "flex",
          flexDirection: "row",
          width: "100%",
          justifyContent: "flex-end",
          paddingRight: "2%",
          alignItems: "center",
          marginTop: "-30px",
        }}
      >
        <div style={{ paddingRight: "1%" }}>
          <ViewTotalEstAmount mode={"VIEW"} detail={{ showTitle: "RA_EXISTING_RATE", value: existingData }} />
        </div>
        <div style={{ paddingLeft: "1%" }}>
          <ViewTotalEstAmount mode={"VIEW"} detail={{ showTitle: "RA_NEW_RATE", value: newValue }} />
        </div>
      </div>
    </React.Fragment>
  );
};

export default RateAmountGroup;
