package org.egov.validator;

import com.jayway.jsonpath.JsonPath;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import org.egov.common.contract.request.RequestInfo;
import org.egov.repository.BankAccountRepository;
import org.egov.service.EncryptionService;
import org.egov.service.EnrichmentService;
import org.egov.tracer.model.CustomException;
import org.egov.util.IndividualUtil;
import org.egov.util.OrganisationUtil;
import org.egov.web.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;

import java.util.*;

import static org.egov.service.BankAccountService.BANK_ACCOUNT_NUMBER_ENCRYPT_KEY;
import static org.egov.util.BankAccountConstant.IND;
import static org.egov.util.BankAccountConstant.ORG;

@Component
@Slf4j
public class BankAccountValidator {

    @Autowired
    private IndividualUtil individualUtil;

    @Autowired
    private OrganisationUtil organisationUtil;

    @Autowired
    private EncryptionService encryptionService;

    @Autowired
    private BankAccountRepository bankAccountRepository;
    @Autowired
    private EnrichmentService enrichmentService;

    public static final String jsonPathForInds = "$.Individual.*.id";

    public static final String jsonPathForOrgs = "$.organisations.*.id";



    /**
     * validate the search bank account
     *
     * @param searchRequest
     */
    public void validateBankAccountOnSearch(BankAccountSearchRequest searchRequest) {
        log.info("BankAccountValidator::validateSearchBankAccount");
        BankAccountSearchCriteria searchCriteria = searchRequest.getBankAccountDetails();
        RequestInfo requestInfo = searchRequest.getRequestInfo();
        if (searchCriteria == null) {
            throw new CustomException("BANK_ACCOUNTS_SEARCH_CRITERIA_REQUEST", "Bank accounts search criteria request is mandatory");
        }
        if (StringUtils.isBlank(searchCriteria.getTenantId())) {
            throw new CustomException("TENANT_ID", "TenantId is mandatory");
        }
//        if (searchCriteria.getIds() != null && !searchCriteria.getIds().isEmpty() && searchCriteria.getIds().size() > 10) {
//            throw new CustomException("IDS", "Ids should be of max 10.");
//        }

    }

    /**
     * Validate the create Bank account and its details
     *
     * @param bankAccountRequest
     */
    public void validateBankAccountOnCreate(BankAccountRequest bankAccountRequest) {
        log.info("BankAccountValidator::validateBankAccountOnCreate");
        Map<String, String> errorMap = new HashMap<>();
        List<BankAccount> bankAccountList = bankAccountRequest.getBankAccounts();
        RequestInfo requestInfo = bankAccountRequest.getRequestInfo();

        validateRequestInfo(requestInfo, errorMap);
        validateBankAccount(bankAccountList, errorMap);

        checkAccNumberAndIfscCodeLinkedToOtherBenefeciaryOrNot(bankAccountRequest, errorMap,Boolean.TRUE);

        validateOrgIdAndIndId(bankAccountRequest, errorMap);

        if (!errorMap.isEmpty())
            throw new CustomException(errorMap);
    }
    
    public void validateBankAccountOnUpdate(BankAccountRequest bankAccountRequest) {
        log.info("Validate bank account on update. Correlation ID: " + bankAccountRequest.getRequestInfo().getCorrelationId());
        Map<String, String> errorMap = new HashMap<>();
        List<BankAccount> bankAccountList = bankAccountRequest.getBankAccounts();
        RequestInfo requestInfo = bankAccountRequest.getRequestInfo();

        validateRequestInfo(requestInfo, errorMap);
        validateOnUpdate(bankAccountList, errorMap);
        checkAccNumberAndIfscCodeLinkedToOtherBenefeciaryOrNot(bankAccountRequest, errorMap,Boolean.FALSE);
        validateOrgIdAndIndId(bankAccountRequest, errorMap);

        if (!errorMap.isEmpty())
            throw new CustomException(errorMap);
    }

