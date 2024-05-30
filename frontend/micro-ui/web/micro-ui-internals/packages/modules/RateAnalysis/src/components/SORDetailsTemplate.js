import { Card, Header, Button, Loader, TextInput, DeleteIcon } from "@egovernments/digit-ui-react-components";
import React from "react";
import { useTranslation } from "react-i18next";
import { useState, useEffect, useCallback, useMemo } from "react";
import { useHistory } from "react-router-dom/cjs/react-router-dom.min";
import { Link } from "react-router-dom";
import SearchBar from "../../../Estimate/src/pageComponents/SearchBar";

const SORDetailsTemplate = ( props ) => {
    //new component only
    const { t } = useTranslation();
    const [stateData, setStateData] = useState({});
    const [selectedSOR, setSelectedSOR] = useState(null);
    const [SORDetails, setSORDetails] = useState([]);
    const [showToast, setShowToast] = useState({show : false, label : "", error : false});
    const { register, setValue, watch } = props;
    let formData = watch("SORDetails");

    //setting the value for search sor in the statedata
    useEffect(() => {
      register("searchSor", stateData);
    }, []);
    useEffect(() => {
      setStateData({
        ...stateData,
        selectedSor: selectedSOR,
      });
      setValue("searchSor", stateData);
    }, [selectedSOR]);
    const setFormValue = useCallback(
      (value) => {
        register("SORDetails", value);
        //setValue(`SORtable`, value);
      },
      [setValue]
    );

    //setting the value of SOR details in the formdata
    useEffect(() => {
        setValue("SORDetails", SORDetails);
      }, [SORDetails]);


    const buttonClick = async () => {
    //   if (
    //     formData?.length > 0 &&
    //     formData?.find((ob) => ob?.sorCode && ob?.sorCode === stateData?.selectedSor?.id)
    //   ) {
    //     setShowToast({ show: true, error: true, label: "WORKS_CANNOT_ADD_DUPLICATE_SOR" });
    //     return;
    //   }

      //Transforming the SOR object from the selected SOR
      const sor = transformSOR(stateData?.selectedSor);
      sor?.sorId && formData?.push({...sor,sorType:props?.config?.sorType});
         
        setFormValue(formData);
        setSORDetails(formData);
        setStateData({...stateData});

      setSelectedSOR(null);
    };

    const remove = (row) => {
        let newSORDetails = SORDetails?.filter((ob) => ob?.sorCode !== row?.sorCode);
        setFormValue(newSORDetails);
        setSORDetails(newSORDetails);
        setStateData({...stateData});
        }

    const cellContainerStyle = { display: "flex", flexDirection: "column" };
    const errorCardStyle = { width: "100%", fontSize: "12px", whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" };
    const errorContainerStyles = { display: "block", height: "1rem", overflow: "hidden" };


    const columns = [
        { label: t("RA_SNO"), key: "sno" },
        { label: t("RA_CODE"), key: "sorCode" },
        { label: t("RA_NAME"), key: "description" },
        { label: t("RA_UOM"), key: "uom" },
        { label: t("RA_QTY"), key: "quantity" },
      ];
  
    const transformSOR = (sor) => {
      const transformedSOR = {
        sNo: 1,
        description: sor?.description,
        uom: sor?.uom,
        category: "SOR",
        approvedQuantity: sor?.quantity,
        consumedQ: 0,
        sorType: sor?.sorType,
        sorSubType : sor?.sorSubType,
        sorCode : sor?.id,
        currentMBEntry: 0,
        amount: 0,
        measures: [],
        targetId: null,
        sorId: sor?.id,
        quantity:null,
      };
      return transformedSOR;
    };

    const SORTypeCodes = {
        "MATERIAL" : "M",
        "MACHINERY": "MH",
        "LABOUR" : "L"
    }

    const getStyles = (index) => {
        let obj = {};
        switch (index) {
          case 1:
            obj = { width: "1rem" };
            break;
          case 2:
            obj = { width: "12rem" };
            break;
          case 3:
            obj = { width: "70rem" };
            break;
          case 4:
            obj = { width: "10rem" };
            break;
          case 5:
            obj = { width: "15rem" };
            break;
          case 6:
            obj = { width: "18rem" };
            break;
          case 7:
            obj = { width: "10rem" };
            break;
          case 8:
            obj = { width: "3%" };
            break;
          default:
            obj = { width: "1rem" };
            break;
        }
        return obj;
      };

    const sortedRows = SORDetails.filter((ob) => ob?.sorType === props?.config?.sorType).map((row, index) => ({
      sno: index + 1,
      sorCode: row?.sorCode,
      description: row?.description,
      uom: row?.uom,
    }));

    // const renderBody = useMemo(() => {
    //     let i = 0;
    //     if(SORDetails?.filter((ob) => ob?.sorType === props?.config?.sorType).length > 0){
    //         return SORDetails.filter((ob) => ob?.sorType === props?.config?.sorType).map((row, index) => {
    //         return (
    //             (
    //             <tr key={index}>
    //                 <td style={getStyles(1)}>{++i}</td>
                    
    //                 <td style={getStyles(3)}>{row?.sorCode}</td>

    //                 <td style={getStyles(2)}>{row?.description}</td>

    //                 <td style={getStyles(4)}>{row?.uom}</td>
        
    //                 <td style={getStyles(5)}>
    //                 <div style={cellContainerStyle}>
    //                     <TextInput
    //                     style={{ marginBottom: "0px" }}
    //                     //name={`${SORDetails[index]}.quantity`}
    //                     onChange={(e) => {
    //                         let newSOR = SORDetails?.map((obj) => {
    //                             if(obj?.id === row?.id)
    //                             return {...obj, quantity : e.target.value}
    //                         })
    //                         setFormValue([...newSOR]);
    //                         setSORDetails([...newSOR]);
                            
    //                     }}
    //                     inputRef={register({
    //                         required: true,
    //                         //pattern: /^[a-zA-Z0-9_ .$%@#\/ ]*$/,
    //                     })}
    //                     // disable={isInputDisabled(`${formFieldName}.${row.key}.name`)}
    //                     disable={false}
    //                     />
    //                 </div>
    //                 <div style={errorContainerStyles}>
    //                     {/* {errors && errors?.[formFieldName]?.[row.key]?.percentage?.type === "pattern" && (
    //                         <CardLabelError style={errorCardStyle}>{t(`WORKS_PATTERN_ERR`)}</CardLabelError>)}
    //                     {errors && errors?.[formFieldName]?.[row.key]?.percentage?.type === "required" && (
    //                         <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>)} */}
    //                 </div>
    //                 </td>
        
    //                 <td /*style={getStyles(5)}*/>
    //                 <div style={cellContainerStyle}>
    //                     {
    //                     <span onClick={() => {}/*removeRow(row)*/} className="icon-wrapper">
    //                         <DeleteIcon fill={"#FF9100"} />
    //                     </span>
    //                     }
    //                 </div>
    //                 <div style={errorContainerStyles}></div>
    //                 </td>
    //             </tr>
    //             )
    //         );
    //         });
    //     }
    //   }, [SORDetails, formData]);

    return (
      <div>
        <div className="search-sor-container">
        <span className="search-sor-label">{t(`RA_${props?.config?.sorType}_HEADER`)}</span>
        <div className="search-sor-button"> 
        <SearchBar stateData={{...stateData,SORType:SORTypeCodes[props?.config?.sorType]} } selectedSOR={selectedSOR} setSelectedSOR={setSelectedSOR} placeholder={t("RA_SEARCH_BAR_PLACEHOLDER")} />
        <Button
          label={t("RA_ADD_SOR")}
          onButtonClick={buttonClick}
          style={{padding:"revert"}}
          className={"add-sor-button"}
        />
        </div>
        </div>
        <table className="table reports-table sub-work-table">
          <thead>
            <tr>
              {SORDetails?.filter((ob) => ob?.sorType === props?.config?.sorType).length > 0 && columns.map((column, index) => (
                <th key={index}>{column.label}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {/*renderBody*/}
            {sortedRows.map((row, rowIndex) => (
              <tr key={rowIndex}>
                {columns.map((column, columnIndex) => (
                  <td key={columnIndex} style={getStyles(columnIndex+1)}>
                    {column?.key === "quantity" ? (
                   <div style={cellContainerStyle}>
                   <TextInput
                   style={{ marginBottom: "0px" }}
                   //name={`${SORDetails[index]}.quantity`}
                   onChange={(e) => {
                       let newSOR = SORDetails?.map((obj) => {
                           if(obj?.id === row?.id)
                           return {...obj, quantity : e.target.value}
                       })
                       setFormValue([...newSOR]);
                       setSORDetails([...newSOR]);
                       
                   }}
                   inputRef={register({
                       required: true,
                       //pattern: /^[a-zA-Z0-9_ .$%@#\/ ]*$/,
                   })}
                   // disable={isInputDisabled(`${formFieldName}.${row.key}.name`)}
                   disable={false}
                   />
               </div>
                    ) : (
                      row[column.key]
                    )}
                  </td>
                ))}
                <td /*style={getStyles(5)}*/>
                    <div style={cellContainerStyle}>
                        {
                        <span onClick={() => remove(row)} className="icon-wrapper">
                            <DeleteIcon fill={"#FF9100"} />
                        </span>
                        }
                    </div>
                    <div style={errorContainerStyles}></div>
                </td>
              </tr>
            ))}
          </tbody>
          </table>
        {showToast?.show && (
        <Toast  labelstyle={{width:"100%"}} error={showToast?.error} label={t(showToast?.label)} isDleteBtn={true} onClose={() => setShowToast({show : false, label : "", error : false})} />
        )}
      </div>
    );
};

export default SORDetailsTemplate;


