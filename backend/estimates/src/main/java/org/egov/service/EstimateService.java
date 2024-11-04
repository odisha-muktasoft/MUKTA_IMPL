package org.egov.service;

import digit.models.coremodels.RequestInfoWrapper;
import lombok.extern.slf4j.Slf4j;
import org.egov.common.contract.request.RequestInfo;
import org.egov.config.EstimateServiceConfiguration;
import org.egov.producer.EstimateProducer;
import org.egov.repository.EstimateRepository;
import org.egov.util.EstimateServiceConstant;
import org.egov.util.EstimateServiceUtil;
import org.egov.validator.EstimateServiceValidator;
import org.egov.web.models.Estimate;
import org.egov.web.models.EstimateRequest;
import org.egov.web.models.EstimateSearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
public class EstimateService {

    private final EstimateServiceConfiguration serviceConfiguration;

    private final EstimateProducer producer;

    private final EstimateServiceValidator serviceValidator;

    private final EnrichmentService enrichmentService;

    private final EstimateRepository estimateRepository;

    private final WorkflowService workflowService;

    private final NotificationService notificationService;
    private final EstimateServiceUtil estimateServiceUtil;
    private final EstimateServiceConfiguration config;

    @Autowired
    public EstimateService(EstimateServiceConfiguration serviceConfiguration, EstimateProducer producer, EstimateServiceValidator serviceValidator, EnrichmentService enrichmentService, EstimateRepository estimateRepository, WorkflowService workflowService, NotificationService notificationService, EstimateServiceUtil estimateServiceUtil, EstimateServiceConfiguration config) {
        this.serviceConfiguration = serviceConfiguration;
        this.producer = producer;
        this.serviceValidator = serviceValidator;
        this.enrichmentService = enrichmentService;
        this.estimateRepository = estimateRepository;
        this.workflowService = workflowService;
        this.notificationService = notificationService;
        this.estimateServiceUtil = estimateServiceUtil;
        this.config = config;
    }

    /**
     * Create Estimate by validating the details, enriched , update the workflow
     * and finally pushed to kafka to persist in postgres DB.
     *
     * @param estimateRequest
     * @return
     */
    public EstimateRequest createEstimate(EstimateRequest estimateRequest) {
        log.info("EstimateService::createEstimate");
        serviceValidator.validateEstimateOnCreate(estimateRequest);
        enrichmentService.enrichEstimateOnCreate(estimateRequest);
        workflowService.updateWorkflowStatus(estimateRequest);
        producer.push(serviceConfiguration.getSaveEstimateTopic(), estimateRequest);
        return estimateRequest;
    }

    /**
     * Search Estimate based on given search criteria
     *
     * @param requestInfoWrapper
     * @param searchCriteria
     * @return
     */
    public List<Estimate> searchEstimate(RequestInfoWrapper requestInfoWrapper, EstimateSearchCriteria searchCriteria) {
        log.info("EstimateService::searchEstimate");
        serviceValidator.validateEstimateOnSearch(requestInfoWrapper, searchCriteria);
        enrichmentService.enrichEstimateOnSearch(searchCriteria);
        return estimateRepository.getEstimate(searchCriteria);
    }

    /**
     * @param searchCriteria - EstimateSearchCriteria contains search criteria on estimate
     * @return Count of List of matching estimate application
     */
    public Integer countAllEstimateApplications(EstimateSearchCriteria searchCriteria) {
        log.info("EstimateService::countAllEstimateApplications");
        searchCriteria.setIsCountNeeded(Boolean.TRUE);
        return estimateRepository.getEstimateCount(searchCriteria);
    }

    /**
     * Except Date of Proposal, everything will be editable.
     *
     * @param estimateRequest
     * @return
     */
    public EstimateRequest updateEstimate(EstimateRequest estimateRequest) {
        log.info("EstimateService::updateEstimate");
        serviceValidator.validateEstimateOnUpdate(estimateRequest);
        enrichmentService.enrichEstimateOnUpdate(estimateRequest);
        workflowService.updateWorkflowStatus(estimateRequest);
        if(Boolean.TRUE.equals(estimateServiceUtil.isRevisionEstimate(estimateRequest))){
            updateWfStatusOfPreviousEstimate(estimateRequest);
        }
        producer.push(serviceConfiguration.getUpdateEstimateTopic(), estimateRequest);
        try{
            notificationService.sendNotification(estimateRequest);
        }catch (Exception e){
            log.error("Exception while sending notification: " + e);
        }
        return estimateRequest;
    }
    private void updateWfStatusOfPreviousEstimate(EstimateRequest estimateRequest){
        if(estimateRequest.getEstimate().getStatus() == Estimate.StatusEnum.ACTIVE){
           EstimateSearchCriteria estimateSearchCriteria = EstimateSearchCriteria.builder().tenantId(estimateRequest.getEstimate().getTenantId()).estimateNumber(estimateRequest.getEstimate().getEstimateNumber()).status(EstimateServiceConstant.ESTIMATE_ACTIVE_STATUS).sortOrder(EstimateSearchCriteria.SortOrder.DESC).sortBy(
                    EstimateSearchCriteria.SortBy.createdTime).build();
           List<Estimate> estimateList = estimateRepository.getEstimate(estimateSearchCriteria);
            if(!estimateList.isEmpty()){
                Estimate oldEstimate = estimateList.get(0);
                oldEstimate.setStatus(Estimate.StatusEnum.INACTIVE);
                EstimateRequest oldEstimateRequest = EstimateRequest.builder().requestInfo(estimateRequest.getRequestInfo()).estimate(oldEstimate).build();
                producer.push(serviceConfiguration.getUpdateEstimateTopic(), oldEstimateRequest);
            }
        }
    }

    public List<Estimate> searchEstimatePlainSearch(EstimateSearchCriteria searchCriteria, RequestInfo requestInfo) {
        List<Estimate> estimates = getPropertiesPlainSearch(searchCriteria, requestInfo);

        // Put enrichment if needed

        return estimates;
    }

    List<Estimate> getPropertiesPlainSearch(EstimateSearchCriteria searchCriteria, RequestInfo requestInfo) {

        if (searchCriteria.getLimit() != null && searchCriteria.getLimit() > config.getMaxLimit())
            searchCriteria.setLimit(config.getMaxLimit());
        if(searchCriteria.getLimit()==null)
            searchCriteria.setLimit(config.getDefaultLimit());
        if(searchCriteria.getOffset()==null)
            searchCriteria.setOffset(config.getDefaultOffset());

        EstimateSearchCriteria estimateCriteria = new EstimateSearchCriteria();
        System.out.println(searchCriteria);
        System.out.println("hey criteria");
        if (searchCriteria.getIds() != null) {
            estimateCriteria.setIds(searchCriteria.getIds());
        } else {
            List<String> uuids = estimateRepository.fetchIds(searchCriteria, true);
            System.out.println(uuids);
            System.out.println("hey uuids");
            if (uuids.isEmpty())
                return Collections.emptyList();
            estimateCriteria.setIds(uuids);
        }
        System.out.println(estimateCriteria.getIds());
        System.out.println("hey ids");
        estimateCriteria.setLimit(searchCriteria.getLimit());
        List<Estimate> estimates = estimateRepository.getEstimatesForBulkSearch(estimateCriteria, true);
        if(estimates.isEmpty())
            return Collections.emptyList();
        for (Estimate estimate:estimates)
            System.out.println(estimate);
        return estimates;
    }
}
