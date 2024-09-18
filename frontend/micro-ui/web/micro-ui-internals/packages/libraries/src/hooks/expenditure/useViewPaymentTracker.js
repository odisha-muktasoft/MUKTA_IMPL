import React from 'react'

const useViewPaymentTracker = ({projectId, tenantId}) => {

  const projectSearchCriteria = {
    url: `/project/v1/_search?limit=10&offset=0&tenantId=${tenantId}`,

    body: {
      Projects: [
        {
          tenantId: tenantId,
          projectNumber: projectId
        }
      ],
      apiOperation: "SEARCH"
    }
  }

  let { isLoading: isProjectLoading, data : projectData } = Digit.Hooks.useCustomAPIHook(projectSearchCriteria);

  const billPaidSearchCriteria = {
    url: "/wms/report/payment_tracker",

    body: {
      "searchCriteria": {
        "tenantId": "pg.citya",
        "moduleSearchCriteria": {
          "ward": "string"
        },
        "limit": 10,
        after_key: projectId,
      }
    }
  };

  let { isLoading: isBillPaidLoading, data : billPaidData } = Digit.Hooks.useCustomAPIHook(billPaidSearchCriteria);
  
  const billSearchCriteria = {
    url: "/wms/ifms-pi/_search",

    body: {
      inbox: {
        "tenantId": "pg.citya",
        "moduleSearchCriteria": {
          "tenantId": "pg.citya",
        },
        "limit": 10,
        "offset": 0,
        // "after_key": "PJ/2023-24/000172",
      }
    }
  };

  let { isLoading: isBillLoading, data : billData } = Digit.Hooks.useCustomAPIHook(billSearchCriteria);

  return {projectData, billPaidData, billData, isProjectLoading, isBillPaidLoading, isBillLoading}
}

export default useViewPaymentTracker