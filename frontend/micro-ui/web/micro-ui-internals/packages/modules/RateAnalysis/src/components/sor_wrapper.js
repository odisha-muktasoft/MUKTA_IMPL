import React from "react";
import { useTranslation } from "react-i18next";
import { useState, useEffect, useCallback, useMemo } from "react";
import SORDetailsTemplate from "./SORDetailsTemplate";

const WrapperSORDetailsTemplate = (props) => {
  //new component only
  const { t } = useTranslation();

  const { pageType, arrayData, register, setValue, watch ,config} = props;

  const [SORDetails, setSORDetails] = useState();

  useEffect(() => {
    setSORDetails(arrayData ? arrayData : []);
  }, [SORDetails, pageType,arrayData]);

  return (
    <div>
      <SORDetailsTemplate config={config} arrayData={SORDetails} pageType={pageType}  register={register}  setValue={setValue} watch={watch}/>
    </div>
  );
};

export default WrapperSORDetailsTemplate;
