import { Button, TextInput, Toast } from "@egovernments/digit-ui-react-components";
import React, { useEffect, useState, useCallback } from "react";
import { useTranslation } from "react-i18next";

const fetchTemplateData = async (searchText, setShowToast) => {
  //method to fetch the data for estimate template
  const tenantId = Digit.ULBService.getCurrentTenantId();
  let requestCriteria = {
    url: "/mdms-v2/v2/_search",
    body: {
      MdmsCriteria: {
        tenantId: tenantId?.split(".")[0],
        schemaCode: "WORKS.EstimateTemplate",
        limit: 100,
        offset: 0,
        filters: {}
      }
    }
  };

  //either search with Template id or name
  if (searchText.startsWith("TMP_")) {
    requestCriteria.body.MdmsCriteria.filters.templateId = searchText;
  } else if (searchText.length >= 3) {
    requestCriteria.body.MdmsCriteria.filters.templateName = searchText;
  } else {
    setShowToast({ show: true, error: true, label: "WORKS_MINIMUM_CHAR_ERROR" });
    return [];
  }

  try {
    const data = await Digit.CustomService.getResponse(requestCriteria);
    if (data?.mdms?.length > 0) {
        setShowToast({ show: false, label: "", error: false })
      return data?.mdms;
     } 
    //else {
    //   setShowToast({ show: true, error: true, label: "WORKS_TEMPLATE_NOT_FOUND_ERROR" });
    //   return [];
    // }
  } catch (error) {
    console.error(error);
    setShowToast({ show: true, error: true, label: "WORKS_API_ERROR" });
    return [];
  }
};


const fetchData = async (sorid, state, setState, setShowToast) => {
    //fetch the data of SOR recieved from estimate template
    const tenantId = Digit.ULBService.getCurrentTenantId();
    if(sorid == null)
    {
      setShowToast({show: true, error: true, label:"WORKS_CANNOT_ADD_EMPTY_DATA"});
      return true;
    }
    let currentDateInMillis = new Date().getTime(); 
  
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
                  filter: `[?(@.sorId=='${sorid}')]`,
                },
              ],
            },
          ],
        },
      },
    };
    try {
      const data = await Digit.CustomService.getResponse(requestCriteria);
      if (data?.MdmsRes?.["WORKS-SOR"]?.Rates?.length > 0) {
        const Rates = data?.MdmsRes?.["WORKS-SOR"]?.Rates?.filter((rate) => {
          // Convert validFrom and validTo to milliseconds
          let validFromInMillis = new Date(parseInt(rate?.validFrom)).getTime();
          let validToInMillis = rate?.validTo ? new Date(parseInt(rate?.validTo)).getTime() : Infinity;
          // Check if the current date is within the valid date range
          return validFromInMillis <= currentDateInMillis
            && currentDateInMillis < validToInMillis;
        });
        return Rates;
      }
      else
      {
        setShowToast({show: true, error: true, label:"WORKS_RATE_NOT_FOUND_ERROR"});
      }
    } catch (error) {
      // Handle any errors here
      console.error(error);
    }
  };

