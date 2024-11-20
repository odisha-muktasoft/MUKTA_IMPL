import * as express from "express";
import { search_individual_2 } from "../../api/index";
// import {
//   search_mdms
// } from "../../api/index";
import { errorResponder, sendResponse } from "../../utils/index";

// Define the BankAccountController class
class IndividualController {
  public path = "/individual/v1";
  public router = express.Router();

  constructor() {
    this.initializeRoutes();
  }

  public initializeRoutes() {
    this.router.post(`${this.path}/_search`, this.getIndividual);
  }

  // Function to mask attributes based on pattern
  private applyMask(value: string, pattern: string): string {
    return value ? value.replace(new RegExp(pattern, "g"), "*") : "";
  }

  // Check if the role has access to view the attribute in plain text
  private hasRoleAccess(roles: string[], attribute: string, policy: any): boolean {
    const roleBasedPolicy = policy.roleBasedDecryptionPolicy.find((policy: any) =>
      policy.roles.some((role: string) => roles.includes(role))
    );
    
    if (!roleBasedPolicy) return false;
    
    const attributeAccess = roleBasedPolicy.attributeAccessList.find((access: any) => access.attribute === attribute);
    
    return attributeAccess ? attributeAccess.firstLevelVisibility === "PLAIN" && attributeAccess.secondLevelVisibility === "PLAIN" : false;
  }

  // Function to get the masking pattern for an attribute
  private getPatternById(patternId: string, patterns: any[]): string {
    const pattern = patterns.find((p) => p.patternId === patternId);
    return pattern ? pattern.pattern : "";
  }

  // private async fetchMDMSConfig(tenantid:string, RequestInfo: any) {
  //   const tenantId = tenantid;
  //   const promises = [
  //     search_mdms(
  //       tenantId,
  //       "DataSecurity",
  //       "MaskingPatterns",
  //       RequestInfo
      
  //     ),
  //     search_mdms(
  //       tenantId,
  //       "commonMuktaUiConfig",
  //       "MaskingUIConfig",
  //       RequestInfo
  //     )
  //   ];

  //   const [maskingPatterns, MaskingUIConfig] = await Promise.all(promises);
  //   return {
  //     securityPolicy: MaskingUIConfig,
  //     maskingPatterns: maskingPatterns,
  //   };
  // }

