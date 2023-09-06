import { Card, LabelFieldPair, CardLabel, TextInput, SubmitBar } from '@egovernments/digit-ui-react-components'
import React, { Fragment, useState, useEffect } from 'react'

const SearchSORinSOR = (props) => {
    const { t, register, errors } = props
    const formFieldName = "searchSORinSORv1"
    return (
        <>
            <LabelFieldPair>
                <CardLabel style={{ fontSize: "16px", fontStyle: "bold", fontWeight: "600" }}>{`${t(`WORKS_SEARCH_SOR`)}:`}</CardLabel>
                <TextInput
                    className={"field"}
                    placeholder={t("WORKS_SOR_INPUT_PLACEHOLDER")}
                    textInputStyle={{ width: "31%" }}
                    inputRef={register({
                        required: false,
                        pattern: /^[a-zA-Z0-9_ .$@#\/ ]*$/
                    })}
                    name={`${formFieldName}.sor`}
                />
                <div style={{ alignSelf: 'flex-start', marginLeft: "1rem" }} >
                    <SubmitBar
                        label={t("SOR_ADD")}
                        onSubmit={() => {}}
                    />
                </div>
            </LabelFieldPair>
        </>
    )
}

export default SearchSORinSOR;