import React from "react";
import ReCAPTCHA from "react-google-recaptcha";


const Captcha = (props) => {


    //use this key if running locally 6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI
    const key = globalConfigs?.getConfig("RECAPTCHA_SITE_KEY");

    const onChange = (value) => {
        if(value)
        props.setValue("captcha",value);
    }
    return(
        <div style={{marginBottom:"20px"}}>
        <ReCAPTCHA
            sitekey={key}
            onChange={onChange}
        />
        </div>
    )
}

export default Captcha;