    /**
     * Validate the individual and organisation ids from the individual and organisation service respectively
     *
     * @param bankAccountRequest
     * @param errorMap
     */
    private void validateOrgIdAndIndId(BankAccountRequest bankAccountRequest, Map<String, String> errorMap) {
        log.info("BankAccountValidator::validateOrgIdAndIndId");
        RequestInfo requestInfo = bankAccountRequest.getRequestInfo();
        String tenantId = bankAccountRequest.getBankAccounts().get(0).getTenantId();
        List<BankAccount> bankAccounts = bankAccountRequest.getBankAccounts();

        Map<String, List<String>> serviceCodeIdsMap = new HashMap<>();

        for (BankAccount bankAccount : bankAccounts) {
            // If the service code already exists in the map, add the reference id to the existing list
            if (serviceCodeIdsMap.containsKey(bankAccount.getServiceCode())) {
                serviceCodeIdsMap.get(bankAccount.getServiceCode()).add(bankAccount.getReferenceId());
            }
            // If the service code does not exist in the map, create a new list and add the reference id to it
            else {
                List<String> refIds = new ArrayList<>();
                refIds.add(bankAccount.getReferenceId());
                serviceCodeIdsMap.put(bankAccount.getServiceCode(), refIds);
            }
        }


        if (serviceCodeIdsMap.containsKey(ORG)) {
            List<String> refOrgIds = serviceCodeIdsMap.get(ORG);
            Object orgRes = organisationUtil.fetchOrganisationDetails(refOrgIds, requestInfo, tenantId);
            if (ObjectUtils.isEmpty(orgRes)) {
                throw new CustomException("REFERENCE.ORGANISATION_IDS", "Organisation reference ids are invalid");
            }

            List<Object> orgJsonRes = null;
            try {
                orgJsonRes = JsonPath.read(orgRes, jsonPathForOrgs);
            } catch (Exception e) {
                log.error(e.getMessage());
                throw new CustomException("JSONPATH_ERROR", "Failed to parse Organisation response");
            }

            for (String id : refOrgIds) {
                if (!orgJsonRes.contains(id)) {
                    errorMap.put("REFERENCE.ORGANISATION_IDS", "Reference -organisation with id(s) : " + refOrgIds + " doesn't exist");
                }
            }
        }
        if (serviceCodeIdsMap.containsKey(IND)) {
            List<String> refIndividualIds = serviceCodeIdsMap.get(IND);
            Object individualRes = individualUtil.fetchIndividualDetails(refIndividualIds, requestInfo, tenantId);
            if (ObjectUtils.isEmpty(individualRes)) {
                throw new CustomException("REFERENCE.INDIVIDUAL_IDS", "Individual reference ids are invalid");
            }

            List<Object> indRes = null;
            try {
                indRes = JsonPath.read(individualRes, jsonPathForInds);
            } catch (Exception e) {
                log.error(e.getMessage());
                throw new CustomException("JSONPATH_ERROR", "Failed to parse individual response");
            }

            for (String refIndId : refIndividualIds) {
                if (!indRes.contains(refIndId)) {
                    errorMap.put("REFERENCE.INDIVIDUAL_IDS", "Reference -individual with id(s) : " + refIndId + " doesn't exist");
                }
            }
        }

    }

