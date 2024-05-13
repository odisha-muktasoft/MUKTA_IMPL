import React, { useEffect, useState, useMemo } from "react";
import { useTranslation } from "react-i18next";
import { Header, Card, Loader, ViewComposer, MultiLink, HorizontalNav,CardSectionHeader } from "@egovernments/digit-ui-react-components";
import { useHistory, useLocation } from "react-router-dom";
import MeasureTable from "../../components/MeasureTable";
import { viewUtilData,viewUtilSecondData ,viewUtilHeaderData} from "../../configs/viewUtilConfig";
import ViewUtilTable from "../../components/ViewUtilTable";

const ViewUtilization = () => {
  // const { t } = useTranslation();
  // const history = useHistory()
  // const location = useLocation()

  // return (
  //   <React.Fragment>
  //     <div className="jk-header-btn-wrapper"></div>
  //     <div className="inbox-search-wrapper">ViewUtilization</div>
  //   </React.Fragment>
  // );
  debugger;
  const [activeLink, setActiveLink] = useState("Material");
  const { t } = useTranslation();
  const tenantId = Digit.ULBService.getCurrentTenantId();
  const { workOrderNumber, mbNumber } = Digit.Hooks.useQueryParams();
  const [thumbnails, setThumbnails] = useState("");
  const configNavItems = [
    {
      name: "Material",
      code: "WORKS_SOR_TYPE_M",
      active: true,
    },
    {
      name: "Labour",
      code: "WORKS_SOR_TYPE_L",
      active: true,
    },
    {
      name: "Machinery",
      code: "WORKS_SOR_TYPE_E",
      active: true,
    },
  ];

  const requestCriteria = {
    url: "/mukta-services/measurement/_search",

    body: {
      contractNumber: "WO/2024-25/001487",
      tenantId: tenantId,
      measurementNumber: "MB/2024-25/000392",
      key: "View",
    },
    changeQueryName: "MB/2024-25/000392",
  };

  let { isLoading: isMeasurementLoading, data: allData } = Digit.Hooks.useCustomAPIHook(requestCriteria);

  useEffect(() => {
    // if (!isMeasurementLoading) {
    //   allData = null;
    //   thumbnails = "";
    // }
    const fetchData = async () => {
      if (allData?.measurement != undefined || allData?.measurement != null) {
        const fileStoreIds = allData?.measurement?.documents.map((item) => item.fileStore);

        try {
          let thumbnailsData = await Digit.Utils.getThumbnails(fileStoreIds, tenantId);
          setThumbnails(thumbnailsData);
        } catch (error) {
          console.log(error);
        }
      }
    };

    fetchData();
  }, [allData?.measurement, tenantId, isMeasurementLoading]);

  let config = null;
  let config1=null;
  let config2=null;

  const ViewEstimate = Digit.ComponentRegistryService.getComponent("ViewEstimatePage");
  const ViewProject = Digit.ComponentRegistryService.getComponent("ViewProject");

  //Getting project location for Measurement View Page
  let projectLocation = "NA";
  if (allData?.contract) {
    const {
      additionalDetails: { locality: projectLoc, ward: projectWard },
    } = allData?.contract;
    const headerLocale = Digit.Utils.locale.getTransformedLocale(Digit.ULBService.getCurrentTenantId());
    const Pward = projectWard ? t(`${headerLocale}_ADMIN_${projectWard}`) : "";
    const city = projectLoc ? t(`${headerLocale}_ADMIN_${projectLoc}`) : "";
    projectLocation = `${Pward ? Pward + ", " : ""}${city}`;
  }

  const HandleDownloadPdf = () => {
    Digit.Utils.downloadEgovPDF(
      "measurementBook/measurement-book",
      { contractNumber: workOrderNumber, measurementNumber: mbNumber, tenantId },
      `measurement-${mbNumber}.pdf`
    );
  };

  config = viewUtilData(
    allData?.contract,
    allData?.estimate,
    allData?.measurement,
    allData?.allMeasurements,
    thumbnails,
    projectLocation,
    allData?.period,
    allData?.musterRollNumber,
    allData?.musterRolls
  );
  config1 = viewUtilSecondData(
    allData?.contract,
    allData?.estimate,
    allData?.measurement,
    allData?.allMeasurements,
    thumbnails,
    projectLocation,
    allData?.period,
    allData?.musterRollNumber,
    allData?.musterRolls
  );

  config2 =viewUtilHeaderData(
    allData?.contract,
    allData?.estimate,
    allData?.measurement,
    allData?.allMeasurements,
    thumbnails,
    projectLocation,
    allData?.period,
    allData?.musterRollNumber,
    allData?.musterRolls
  );


  // {
  //   type: "COMPONENT",
  //   cardHeader: { value: "MB_SORS", inlineStyles: {} },
  //   component: "MeasureTable",
  //   props: {
  //     config: {
  //       key: "SOR",
  //       mode: "VIEW",
  //     },
  //     arrayProps: {
  //       fields: viewData?.SOR,
  //     },
  //     register: () => {},
  //     setValue: (key, value) => setViewData((old) => ({ ...old, SOR: value })),
  //   },
  // },

  const props= 
  {"type": "COMPONENT",
  "cardHeader": { "value": "MB_SORS", "inlineStyles": {} },
  "component": "MeasureTable",
    "props":{
    "config": {
        "key": "SOR",
        "mode": "VIEW"
    },
    "arrayProps": {
        "fields": [
            {
                "amount": 156.785,
                "consumedQ": 19.35,
                "sNo": 1,
                "currentMBEntry": 0.25,
                "uom": "CUM",
                "description": "Dismantlling and removing cement concrete including stacking the useful materials for re-use and removing the debries within 50mtr lead. (Data for 1 Cum)",
                "unitRate": 627.14,
                "contractNumber": "WO/2024-25/001487",
                "targetId": "f582299c-c0ae-40c7-be8d-63144b5625bd",
                "approvedQuantity": 60,
                "showMeasure": false,
                "sorId": "SOR_000586",
                "measures": [
                    {
                        "sNo": 1,
                        "targetId": "f582299c-c0ae-40c7-be8d-63144b5625bd",
                        "isDeduction": false,
                        "description": "helo",
                        "id": "663b8cf8-7562-433e-a6f0-607d46eb9e49",
                        "height": 1,
                        "width": 1,
                        "length": 1,
                        "number": 0.25,
                        "noOfunit": 0.25,
                        "rowAmount": 156.785,
                        "additionalDetails": {
                            "type": null,
                            "mbAmount": 156.785,
                            "measureLineItems": [
                                {
                                    "width": "0.0",
                                    "height": "0.5",
                                    "length": "0.0",
                                    "number": "0.5",
                                    "quantity": "0.25",
                                    "measurelineitemNo": 0
                                }
                            ]
                        },
                        "consumedRowQuantity": 19.35
                    }
                ]
            },
            {
                "amount": 2530.656,
                "consumedQ": 15,
                "sNo": 2,
                "currentMBEntry": 1.2,
                "uom": "CUM",
                "description": "Labour for spreading dust and consolidation with H.R.R including watering and including the cost & conveyance of dust.",
                "unitRate": 2108.88,
                "contractNumber": "WO/2024-25/001487",
                "targetId": "53115f94-170a-49a0-86b3-2b944aa808fe",
                "approvedQuantity": 36,
                "showMeasure": false,
                "sorId": "SOR_000634",
                "measures": [
                    {
                        "sNo": 1,
                        "targetId": "53115f94-170a-49a0-86b3-2b944aa808fe",
                        "isDeduction": false,
                        "description": "delo",
                        "id": "ef7bdbf9-369f-476d-82b6-a099f70963ab",
                        "height": 1,
                        "width": 1,
                        "length": 1,
                        "number": 1.2,
                        "noOfunit": 1.2,
                        "rowAmount": 2530.656,
                        "additionalDetails": {
                            "type": null,
                            "mbAmount": 2530.656,
                            "measureLineItems": [
                                {
                                    "width": "0.0",
                                    "height": "0.0",
                                    "length": "0.0",
                                    "number": "0.2",
                                    "quantity": "0.2",
                                    "measurelineitemNo": 0
                                },
                                {
                                    "width": "1",
                                    "height": "0",
                                    "length": "0",
                                    "number": "0",
                                    "quantity": "1.0",
                                    "measurelineitemNo": 1
                                }
                            ]
                        },
                        "consumedRowQuantity": 15
                    }
                ]
            }
        ]

    },
    register: () => {},
    setValue: (key, value) => {},
}
};



  if (isMeasurementLoading && config != null) {
    return <Loader />;
  }
  return (
    <React.Fragment>
      <div className={"employee-application-details"} style={{ marginBottom: "15px" }}>
        <Header className="works-header-view" styles={{ marginLeft: "0px", paddingTop: "10px" }}>
          {t("Utilisation Statements")}
        </Header>
        <MultiLink onHeadClick={() => HandleDownloadPdf()} downloadBtnClassName={"employee-download-btn-className"} label={t("CS_COMMON_DOWNLOAD")} />
      </div>
      { <ViewComposer data={config2} isLoading={false} />}

      <HorizontalNav showNav={true} configNavItems={configNavItems} activeLink={activeLink} setActiveLink={setActiveLink} inFormComposer={false}>
        {activeLink === "Material" && 
        <div>
        {<ViewComposer data={config} isLoading={false} />}
       { <ViewComposer data={config1} isLoading={false} />}
         { /*<ViewUtilTable {...props.props} /> */}
        </div>
        
      }
        {activeLink === "Labour" && <ViewComposer data={config} isLoading={false} />}
        {activeLink === "Machinery" && <ViewComposer data={config} isLoading={false} />}
      </HorizontalNav>
    </React.Fragment>
  );
};

export default ViewUtilization;
