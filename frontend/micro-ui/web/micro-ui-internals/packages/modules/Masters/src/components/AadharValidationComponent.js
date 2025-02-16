import { Button, TextInput } from '@egovernments/digit-ui-react-components';
import React, { useState, useEffect } from 'react';

const AadharValidationComponent = ({ data, setValue }) => {
  const [aadharNumber, setAadharNumber] = useState('');
  const [validationResult, setValidationResult] = useState('');
  const [showValidateButton, setShowValidateButton] = useState(true);
  const [showSuccessMessage, setShowSuccessMessage] = useState(false);
  const [isVerified, setIsVerified] = useState(data.basicDetails_isVerified);


  useEffect(() => {
    setAadharNumber(data.basicDetails_aadhar);
  }, [data.basicDetails_aadhar]);

  useEffect(() => {
    setIsVerified(data.basicDetails_isVerified);
  }, [data.basicDetails_isVerified]);

  useEffect(() => {
    setIsVerified(data.basicDetails_aadhaarResponse);
  }, [data.basicDetails_aadhaarResponse]);

  const handleAadharChange = (event) => {
    const newValue = event.target.value;
    setAadharNumber(newValue);
    setShowValidateButton(true);
    setShowSuccessMessage(false);
    setValue("basicDetails_aadhar", newValue);
  };

  const handleValidateClick = async () => {
    try {
      const requestBody = {
        uid: aadharNumber,
        uidType: "A",
        consent: "Y",
        subAuaCode: "0002590000",
        txn: "",
        isPI: "y",
        isBio: "n",
        isOTP: "n",
        bioType: "n",
        name: data.basicDetails_wageSeekerName,
        dob: "",
        gender: "",
        rdInfo: "",
        rdData: "",
        otpValue: ""
      };
  
      const response = await fetch('http://164.100.141.79/authekycv4/api/authenticate', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(requestBody)
      });
  
      const responseData = await response.json();
  
      if (responseData.status === "SUCCESS") {
        setShowSuccessMessage(true);
        setValue("basicDetails_isVerified", true);
        setValue("basicDetails_aadhaarResponse", JSON.stringify(responseData));
        setIsVerified(true);
      } else if (responseData.status === "ERROR") {
        setShowSuccessMessage(false);
        setShowValidateButton(false);
        setValue("basicDetails_isVerified", false);
        setIsVerified(false);
      } else {
        setValidationResult('Unknown error occurred.');
        setIsVerified(false);
      }
      setValue("isVerified", isVerified);
    } catch (error) {
      setValidationResult('An error occurred while validating Aadhaar.');
      setIsVerified(false);
      setValue("isVerified", isVerified);
    }
  };  

  if (data.basicDetails_doc.name === "Aadhaar") {
    return (
      <div style={{ display: 'flex' }}>
        <TextInput
          type="text"
          value={aadharNumber}
          onChange={handleAadharChange}
          placeholder="Identity Number"
          style={{
            border: '1px solid black',
            padding: '5px'
          }}
          disabled={false}
        />
        {showSuccessMessage ? (
          <div style={{ backgroundColor: '#BAD6C9', display: 'flex', alignItems: 'center', marginLeft: '20px', marginBottom: '25px', borderRadius: '5px' }}>
            <div style={{ backgroundColor: '#00703C', borderRadius: '50%', width: '20px', height: '20px', display: 'flex', justifyContent: 'center', alignItems: 'center', marginLeft: '5px' }}>
              <span style={{ color: 'white', fontWeight: 'bold' }}>&#10004;</span>
            </div>
            <span style={{ color: '#00703C', fontWeight: 'bold', whiteSpace: 'nowrap', padding: '5px' }}>Aadhaar validated successfully!</span>
          </div>
        ) : showValidateButton ? (
          <Button
            label={"Validate"}
            variation="secondary"
            onButtonClick={handleValidateClick}
            type="button"
            style={{
              marginLeft: '20px',
              marginBottom: '25px'
            }}
          />
        ) : (
          <div style={{ backgroundColor: '#EFC7C1', display: 'flex', alignItems: 'center', marginLeft: '20px', marginBottom: '25px', borderRadius: '5px' }}>
            <div style={{ backgroundColor: '#D63E26', borderRadius: '50%', width: '20px', height: '20px', display: 'flex', justifyContent: 'center', alignItems: 'center', marginLeft: '5px' }}>
              <span style={{ color: '#EAAFA6', fontWeight: 'bold' }}>!</span>
            </div>
            <span style={{ color: '#D63E26', fontWeight: 'bold', whiteSpace: 'nowrap' }}>&nbsp;Aadhaar validation failed!</span>
          </div>
        )}

        <div>{validationResult}</div>
      </div>
    );
  }

  if (data.basicDetails_doc.name === "AADHAAR"){
    return (
      <div style={{ display: 'flex', flexDirection: 'row', alignItems: 'center' }}>
        <TextInput
          type="text"
          value={aadharNumber}
          onChange={handleAadharChange}
          placeholder="Identity Number"
          disabled={true}
        />
        <div>{validationResult}</div>
      </div>
    );
  }
  return (
    <div style={{ display: 'flex', flexDirection: 'row', alignItems: 'center' }}>
      <TextInput
        type="text"
        value={aadharNumber}
        onChange={handleAadharChange}
        placeholder="Identity Number"
        disabled={false}
      />
      <div>{validationResult}</div>
    </div>
  );
};

export default AadharValidationComponent;