    private void validateBankAccount(List<BankAccount> bankAccountList, Map<String, String> errorMap) {
        log.info("BankAccountValidator::validateBankAccount");
        if (CollectionUtils.isEmpty(bankAccountList)) {
            throw new CustomException("BANK_ACCOUNTS", "Bank account is mandatory");
        }
        for (BankAccount bankAccount : bankAccountList) {
        	
            if (StringUtils.isBlank(bankAccount.getTenantId())) {
                throw new CustomException("TENANT_ID", "Tenant id is mandatory");
            }
            if (StringUtils.isBlank(bankAccount.getReferenceId())) {
                throw new CustomException("REFERENCE_ID", "Reference id is mandatory");
            }
            if (StringUtils.isBlank(bankAccount.getServiceCode())) {
                throw new CustomException("SERVICE_CODE", "Service code is mandatory");
            }

            List<BankAccountDetails> bankAccountDetailsList = bankAccount.getBankAccountDetails();
            if (CollectionUtils.isEmpty(bankAccountDetailsList)) {
                throw new CustomException("BANK_ACCOUNT_DETAILS", "Bank account details are mandatory");
            }

            for (BankAccountDetails bankAccountDetails : bankAccountDetailsList) {
           
                if (StringUtils.isBlank(bankAccountDetails.getTenantId())) {
                    throw new CustomException("BANK_ACCOUNT_DETAILS.TENANT_ID", "Tenant id is mandatory");
                }
                if (StringUtils.isBlank(bankAccountDetails.getAccountNumber())) {
                    throw new CustomException("BANK_ACCOUNT_DETAILS.ACCOUNT_NUMBER", "Account number is mandatory");
                }

                BankBranchIdentifier bankBranchIdentifier = bankAccountDetails.getBankBranchIdentifier();
                if (bankBranchIdentifier == null) {
                    throw new CustomException("BANK_ACCOUNT_DETAILS.BRANCH_IDENTIFIER", "Bank branch identifier is mandatory");
                }
            
                if (StringUtils.isBlank(bankBranchIdentifier.getType())) {
                    throw new CustomException("BRANCH_IDENTIFIER.TYPE", "Branch identifier type is mandatory");
                }
                if (StringUtils.isBlank(bankBranchIdentifier.getCode())) {
                    throw new CustomException("BRANCH_IDENTIFIER.CODE", "Branch identifier code is mandatory ");
                }
            }
        }
    }

    private void validateOnUpdate(List<BankAccount> bankAccountList, Map<String, String> errorMap) {
        log.info("BankAccountValidator::validateBankAccount");
        if (CollectionUtils.isEmpty(bankAccountList)) {
            throw new CustomException("BANK_ACCOUNTS", "Bank account is mandatory");
        }
        for (BankAccount bankAccount : bankAccountList) {
        	if(StringUtils.isBlank(bankAccount.getId())) {
        		throw new CustomException("BANK_ACCOUNT_ID", "Bank account ID is mandatory");
        	}
            if (StringUtils.isBlank(bankAccount.getTenantId())) {
                throw new CustomException("TENANT_ID", "Tenant id is mandatory");
            }
            if (StringUtils.isBlank(bankAccount.getReferenceId())) {
                throw new CustomException("REFERENCE_ID", "Reference id is mandatory");
            }
            if (StringUtils.isBlank(bankAccount.getServiceCode())) {
                throw new CustomException("SERVICE_CODE", "Service code is mandatory");
            }

            List<BankAccountDetails> bankAccountDetailsList = bankAccount.getBankAccountDetails();
            if (CollectionUtils.isEmpty(bankAccountDetailsList)) {
                throw new CustomException("BANK_ACCOUNT_DETAILS", "Bank account details are mandatory");
            }

            for (BankAccountDetails bankAccountDetails : bankAccountDetailsList) {
            	if(StringUtils.isBlank(bankAccountDetails.getId())) {
            		throw new CustomException("BANK_ACCOUNT_ID", "Bank account details ID is mandatory");
            	}
                if (StringUtils.isBlank(bankAccountDetails.getTenantId())) {
                    throw new CustomException("BANK_ACCOUNT_DETAILS.TENANT_ID", "Tenant id is mandatory");
                }
                if (StringUtils.isBlank(bankAccountDetails.getAccountNumber())) {
                    throw new CustomException("BANK_ACCOUNT_DETAILS.ACCOUNT_NUMBER", "Account number is mandatory");
                }

                BankBranchIdentifier bankBranchIdentifier = bankAccountDetails.getBankBranchIdentifier();
                if (bankBranchIdentifier == null) {
                    throw new CustomException("BANK_ACCOUNT_DETAILS.BRANCH_IDENTIFIER", "Bank branch identifier is mandatory for update");
                }
                if (StringUtils.isBlank(bankBranchIdentifier.getId())) {
                    throw new CustomException("BRANCH_IDENTIFIER.ID", "Branch identifier ID is mandatory for updates");
                }
                if (StringUtils.isBlank(bankBranchIdentifier.getType())) {
                    throw new CustomException("BRANCH_IDENTIFIER.TYPE", "Branch identifier type is mandatory for updates");
                }
                if (StringUtils.isBlank(bankBranchIdentifier.getCode())) {
                    throw new CustomException("BRANCH_IDENTIFIER.CODE", "Branch identifier code is mandatory for updates");
                }
            }
        }
    }

