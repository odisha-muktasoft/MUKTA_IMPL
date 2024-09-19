import React, {useMemo} from "react";
import { useTranslation } from "react-i18next";
import { Header, InboxSearchComposer,Loader } from "@egovernments/digit-ui-react-components";
import { paymentTrackerSearchConfig } from "../../configs/paymentTrackerSearchConfig";

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
    

    //if (isLoading) return <Loader />
    return (
        <React.Fragment>
        <Header className="works-header-search">{t(configs?.label)}</Header>
            <div className="inbox-search-wrapper">
                <InboxSearchComposer configs={configs}></InboxSearchComposer>
            </div>
        </React.Fragment>
    )
}

export default PaymentTrackerSearch;