  // Main handler for retrieving and masking bank account details
  public getIndividual = async (
    request: express.Request,
    response: express.Response
  ) => {
    try {
      const { RequestInfo, Individual } = request.body;
      // const { tenantId } = request.params;
      const tenantId = "od.testing";
      const roles = RequestInfo.userInfo.roles.map((role: any) => role.code);
      
      // Call the bank account service API
      const individualResponse = await search_individual_2(Individual?.individualId, tenantId, request.body);

      // Masking patterns from config
      const patterns = [
        { patternId: "000", pattern: "." },
        { patternId: "001", pattern: ".(?=.{2})" },
        { patternId: "002", pattern: "(?<=.{0}\\w)\\w" },
        { patternId: "003", pattern: "(?<=.{1})." },
        { patternId: "004", pattern: "(?<=^.{0}|^.{1}|^.{3}|^.{4})." },
        { patternId: "005", pattern: "(?<=.)(.*?)(?=.*.$)(?=.@)" },
        { patternId: "009", pattern: "(?<=.{4}).(?=.{2})" },
      ];

      // Security policy configuration (replace with actual config)
      const securityPolicy = {
        model: "individualSearch",
        attributes: [
          { name: "identifierId", jsonPath: "identifiers/*/identifierId", patternId: "000", defaultVisibility: "MASKED" },
          { name: "fatherName", jsonPath: "fatherName", patternId: "002", defaultVisibility: "MASKED" },
          { name: "husbandName", jsonPath: "husbandName", patternId: "002", defaultVisibility: "MASKED" },
          { name: "relationship", jsonPath: "relationship", patternId: "000", defaultVisibility: "MASKED" },
          { name: "doorNo", jsonPath: "address/*/doorNo", patternId: "003", defaultVisibility: "MASKED" },
          { name: "street", jsonPath: "address/*/street", patternId: "003", defaultVisibility: "MASKED" },
          { name: "locality", jsonPath: "address/*/locality", patternId: "003", defaultVisibility: "MASKED" },
          { name: "ward", jsonPath: "address/*/ward", patternId: "003", defaultVisibility: "MASKED" },
          { name: "city", jsonPath: "address/*/city", patternId: "003", defaultVisibility: "MASKED" },
          { name: "dateOfBirth", jsonPath: "dateOfBirth", patternId: "004", defaultVisibility: "MASKED" },
          { name: "gender", jsonPath: "gender", patternId: "000", defaultVisibility: "MASKED" },
          { name: "mobileNumber", jsonPath: "mobileNumber", patternId: "001", defaultVisibility: "MASKED" },
          { name: "socialCategory", jsonPath: "additionalFields/fields/key=SOCIAL_CATEGORY/value", patternId: "000", defaultVisibility: "MASKED" },
          { name: "email", jsonPath: "email", patternId: "005", defaultVisibility: "MASKED" },
          //{ name: "photo", jsonPath: "photo", patternId: "000", defaultVisibility: "MASKED" },
        ],
        roleBasedDecryptionPolicy: [
          {
            roles: ["BILL_ACCOUNTANT", "MUKTA_ADMIN"],
            attributeAccessList: [
              { attribute: "identifierId", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "fatherName", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "husbandName", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "doorNo", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "street", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "locality", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "ward", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "city", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "dateOfBirth", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "mobileNumber", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "email", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
            ]
          }
        ]
      };

      // let { securityPolicy, maskingPatterns : patterns } = await this.fetchMDMSConfig(tenantId, RequestInfo);
      // securityPolicy = securityPolicy.filter((ob: any) => ob?.model === "IndividualSearch")?.[0];

      // Mask bank account details based on role and config
      const maskedIndividual = individualResponse?.Individual.map((details: any) => {
        let maskedDetails = { ...details };

        // Iterate through the attributes in the security policy
        securityPolicy.attributes.forEach((attributeConfig: any) => {
          const { name, jsonPath, patternId } = attributeConfig;
          const pattern = this.getPatternById(patternId, patterns);


          if (this.hasRoleAccess(roles, name, securityPolicy)) {
            this.changeValue(maskedDetails, jsonPath, false, pattern);
          } else {
            this.changeValue(maskedDetails, jsonPath, true, pattern);
          }
        });

        return maskedDetails;
      });

      // Format the final response structure
      const responseObj = {
        ResponseInfo: individualResponse?.ResponseInfo,
        individual: maskedIndividual,  // Individual with masked/unmasked values
        TotatCount: individualResponse?.TotatCount
      };

      return sendResponse(response, responseObj, request);
    } catch (error) {
      console.error("Error fetching individual:", error);
      return errorResponder(
        { error: "Internal Server Error" },
        request,
        response
      );
    }
  };

  // Function to handle changing value based on the role access and mask requirement
  private changeValue(obj: any, path: string, mask: boolean, pattern: string): void {
    const pathParts = path.split("/");
    let currentObj = obj;

    // Iterate through the path parts to find the correct position to update the value
    for (let i = 0; i < pathParts.length; i++) {
      const part = pathParts[i];

      if (part === "*") {
        if (Array.isArray(currentObj)) {
          // Iterate through array if '*' is found
          currentObj.forEach(item => {
            if (item && typeof item === 'object') {
              // Recursively call changeValue for each item in the array
              this.changeValue(item, pathParts.slice(i + 1).join("/"), mask, pattern);
            }
          });
          return;
        }
      } else if (part.includes("=")) {
        if (Array.isArray(currentObj)) {
          const key = part.split("=")[0];
          const value = part.split("=")[1];
          currentObj.forEach(item => {
            if (item && typeof item === 'object' && item[key] === value) {
              // Recursively call changeValue for each item in the array
              this.changeValue(item, pathParts.slice(i + 1).join("/"), mask, pattern);
            }
          });
          return;
        }
      } else {
        if (i === pathParts.length - 1) {
          // At the last part, update the value based on mask
          const currentValue = currentObj[part];
          if (currentValue) {
            if (mask) {
              if ( part === "locality" || part === "ward") {
                if (currentValue.additionalDetails) {
                  currentValue.additionalDetails.isMasked = true;
                } else {
                  currentValue.additionalDetails = {
                    isMasked: true
                  }
                }
              } else {
                // Mask the value using the configured pattern if mask is true
                const maskedValue = this.applyMask(currentValue, pattern);
                currentObj[part] = maskedValue;
              }
            } else {
              if ( part === "locality" || part === "ward") {
                if (currentValue.additionalDetails) {
                  currentValue.additionalDetails.isMasked = false;
                } else {
                  currentValue.additionalDetails = {
                    isMasked: false
                  }
                }
              } else {
                currentObj[part] = currentValue;
              }
            }
          }
        } else {
          // Navigate deeper into the object
          if (!currentObj[part]) {
            currentObj[part] = {}; // Create new object if it doesn't exist
          }
          currentObj = currentObj[part];
        }
      }
    }
  }
}

// Export the IndividualController class
export default IndividualController;