const searchTemplate = (props) => {
  const { t } = useTranslation();
  const [stateData, setStateData] = useState({ searchText: "" });
  const [selectedTemplate, setSelectedTemplate] = useState(null);
  const [inputValue, setInputValue] = useState("");
  const [suggestions, setSuggestions] = useState([]);
  const [showToast, setShowToast] = useState({ show: false, label: "", error: false });
  const { register, setValue, watch } = props;
  let formData = watch("SOR");
  let formNonSORdata = watch('NONSOR')

  useEffect(() => {
    register("searchSor", stateData);
  }, []);

  useEffect(() => {
    //if the text reaches minimun of 3 character it should search
    if (stateData.searchText.length >= 3) {
      fetchTemplateData(stateData.searchText, setShowToast).then((resp) => setSuggestions(resp));
    }
  }, [stateData.searchText]);

  const handleSearchTextChange = (event) => {
    setStateData({ ...stateData, searchText: event.target.value });
    setInputValue(event.target.value);
  };

  const setFormValue = useCallback(
    (value) => {
      setValue("SOR", value);
      setValue(`SORtable`, value);
    },
    [setValue]
  );

  const setNonSORFormValue = useCallback(
    (value) => {
      setValue("NONSOR", value);
      setValue(`NONSORtable`, value);
    },
    [setValue]
  );

const buttonClick = async () => {
    // Check for duplicate SOR entries
    // if (
    //   formData?.length > 0 &&
    //   formData?.find((ob) => ob?.sorCode && ob?.sorCode === stateData?.selectedTemplate?.data?.lineItems[0]?.sorCode)
    // ) {
    //   setShowToast({ show: true, error: true, label: "WORKS_CANNOT_ADD_DUPLICATE_SOR" });
    //   return;
    // }
  
    // Transform SOR and non-SOR items
    let transformedItems = stateData?.selectedTemplate?.data?.lineItems.map(item => ({
      sNo: 1,
      description: item.description,
      uom: item.uom,
      category: item.lineItemType,
      approvedQuantity: item.quantity,
      consumedQ: 0,
      sorType: item.sorType,
      sorSubType: item.subType,
      sorCode: item.sorCode,
      currentMBEntry: 0,
      amount: 0,
      measures: [],
      targetId: null,
      sorId: item.sorCode,
    }));

    transformedItems = transformedItems.filter(item => {
        if (item.category === "NON-SOR") return true; // Always include NON-SOR items
        return !formData.some(existingItem => existingItem.sorCode === item.sorCode);
      });
  
    try {
      // Fetch rates for SOR items
      const sorItems = transformedItems.filter(item => item.category === "SOR");
      for (const sor of sorItems) {
        const apiData = await fetchData(sor.sorCode, formData, setFormValue, setShowToast);
        if (apiData !== undefined && apiData?.[0]?.sorId === sor.sorId) {
          sor.unitRate = apiData?.[0]?.rate || 0;
          sor.amountDetails = apiData?.[0]?.amountDetails;
        } else {
          console.error('Rates not available in fetchData response');
        }
      }
  
      // Combine SOR and non-SOR items
      let updatedFormData = [...formData, ...transformedItems?.filter(item => item.category === "SOR")];
  
      // Remove any placeholder entries if present
      updatedFormData = updatedFormData.filter(item => item.description);
  
      setFormValue(updatedFormData);
      let updateNonsorFormdata = [...formNonSORdata, ...transformedItems?.filter(item => item.category === "NON-SOR")];
      updateNonsorFormdata = updateNonsorFormdata.filter(item => item.description);
      setNonSORFormValue(updateNonsorFormdata);
      setStateData({ ...stateData, SORSubType: null, SORVariant: null, selectedTemplate: null });
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  
    setSelectedTemplate(null);
  };

  const handleSelectOption = (option) => {
    if (option?.id) {
      setStateData({...stateData, selectedTemplate:option});
      setInputValue(option?.data?.templateName);
      setSelectedTemplate(option);
      setSuggestions([]);
    }
  };

  return (
    <div>
      <div className="search-sor-container">
        <span className="search-sor-label">{t("ESTIMATE_SEARCH_TEMPLATE_LABEL")}</span>
        <div className="search-sor-button">
          <div className={"search-bar-sor"} style={{ margin: "20px 1.4rem 0" }}>
            <TextInput
              type="text"
              name={"Search"}
              placeholder={t("SEARCH_TEMPLATE_HINT")}
              value={inputValue}
              onChange={handleSearchTextChange}
              customClass="search-sor-input"
            />
            {suggestions?.length > 0 && (
              <ul className="suggestions-sor" style={{ zIndex: "10", maxHeight: "33rem", overflow: "auto" }}>
                {suggestions.map((option) => (
                  <li key={option.id} onClick={() => handleSelectOption(option)}>
                    {option.data.templateName}
                  </li>
                ))}
              </ul>
            )}
          </div>
          <Button label={t("ESTIMATE_ADD_LABEL")} onButtonClick={buttonClick} className={"add-sor-button"} />
        </div>
      </div>
      {showToast?.show && (
        <Toast
          labelstyle={{ width: "100%" }}
          error={showToast?.error}
          label={t(showToast?.label)}
          isDleteBtn={true}
          onClose={() => setShowToast({ show: false, label: "", error: false })}
        />
      )}
    </div>
  );
};

export default searchTemplate;

