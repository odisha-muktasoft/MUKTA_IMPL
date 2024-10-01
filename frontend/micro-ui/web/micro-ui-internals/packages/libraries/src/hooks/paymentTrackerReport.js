
export const paymentTrackerReport = (props) => {
    var { isLoading, data, revalidate, isFetching, error } = Digit.Hooks.useCustomAPIHook(props);
    //search Project
    const requestrevisionCriteria = {
        url: "/wms/project/_search",
        params : {tenantId : Digit.ULBService.getCurrentTenantId() , includeAncestors : true},
        config : {
          cacheTime : 0,
          enabled : data ? true : false
        },
        body: {
            "inbox": {
            "moduleSearchCriteria": {
                "tenantId": Digit.ULBService.getCurrentTenantId(),
                "projectNumber": /*data?.aggsResponse?.projects.map((ob) => ob?.projectNumber)*/ ["PJ/2023-24/11/000085"] 
            },
            "tenantId": "pg.citya",
            "limit": 10,
            "offset": 0
        }},
        changeQueryName: "allProjectDetails"
      };
    
      const {isLoading: isProjectDetailsLoading, data: projectDetails} = Digit.Hooks.useCustomAPIHook(requestrevisionCriteria);

    if(data?.aggsResponse?.projects) {
        data.aggsResponse.projects = data?.aggsResponse?.projects?.map((ob) => {
            return {
                ...ob,
                wagebillsuccess : ob?.paymentDetails?.filter((obj) => obj?.billType?.includes("WAGE"))?.[0]?.paidAmount,
                wagebillFailed : ob?.paymentDetails?.filter((obj) => obj?.billType?.includes("WAGE"))?.[0]?.remainingAmount,
                purchasebillSuccess : ob?.paymentDetails?.filter((obj) => obj?.billType?.includes("PURCHASE"))?.[0]?.paidAmount,
                purchasebillFailed : ob?.paymentDetails?.filter((obj) => obj?.billType?.includes("PURCHASE"))?.[0]?.remainingAmount,
                supervisionbillSuccess : ob?.paymentDetails?.filter((obj) => obj?.billType?.includes("SUPERVISION"))?.[0]?.paidAmount,
                supervisionbillFailed : ob?.paymentDetails?.filter((obj) => obj?.billType?.includes("SUPERVISION"))?.[0]?.remainingAmount,
                project : /*projectDetails?.items?.filter((pj) => pj?.businessObject?.projectNumber === ob?.projectNumber)?.[0] */ projectDetails?.items?.[0]
            }
        })
        data.stickyFooterRow = Array(9).fill(0);
        data.stickyFooterRow[0] = '';
        data.stickyFooterRow[1] = 'Grand Total';
        data?.aggsResponse?.projects?.map((ob, index) => {
            data.stickyFooterRow[2] += ob?.estimatedAmount
            data.stickyFooterRow[3] += ob?.wagebillsuccess
            data.stickyFooterRow[4] += ob?.wagebillFailed
            data.stickyFooterRow[5] += ob?.purchasebillSuccess
            data.stickyFooterRow[6] += ob?.purchasebillFailed
            data.stickyFooterRow[7] += ob?.supervisionbillSuccess
            data.stickyFooterRow[8] += ob?.supervisionbillFailed
        })
    }

    return { isLoading : (isLoading || isProjectDetailsLoading), data, revalidate, isFetching, error };
}