// import { useQuery } from 'react-query';
// import { useTranslation } from "react-i18next";
// //import { View } from '../../../../libraries/src/services/molecules/Contracts/View';
// import {View} from '../../../../libraries/src/services/molecules/rateAnalysis/View';

// const useViewRateAnalysisDetails = (tenantId, data, searchParams, config = {},revisedWONumber) => {
//     const { t } = useTranslation();
//     return useQuery(
//         ["VIEW_RATE_ANALYSIS_DETAILS", tenantId, searchParams?.contractNumber], 
//         () => View.fetchRateAnalysisDetails(t, tenantId, data, searchParams,revisedWONumber), 
//         config
//     );
// }

// export default useViewRateAnalysisDetails;