    private void validateRequestInfo(RequestInfo requestInfo, Map<String, String> errorMap) {
        log.info("BankAccountValidator::validateRequestInfo");
        if (requestInfo == null) {
            throw new CustomException("REQUEST_INFO", "Request info is mandatory");
        }
        if (requestInfo.getUserInfo() == null) {
            throw new CustomException("USERINFO", "UserInfo is mandatory");
        }
        if (requestInfo.getUserInfo() != null && StringUtils.isBlank(requestInfo.getUserInfo().getUuid())) {
            throw new CustomException("USERINFO_UUID", "UUID is mandatory");
        }
    }

    private void checkAccNumberAndIfscCodeLinkedToOtherBenefeciaryOrNot(BankAccountRequest bankAccountRequest, Map<String, String> errorMap, Boolean isCreate){
        log.info("BankAccountValidator::checkAccNumberAndIfscCodeLinkedToOtherBenefeciaryOrNot");
        String tenantId = bankAccountRequest.getBankAccounts().get(0).getTenantId();
        String referenceId=bankAccountRequest.getBankAccounts().get(0).getReferenceId();
        BankAccountSearchCriteria bankAccountSearchCriteria;
        if(isCreate.equals(Boolean.TRUE)){
            log.info("BankAccountValidator::checkAccNumberAndIfscCodeLinkedToOtherBenefeciaryOrNot for create bank account details call");
            List<String> accountNumber= Arrays.asList(bankAccountRequest.getBankAccounts().get(0).getBankAccountDetails().get(0).getAccountNumber());
            bankAccountSearchCriteria = BankAccountSearchCriteria.builder()
                    .tenantId(tenantId)
                    .accountNumber(accountNumber)
                    .build();
        }else{
            log.info("BankAccountValidator::checkAccNumberAndIfscCodeLinkedToOtherBenefeciaryOrNot for update bank account details call");
            bankAccountSearchCriteria=BankAccountSearchCriteria.builder()
                    .tenantId(tenantId)
                    .referenceId(Arrays.asList(referenceId))
                    .build();
        }
        BankAccountSearchRequest searchRequest= BankAccountSearchRequest.builder()
                                                .bankAccountDetails(bankAccountSearchCriteria)
                                                .build();

        if(isCreate.equals(Boolean.TRUE)){
            encryptionService.encrypt(searchRequest, BANK_ACCOUNT_NUMBER_ENCRYPT_KEY);
        }
        enrichmentService.enrichBankAccountOnSearch(searchRequest);
        List<BankAccount> encryptedBankAccountList = bankAccountRepository.getBankAccount(searchRequest);
        if(!encryptedBankAccountList.isEmpty()){
            encryptedBankAccountList.forEach(bankAccount -> {
                if(!bankAccount.getReferenceId().equals(referenceId)){
                if(bankAccount.getServiceCode().equalsIgnoreCase("IND")){
                    errorMap.put("DUPLICATE_BANK_ACCOUNT_NUMBER", "The Provided Bank Account Number is already mapped to this : "+bankAccount.getReferenceId()+" individual id");
                }else{
                    errorMap.put("DUPLICATE_BANK_ACCOUNT_NUMBER", "The Provided Bank Account Number is already mapped to this : "+bankAccount.getReferenceId()+" organisation id");
                }
                    log.info("Request triggered for the same individual with which the bank account is already linked");
                }
            });

        }
    }
}
