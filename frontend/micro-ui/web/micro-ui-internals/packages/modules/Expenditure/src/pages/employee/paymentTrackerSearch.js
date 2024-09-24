import React, {useMemo} from "react";
import { useTranslation } from "react-i18next";
import { Header, InboxSearchComposer,Loader } from "@egovernments/digit-ui-react-components";
import { paymentTrackerSearchConfig } from "../../configs/paymentTrackerSearchConfig";
import { ActionBar, SubmitBar } from "@egovernments/digit-ui-components";

const PaymentTrackerSearch = () => {
    const { t } = useTranslation();

    const configModuleName = Digit.Utils.getConfigModuleName()
    const tenant = Digit.ULBService.getStateId();
    // const { isLoading, data } = Digit.Hooks.useCustomMDMS(
    //     tenant,
    //     configModuleName,
    //     [
    //         {
    //             "name": "SearchEstimateWMSConfig"
    //         }
    //     ],
    //     {
    //       select: (data) => {
            
    //           const config = data?.[Digit.Utils.getConfigModuleName()]?.SearchEstimateWMSConfig?.[0];
              
    //           return config
    //         },
    //     }
    // );
    // const configs = Digit.Utils.configUpdater(searchConfigMuktaFuzzy())
    //let configs = paymentTrackerSearchConfig?.paymentTrackerSearchConfig?.[0];
    
    // const configs = data?.[configModuleName].SearchEstimateWMSConfig?.[0]
    let configs = useMemo(
        () => Digit.Utils.preProcessMDMSConfigInboxSearch(t, paymentTrackerSearchConfig?.paymentTrackerSearchConfig?.[0], "sections.search.uiConfig.fields",{
          updateDependent : [
            {
              key : "fromProposalDate",
              value : [new Date().toISOString().split("T")[0]]
            },
            {
              key : "toProposalDate",
              value : [new Date().toISOString().split("T")[0]]
            }
          ]
        }
        ),[paymentTrackerSearchConfig]);
      
        const { mutate: generateexcel } = Digit.Hooks.useGenerateExcel();

    const handleGenerateExcel = async (data) => {

      const payload = {
        "report": {
          "tenantId": "pg.citya",
          "reportName": "expense",
          "requestPayload": {
              "tenantId": "pg.citya"
          }
      }
      }
      await generateexcel(payload, {
        onError: async (error, variables) => {
            
            // sendDataToResponsePage("billNumber", tenantId, false, "EXPENDITURE_PB_MODIFIED_FORWARDED", false);
        },
        onSuccess: async (responseData, variables) => {
            
            //Add a toast here
            //sendDataToResponsePage(responseData?.bills?.[0]?.billNumber, tenantId, true, "EXPENDITURE_PB_MODIFIED_FORWARDED", true);
        },
    });
    }
    

    //if (isLoading) return <Loader />
    return (
        <React.Fragment>
        <Header className="works-header-search">{t(configs?.label)}</Header>
            <div className="inbox-search-wrapper">
                <InboxSearchComposer configs={configs}></InboxSearchComposer>
            </div>
            <ActionBar style={{ display: "flex", gap: "24px", justifyContent: "flex-end" }}>
        <SubmitBar
          label={t("RA_REVISE_RATE_FOR_SELECTED")}
          onSubmit={() => handleGenerateExcel}
          disabled={!selectedSorIds.hasOwnProperty("sorIds") || selectedSorIds?.sorIds?.length <= 0 || selectedSorIds?.sorType !== "W"}
        />
      </ActionBar>
        </React.Fragment>
    )
}

export default PaymentTrackerSearch;