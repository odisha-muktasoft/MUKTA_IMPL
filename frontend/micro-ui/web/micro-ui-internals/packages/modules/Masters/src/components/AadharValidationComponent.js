import { Button, TextInput } from '@egovernments/digit-ui-react-components';
import React, { useState, useEffect } from 'react';

const AadharValidationComponent = ({ data, setValue }) => {
  console.log(data);
  const [aadharNumber, setAadharNumber] = useState('');
  const [validationResult, setValidationResult] = useState('');
  const [showValidateButton, setShowValidateButton] = useState(true);
  const [showSuccessMessage, setShowSuccessMessage] = useState(false);
  const [isVerified, setIsVerified] = useState(false); // New state variable for verification status


  useEffect(() => {
    // Set the Aadhaar number from data when the component mounts
    setAadharNumber(data.basicDetails_aadhar);
  }, [data.basicDetails_aadhar]); // Update the state when the Aadhaar number changes

  const handleAadharChange = (event) => {
    const newValue = event.target.value;
    setAadharNumber(newValue);
    setShowValidateButton(true); // Show the validate button again
    setShowSuccessMessage(false); // Hide the success message
    setValue("basicDetails_aadhar", newValue);
  };

  const handleValidateClick = () => {
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
      name: data.basicDetails_wageSeekerName, // Use basicDetails_wageSeekerName if doc is AADHAAR
      dob: "",
      gender: "",
      rdInfo: "",
      rdData: "",
      otpValue: ""
    };

    // Make the API call
    fetch('http://164.100.141.79/authekycv4/api/authenticate', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(requestBody)
    })
      .then(response => response.json())
      .then(data => {
        // Check the status field in the response
        if (data.status === "SUCCESS") {
          setShowSuccessMessage(true);
          setIsVerified(true);
        } else if (data.status === "ERROR") {
          setShowSuccessMessage(false);
          setShowValidateButton(false);
          setIsVerified(false);
        } else {
          // Handle other status values
          setValidationResult('Unknown error occurred.');
          setIsVerified(false);
        }
        setValue("isVerified", isVerified);
      })
      .catch(error => {
        // Handle errors
        console.error('Error:', error);
        setValidationResult('An error occurred while validating Aadhaar.');
        setIsVerified(false);
        setValue("isVerified", isVerified);
      });
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
          disabled={false} // Set read-only based on state
        />
        {showSuccessMessage ? (
          <div style={{ backgroundColor: 'white', display: 'flex', alignItems: 'center', marginLeft: '20px', marginBottom: '25px' }}>
            <div style={{ backgroundColor: '#4CAF50', borderRadius: '50%', width: '20px', height: '20px', display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
              <span style={{ color: 'white', fontWeight: 'bold' }}>&#10004;</span>
            </div>
            <span style={{ color: '#4CAF50', fontWeight: 'bold', whiteSpace: 'nowrap' }}>Aadhaar validated successfully!</span>
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
          <div style={{ backgroundColor: 'white', display: 'flex', alignItems: 'center', marginLeft: '20px', marginBottom: '25px' }}>
            <div style={{ backgroundColor: 'white', borderRadius: '50%', width: '20px', height: '20px', display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
              <span style={{ color: 'white', fontWeight: 'bold' }}>❌</span>
            </div>
            <span style={{ color: 'red', fontWeight: 'bold', whiteSpace: 'nowrap' }}>Aadhaar validation failed!</span>
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
