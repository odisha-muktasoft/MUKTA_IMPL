import { transformEstimateData } from "../../../../modules/Measurement/src/utils/transformEstimateData";

const useMBDataForPB=({workOrderNumber, tenantId})=>{

    const requestCriteriaForMeasurement = {
        url : "/mukta-mukta-services/measurement/_search",
    
        body: {
          "contractNumber" : workOrderNumber,
          "tenantId" : tenantId
        }
    
      }
      const {isLoading: isMeasurementLoading, data} = Digit.Hooks.useCustomAPIHook(requestCriteriaForMeasurement);

     // const { contract, estimate, allMeasurements, measurement, musterRollNumber, period } = data;
      

      const requestCriteria = {
        url: "/mdms-v2/v1/_search",
        body: {
        MdmsCriteria: {
            tenantId: tenantId,
            moduleDetails: [
            {
                moduleName: "WORKS-SOR",
                masterDetails: [
                {
                    name: "Rates",
                    //filter: `[?(@.sorId=='${sorid}')]`,
                },
                ],
            },
            ],
        },
        },
    };

    const { isLoading : isRatesLoading, data : RatesData} = Digit.Hooks.useCustomAPIHook(requestCriteria);

     const requestCriteriaBill = {
        url : "/mukta-expense-calculator/v1/_search",
    
        body: {
            "searchCriteria": {
                "tenantId": tenantId,
                "contractNumbers": [workOrderNumber],
                "billTypes": [
                    "EXPENSE.PURCHASE"
                ]
            },
            "pagination": {
                "limit": 100,
                "offSet": 0,
                "sortBy": "",
                "order": "ASC"
            },
        }
    };

    const { isLoading : billloading, data : BillData} = Digit.Hooks.useCustomAPIHook(requestCriteriaBill);

    let ValidMeasurement =  data?.allMeasurements?.length > 0 ? data?.allMeasurements?.filter((ob) => /*ob?.wfStatus !== "DRAFTED" && ob?.wfStatus !== "REJECTED"*/ ob?.wfStatus === "APPROVED") : [];

    //const SOR = data && transformEstimateData(data?.estimate?.estimateDetails, data?.contract, "SOR", data?.measurement, ValidMeasurement);
    let SOR = [];
    data?.allMeasurements?.length > 0 && data?.allMeasurements?.map((mb) => {
        let sorResult = transformEstimateData(data?.estimate?.estimateDetails, data?.contract, "SOR", data?.measurement, [mb]);
        SOR?.push(...sorResult);
    });

    let ValidCodes = ["MA","MHA","RA","CA","EMF","DMF","ADC","LC"]

    let totalMaterialAmount = data ? SOR?.reduce((tot, ob) => {
        let amountDetails = RatesData?.MdmsRes?.["WORKS-SOR"]?.Rates?.filter((rate) => (rate?.sorId === ob?.sorId || rate?.sorId === ob?.sorCode))?.[0]?.amountDetails;
        let amount = amountDetails?.reduce((total, item) => {
            return (ValidCodes.some(category => item.heads?.includes(category)) ? (item.amount + total) : total);
        }, 0);
        return (tot + amount * ob?.currentMBEntry);
    }, 0) : null;

    let allMeasurementsIds = ValidMeasurement?.map((ob) => ob?.measurementNumber);

    const totalPaidAmountForSuccessfulBills = BillData?.bills?.filter((bl) => bl?.bill?.businessService?.includes("PURCHASE")).reduce((total, bill) => (bill.bill?.wfStatus !== 'REJECTED' ? total + (bill.bill?.totalAmount || 0) : total), 0);

    let finalObject = {
        allMeasurementsIds,
        totalMaterialAmount,
        totalPaidAmountForSuccessfulBills,
        isMeasurementLoading
    }

      return finalObject;
}

export default useMBDataForPB;