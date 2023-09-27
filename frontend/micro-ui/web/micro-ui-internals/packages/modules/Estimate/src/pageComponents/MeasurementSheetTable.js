import React, { Fragment, useState, useEffect, useMemo } from "react";
import { AddIcon, DeleteIcon, RemoveIcon, TextInput, CardLabelError, Dropdown, Loader, TextArea, InputTextAmount } from "@egovernments/digit-ui-react-components";
import { Controller } from "react-hook-form";
import cloneDeep from "lodash/cloneDeep";


const MeasurementSheetTable = ({ control, watch, config, indexValue, data, formFieldNames, formFieldName, props }) => {
    const populators = config?.populators

    const [totalAmount, setTotalAmount] = useState(0);

    // const formFieldName = formFieldName;

    const initialState = [
        {
            key: 0,
            isShow: true,
        },
    ];

    const { t, register, errors, setValue, getValues, formData, unregister } = props;



    const [rows, setRows] = useState(
        data?.length > 0
            ? data
                ?.map((row, index) => {
                    return row
                        ? {
                            key: index,
                            isShow: row?.isActive ? row?.isActive : !(row?.estimatedAmount === "0"),
                        }
                        : {
                            key: index + 1000,
                            isShow: false,
                        };
                })
                ?.filter((row) => row)
            : initialState
    );


    const setTotal = (formData) => {
        const tableData = formData?.[formFieldName];

        const result = tableData
            ?.filter((tableRow, idx) => {
                let include = false;
                rows?.map((row) => {
                    if (row.isShow && row.key === idx) include = true;
                });
                return include;
            })
            ?.reduce((acc, curr) => acc + parseFloat(curr?.estimatedAmount || 0), 0);

        setTotalAmount((prevState) => {
            return (Math.round(result * 100) / 100).toFixed(2);
        });
    };

    useEffect(() => {
        setTotal(formData);
    }, [formData, rows]);


    const getStyles = (index) => {
        let obj = {};
        switch (index) {
            case 1:
                obj = { width: "1rem" };
                break;
            case 2:
                obj = { width: "10rem" };
                break;
            case 3:
                obj = { width: "30rem" };
                break;
            case 4:
                obj = { width: "10rem" };
                break;
            case 5:
                obj = { width: "10rem" };
                break;
            case 6:
                obj = { width: "10rem" };
                break;
            case 7:
                obj = { width: "10rem" };
                break;
            case 8:
                obj = { width: "10rem" };
                break;
            default:
                obj = { width: "1rem" };
                break;
        }
        return obj;
    };
    const columns = [
        t("S.No"),
        t("Type"),
        t("Description"),
        t("Number"),
        t("Length"),
        t("Width"),
        t("Depth / Height"),
        t("Quantity"),
        t("CS_COMMON_ACTION"),
    ];

    const renderHeader = () => {
        return columns?.map((key, index) => {
            return (
                <th key={index} style={{ ...getStyles(index + 1), minWidth: "50px" }}>
                    {" "}
                    {key}{" "}
                </th>
            );
        });
    };


    const removeRow = (row) => {
        const countRows = rows.reduce((acc, row) => {
            return row.isShow ? acc + 1 : acc
        }, 0)
        if (countRows === 1) {
            //clear the 1st rows data

            formData?.[formFieldName]?.map((row, index) => {
                if (row) {
                    setValue(`${formFieldName}.${index}.description`, '')
                    setValue(`${formFieldName}.${index}.rate`, "0")
                    setValue(`${formFieldName}.${index}.uom`, '')
                    setValue(`${formFieldName}.${index}.estimatedQuantity`, '')
                    setValue(`${formFieldName}.${index}.estimatedAmount`, "0")
                }
            })

            return
        }

        //make a new state here which doesn't have this key
        const updatedState = rows.map((e) => {
            if (e.key === row.key) {
                return {
                    key: e.key,
                    isShow: false,
                };
            }
            return e;
        });
        setValue(`${formFieldName}.${row.key}.estimatedAmount`, 0);
        setRows((prev) => updatedState);
    };

    const addRow = () => {
        const obj = {
            key: null,
            isShow: true,
        };
        obj.key = rows[rows.length - 1].key + 1;
        setRows((prev) => [...prev, obj]);
    };

    const onReset = () => {

        const obj = { uom: "", description: "", number: "", width: "0", depth: "", quantity: "", length: "" }
        let otherRowsData = cloneDeep(formData?.[formFieldNames] || []);
        otherRowsData[indexValue].measurementSheetData = [];
        otherRowsData[indexValue].isMeasurementSheet = true;
        setRows(initialState);
        setValue(formFieldNames, otherRowsData);
        setValue(formFieldName, [obj]);
    }

    const onDoneClick = () => {
        const nameOfForm = formFieldName?.split('.')[0]
        let rowsData = cloneDeep(formData?.[nameOfForm]?.[indexValue] || []);
        let otherRowsData = cloneDeep(formData?.[formFieldNames] || []);
        otherRowsData[indexValue].measurementSheetData = rowsData;
        otherRowsData[indexValue].isMeasurementSheet = false;
        setValue(formFieldNames, otherRowsData);
    }

    const getDropDownDataFromMDMS = (t, row, inputName, props, register, optionKey = "name") => {
        const options = [
            {
                code: "Plus",
                name: "Plus"
            },
            {
                code: "Minus",
                name: "Minus"
            }
        ]
        return (
            <Dropdown
                inputRef={register()}
                option={options}
                selected={props?.value}
                optionKey={optionKey}
                t={t}
                select={(e) => {
                    props.onChange(e);
                }}
                onBlur={props?.onBlur}
                optionCardStyles={{ maxHeight: "15rem" }}
                style={{ marginBottom: "0px" }}
            />
        );
    };

    const setAmountField = (e, row) => {
        const quantity = parseFloat(watch(`${formFieldName}.${row.key}.estimatedQuantity`));
        const ratePerUnit = parseFloat(watch(`${formFieldName}.${row.key}.rate`));
        if (!ratePerUnit || !quantity) {
            setValue(`${formFieldName}.${row.key}.estimatedAmount`, 0);
            return;
        }
        const amountToSet = parseFloat(quantity * ratePerUnit).toFixed(2);
        setValue(`${formFieldName}.${row.key}.estimatedAmount`, amountToSet);
    };

    const cellContainerStyle = { display: "flex", flexDirection: "column" };
    const errorCardStyle = { width: "100%", fontSize: "12px", whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" };
    const errorContainerStyles = { display: "block", height: "1rem", overflow: "hidden" };
    const renderBody = useMemo(() => {
        let i = 0;
        return rows.map((row, index) => {
            if (row.isShow) index;
            return row.isShow && (
                <tr key={index} style={!row?.isShow ? { display: 'none' } : {}}>
                    <td style={getStyles(1)}>{index}</td>

                    <td style={getStyles(2)}>
                        <div style={cellContainerStyle}>
                            <div>
                                <Controller
                                    defaultValue={data?.[row?.key]?.uom}
                                    control={control}
                                    name={`${formFieldName}.${row.key}.uom`}
                                    rules={{
                                        required: true,
                                        pattern: /^[a-zA-Z0-9_ .$@#\/ ]*$/,
                                    }}
                                    render={(props) =>
                                        getDropDownDataFromMDMS(t, row, "uom", props, register, "name", {
                                            mdmsConfig: {
                                                masterName: "uom",
                                                moduleName: "common-masters",
                                                localePrefix: "ES_COMMON_UOM",
                                            },
                                        })
                                    }
                                />
                            </div>
                            <div style={errorContainerStyles}>
                                {errors && errors?.[formFieldName]?.[row.key]?.uom?.type === "pattern" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_PATTERN_ERR`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.uom?.type === "required" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                                )}
                            </div>
                        </div>
                    </td>

                    <td style={getStyles(3)}>
                        <div style={cellContainerStyle}>
                            <div>
                                <Controller
                                    defaultValue={data?.[row?.key]?.description || ""}
                                    render={({ onChange, ref, value }) =>
                                        <TextInput
                                            style={{ marginBottom: "0px" }}
                                            defaultValue={data?.[row?.key]?.description || ""}
                                            type={"text"}
                                            name={`${formFieldName}.${row.key}.description`}
                                            onChange={(e) => {
                                                onChange(e)
                                                // setAmountField(e, row)
                                            }}
                                            inputRef={register({
                                                maxLength:{
                                                  value:512,
                                                  message:t(`WORKS_PATTERN_ERR`)
                                                },
                                                required:true
                                            })}
                                        // value={value}
                                        // errorStyle={errors?.[populators.name]}
                                        // max={populators.max}
                                        // disable={disable}
                                        // style={type === "date" ? { paddingRight: "3px" } : ""}
                                        // maxlength={populators?.validation?.maxlength}
                                        // minlength={populators?.validation?.minlength}
                                        />
                                    }
                                    name={`${formFieldName}.${row.key}.description`}
                                    control={control}
                                    rules={{isMandatory : true}}
                                // rules={{ required: isMandatory, ...populators.validation, ...customRules }}
                                />
                                {/* <TextInput
                                    style={{ marginBottom: "0px", wordWrap: "break-word" }}
                                    name={`${formFieldName}.${row.key}.description`}
                                    defaultValue={data?.[row?.key]?.description}
                                    inputRef={register({
                                        maxLength: {
                                            value: 512,
                                            message: t(`WORKS_PATTERN_ERR`)
                                        },
                                        required: true
                                    })}
                                /> */}
                            </div>
                            <div style={errorContainerStyles}>
                                {errors && errors?.[formFieldName]?.[row.key]?.description?.type === "pattern" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_PATTERN_ERR`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.description?.type === "maxLength" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_DESC_LENGTH_EXCEEDED_512`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.description?.type === "required" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                                )}
                            </div>
                        </div>
                    </td>

                    <td style={getStyles(4)}>
                        <div style={cellContainerStyle}>
                            <div>
                                <Controller
                                    defaultValue={data?.[row?.key]?.number || ""}
                                    render={({ onChange, ref, value }) =>
                                        <TextInput
                                            style={{ marginBottom: "0px" }}
                                            defaultValue={data?.[row?.key]?.number || ""}
                                            type={"number"}
                                            name={`${formFieldName}.${row.key}.number`}
                                            onChange={(e) => {
                                                onChange(e)
                                                // setAmountField(e, row)
                                            }}
                                            inputRef={register({
                                                maxLength:{
                                                  value:512,
                                                  message:t(`WORKS_PATTERN_ERR`)
                                                },
                                                required:true
                                            })}
                                        // value={value}
                                        // errorStyle={errors?.[populators.name]}
                                        // max={populators.max}
                                        // disable={disable}
                                        // style={type === "date" ? { paddingRight: "3px" } : ""}
                                        // maxlength={populators?.validation?.maxlength}
                                        // minlength={populators?.validation?.minlength}
                                        />
                                    }
                                    name={`${formFieldName}.${row.key}.number`}
                                    control={control}
                                // rules={{ required: isMandatory, ...populators.validation, ...customRules }}
                                />
                            </div>
                            <div style={errorContainerStyles}>
                                {errors && errors?.[formFieldName]?.[row.key]?.number?.type === "pattern" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_AMOUNT_ERR`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.number?.type === "max" && (
                                    <CardLabelError style={errorCardStyle}>{t(`${populators?.rate?.error}`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.number?.type === "required" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                                )}
                            </div>
                        </div>
                    </td>

                    <td style={getStyles(5)}>
                        <div style={cellContainerStyle}>
                            <div>
                                <Controller
                                    defaultValue={data?.[row?.key]?.length || ""}
                                    render={({ onChange, ref, value }) =>
                                        <TextInput
                                            style={{ marginBottom: "0px" }}
                                            defaultValue={data?.[row?.key]?.length || ""}
                                            type={"number"}
                                            name={`${formFieldName}.${row.key}.length`}
                                            onChange={(e) => {
                                                onChange(e)
                                                // setAmountField(e, row)
                                            }}
                                            inputRef={register({
                                                maxLength:{
                                                  value:512,
                                                  message:t(`WORKS_PATTERN_ERR`)
                                                },
                                                required:true
                                            })}
                                        // value={value}
                                        // errorStyle={errors?.[populators.name]}
                                        // max={populators.max}
                                        // disable={disable}
                                        // style={type === "date" ? { paddingRight: "3px" } : ""}
                                        // maxlength={populators?.validation?.maxlength}
                                        // minlength={populators?.validation?.minlength}
                                        />
                                    }
                                    name={`${formFieldName}.${row.key}.length`}
                                    control={control}
                                // rules={{ required: isMandatory, ...populators.validation, ...customRules }}
                                />
                            </div>
                            <div style={errorContainerStyles}>
                                {errors && errors?.[formFieldName]?.[row.key]?.length?.type === "pattern" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_AMOUNT_ERR`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.length?.type === "max" && (
                                    <CardLabelError style={errorCardStyle}>{t(`${populators?.rate?.error}`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.length?.type === "required" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                                )}
                            </div>
                        </div>
                    </td>

                    <td style={getStyles(6)}>
                        <div style={cellContainerStyle}>
                            <div>
                                <Controller
                                    defaultValue={data?.[row?.key]?.width || ""}
                                    render={({ onChange, ref, value }) =>
                                        <TextInput
                                            style={{ marginBottom: "0px" }}
                                            defaultValue={data?.[row?.key]?.width || ""}
                                            type={"width"}
                                            name={`${formFieldName}.${row.key}.width`}
                                            onChange={(e) => {
                                                onChange(e)
                                                // setAmountField(e, row)
                                            }}
                                            inputRef={register({
                                                maxLength:{
                                                  value:512,
                                                  message:t(`WORKS_PATTERN_ERR`)
                                                },
                                                required:true
                                            })}
                                        // value={value}
                                        // errorStyle={errors?.[populators.name]}
                                        // max={populators.max}
                                        // disable={disable}
                                        // style={type === "date" ? { paddingRight: "3px" } : ""}
                                        // maxlength={populators?.validation?.maxlength}
                                        // minlength={populators?.validation?.minlength}
                                        />
                                    }
                                    name={`${formFieldName}.${row.key}.width`}
                                    control={control}
                                // rules={{ required: isMandatory, ...populators.validation, ...customRules }}
                                />
                            </div>
                            <div style={errorContainerStyles}>
                                {errors && errors?.[formFieldName]?.[row.key]?.width?.type === "pattern" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_AMOUNT_ERR`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.width?.type === "max" && (
                                    <CardLabelError style={errorCardStyle}>{t(`${populators?.rate?.error}`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.width?.type === "required" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                                )}
                            </div>
                        </div>
                    </td>

                    <td style={getStyles(7)}>
                        <div style={cellContainerStyle}>
                            <div>
                                <Controller
                                    defaultValue={data?.[row?.key]?.depth || ""}
                                    render={({ onChange, ref, value }) =>
                                        <TextInput
                                            style={{ marginBottom: "0px" }}
                                            defaultValue={data?.[row?.key]?.depth || ""}
                                            type={"depth"}
                                            name={`${formFieldName}.${row.key}.depth`}
                                            onChange={(e) => {
                                                onChange(e)
                                                // setAmountField(e, row)
                                            }}
                                            inputRef={register({
                                                maxLength:{
                                                  value:512,
                                                  message:t(`WORKS_PATTERN_ERR`)
                                                },
                                                required:true
                                            })}
                                        // value={value}
                                        // errorStyle={errors?.[populators.name]}
                                        // max={populators.max}
                                        // disable={disable}
                                        // style={type === "date" ? { paddingRight: "3px" } : ""}
                                        // maxlength={populators?.validation?.maxlength}
                                        // minlength={populators?.validation?.minlength}
                                        />
                                    }
                                    name={`${formFieldName}.${row.key}.depth`}
                                    control={control}
                                // rules={{ required: isMandatory, ...populators.validation, ...customRules }}
                                />
                            </div>
                            <div style={errorContainerStyles}>
                                {errors && errors?.[formFieldName]?.[row.key]?.depth?.type === "pattern" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_AMOUNT_ERR`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.depth?.type === "max" && (
                                    <CardLabelError style={errorCardStyle}>{t(`${populators?.rate?.error}`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.depth?.type === "required" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                                )}
                            </div>
                        </div>
                    </td>

                    <td style={getStyles(8)}>
                        <div style={cellContainerStyle}>
                            <div>
                                <Controller
                                    defaultValue={data?.[row?.key]?.quantity || ""}
                                    render={({ onChange, ref, value }) =>
                                        <TextInput
                                            style={{ marginBottom: "0px" }}
                                            defaultValue={data?.[row?.key]?.quantity || ""}
                                            type={"number"}
                                            name={`${formFieldName}.${row.key}.quantity`}
                                            disable={true}
                                            onChange={(e) => {
                                                onChange(e)
                                                // setAmountField(e, row)
                                            }}
                                            inputRef={register({
                                                maxLength:{
                                                  value:512,
                                                  message:t(`WORKS_PATTERN_ERR`)
                                                },
                                                required:true
                                            })}
                                        // value={value}
                                        // errorStyle={errors?.[populators.name]}
                                        // max={populators.max}
                                        // disable={disable}
                                        // style={type === "date" ? { paddingRight: "3px" } : ""}
                                        // maxlength={populators?.validation?.maxlength}
                                        // minlength={populators?.validation?.minlength}
                                        />
                                    }
                                    name={`${formFieldName}.${row.key}.quantity`}
                                    control={control}
                                // rules={{ required: isMandatory, ...populators.validation, ...customRules }}
                                />
                            </div>
                            <div style={errorContainerStyles}>
                                {errors && errors?.[formFieldName]?.[row.key]?.quantity?.type === "pattern" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_AMOUNT_ERR`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.quantity?.type === "max" && (
                                    <CardLabelError style={errorCardStyle}>{t(`${populators?.rate?.error}`)}</CardLabelError>
                                )}
                                {errors && errors?.[formFieldName]?.[row.key]?.quantity?.type === "required" && (
                                    <CardLabelError style={errorCardStyle}>{t(`WORKS_REQUIRED_ERR`)}</CardLabelError>
                                )}
                            </div>
                        </div>
                    </td>

                    <td style={getStyles(9)}>
                        <div style={cellContainerStyle}>
                            {(
                                <span onClick={() => removeRow(row)} className="icon-wrapper">
                                    <DeleteIcon fill={"#B1B4B6"} />
                                </span>
                            )}
                        </div>
                        <div style={errorContainerStyles}></div>
                    </td>
                </tr>

            );
        });
    }, [rows, formData, formData?.[formFieldName]])


    return (
        <table key={`${formFieldNames} + ${indexValue}`} className="table reports-table sub-work-table" style={{ marginTop: "1rem" }}>
            <thead>
                <tr>{renderHeader()}</tr>
            </thead>
            <tbody>
                {renderBody}
                <tr>
                    <td colSpan={1}></td>
                    <td colSpan={6} style={{ textAlign: "right", fontWeight: "600" }}>
                        <div style={{ display: "flex", justifyContent: 'space-between' }}>
                            <div>
                                <span onClick={addRow}>
                                    <label style={{ marginLeft: "10px", fontWeight: "600", color: "#F47738", border: "1px solid #F47738", padding: "10px", borderRadius: "4px" }}>{t("Add Row")}</label>
                                </span>
                                <span onClick={onReset}>
                                    <label style={{ marginLeft: "10px", fontWeight: "600", color: "#F47738", border: "1px solid #F47738", padding: "10px", borderRadius: "4px" }}>{t("Reset")}</label>
                                </span>
                                <span onClick={onDoneClick}>
                                    <label style={{ marginLeft: "10px", fontWeight: "600", color: "#F47738", border: "1px solid #F47738", padding: "10px", borderRadius: "4px" }}>{t("Done")}</label>
                                </span>
                            </div>
                            <div>{t("Sub Total")}</div>
                        </div>
                    </td>
                    <td colSpan={1} style={{ textAlign: "right" }}>
                        {Digit.Utils.dss.formatterWithoutRound(totalAmount, "number")}
                    </td>
                    <td colSpan={1}></td>
                </tr>
            </tbody>
        </table>
    );
};

export default MeasurementSheetTable;
