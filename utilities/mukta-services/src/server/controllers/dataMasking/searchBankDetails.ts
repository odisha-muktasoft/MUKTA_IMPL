// import * as express from "express";
// import { search_bank_account } from "../../api/index";// Import bank account service API function
// import { errorResponder, sendResponse } from "../../utils/index";

// // Define the BankAccountController class
// class BankAccountController {
//   public path = "/bankaccount/v1";
//   public router = express.Router();

//   constructor() {
//     this.initializeRoutes();
//   }

//   public initializeRoutes() {
//     this.router.post(`${this.path}/_search`, this.getBankAccountDetails);
//   }

//   // Function to mask the IFSC code in the response
//   private maskIfscCode(ifscCode: string): string {
//     return ifscCode ? "****" + ifscCode.slice(-4) : "****";
//   }

//   // Main handler for retrieving and masking bank account details
//   public getBankAccountDetails = async (
//     request: express.Request,
//     response: express.Response
//   ) => {
//     try {
//     console.log(request,"rrrr");
//       const { RequestInfo, bankAccountDetails } = request.body;
      
//       // Call the bank account service API
//       const bankAccountResponse = await search_bank_account(
//         bankAccountDetails, RequestInfo
//       );

//       console.log(bankAccountResponse,"bankssss");
//       //console.log(bankAccountResponse[0].bankAccountDetails,"response");
//       // Mask IFSC code in the response data
//       const maskedBankAccountDetails = bankAccountResponse?.bankAccounts.map(
//         (account: any) => ({
//           ...account,
//           bankAccountDetails: [{
//             ...account?.bankAccountDetails[0],
//             bankBranchIdentifier:{
//                 ...account?.bankAccountDetails[0]?.bankBranchIdentifier,
//                 code : this.maskIfscCode(account?.bankAccountDetails[0].bankBranchIdentifier?.code)
//             }
//           }]
//         })
//       );

//       // Send the masked response
//       return sendResponse(
//         response,
//         { bankAccountDetails: maskedBankAccountDetails },
//         request
//       );
//     } catch (error) {
//       console.error("Error fetching bank account details:", error);
//       return errorResponder(
//         { error: "Internal Server Error" },
//         request,
//         response
//       );
//     }
//   };
// }

// // Export the BankAccountController class
// export default BankAccountController;

import * as express from "express";
import { search_bank_account } from "../../api/index"; // Import bank account service API function
import { errorResponder, sendResponse } from "../../utils/index";

// Define the BankAccountController class
class BankAccountController {
  public path = "/bankaccount/v1";
  public router = express.Router();

  constructor() {
    this.initializeRoutes();
  }

  public initializeRoutes() {
    this.router.post(`${this.path}/_search`, this.getBankAccountDetails);
  }

  // Function to mask attributes based on pattern
  private applyMask(value: string, pattern: string): string {
    console.log(value,"value")
    console.log(value ? value.replace(new RegExp(pattern, "g"), "*") : "","maskinggg")
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

  // Main handler for retrieving and masking bank account details
  public getBankAccountDetails = async (
    request: express.Request,
    response: express.Response
  ) => {
    try {
      const { RequestInfo, bankAccountDetails } = request.body;
      const roles = RequestInfo.userInfo.roles.map((role: any) => role.code);
      
      // Call the bank account service API
      const bankAccountResponse = await search_bank_account(bankAccountDetails, RequestInfo);

      // Masking patterns from config
      const patterns = [
        { patternId: "001", pattern: ".(?=.{4})" },
        { patternId: "009", pattern: "(?<=.{4}).(?=.{2})" },
      ];

      // Security policy configuration (replace with actual config)
      const securityPolicy = {
        model: "BankAccountSearch",
        attributes: [
          { name: "accountHolderName", jsonPath: "accountHolderName", patternId: "001", defaultVisibility: "MASKED" },
          { name: "accountNumber", jsonPath: "accountNumber", patternId: "001", defaultVisibility: "MASKED" },
          { name: "ifscCode", jsonPath: "bankBranchIdentifier/code", patternId: "009", defaultVisibility: "MASKED" }
        ],
        roleBasedDecryptionPolicy: [
          {
            roles: ["BILL_ACCOUNTANT", "MUKTA_ADMIN"],
            attributeAccessList: [
              { attribute: "accountHolderName", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "accountNumber", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" },
              { attribute: "ifscCode", firstLevelVisibility: "PLAIN", secondLevelVisibility: "PLAIN" }
            ]
          }
        ]
      };

      // Mask bank account details based on role and config
      const maskedBankAccountDetails = bankAccountResponse?.bankAccounts.map((account: any) => {
        let maskedAccount = { ...account };

        // Iterate through the attributes in the security policy
        securityPolicy.attributes.forEach((attributeConfig: any) => {
          const { name, jsonPath, patternId } = attributeConfig;
          const pattern = this.getPatternById(patternId, patterns);

          // Extract the value using jsonPath and check if it needs to be masked
          const attributeValue = this.getJsonPathValue(account?.bankAccountDetails?.[0], jsonPath);

          if (this.hasRoleAccess(roles, name, securityPolicy)) {
            // If the role has access, leave the value as plain text
            console.log("roleaccesss")
            this.setJsonPathValue(maskedAccount?.bankAccountDetails?.[0], jsonPath, attributeValue);
          } else {
            console.log("notroleaccesss")
            // Mask the value using the configured pattern
            const maskedValue = this.applyMask(attributeValue, pattern);
            this.setJsonPathValue(maskedAccount?.bankAccountDetails?.[0], jsonPath, maskedValue);
          }
        });

        return maskedAccount;
      });

      // Format the final response structure
      const responseObj = {
        ResponseInfo: {
          apiId: "Rainmaker",  // You can replace this with the actual API ID from the request
          ver: null,
          ts: null,
          resMsgId: "uief87324", // Replace with actual message ID
          msgId: "1731563695293|en_IN", // Replace with actual message ID
          status: "successful"
        },
        bankAccounts: maskedBankAccountDetails,  // The bank accounts with masked/unmasked values
        pagination: {
          limit: 10.0,
          offSet: 0.0,
          totalCount: 1.0,
          sortBy: null,
          order: null
        }
      };

      return sendResponse(response, responseObj, request);
    } catch (error) {
      console.error("Error fetching bank account details:", error);
      return errorResponder(
        { error: "Internal Server Error" },
        request,
        response
      );
    }
  };

  // Helper function to get the value from a nested JSON object using a JSON path
  private getJsonPathValue(obj: any, path: string): string {
    return path.split("/").reduce((acc, part) => acc && acc[part], obj);
  }

  // Helper function to set a value in a nested JSON object using a JSON path
  private setJsonPathValue(obj: any, path: string, value: any): void {
    const parts = path.split("/");
    const lastPart = parts.pop();
    const lastObj = parts.reduce((acc, part) => acc[part] = acc[part] || {}, obj);
    lastObj[lastPart!] = value;
  }
}

// Export the BankAccountController class
export default BankAccountController;
