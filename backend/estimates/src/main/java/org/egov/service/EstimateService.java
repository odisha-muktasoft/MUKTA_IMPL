package org.egov.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.egov.common.contract.models.RequestInfoWrapper;
import org.egov.common.contract.request.RequestInfo;
import org.egov.common.models.project.Project;
import org.egov.config.EstimateServiceConfiguration;
import org.egov.producer.EstimateProducer;
import org.egov.repository.EstimateRepository;
import org.egov.util.EstimateServiceConstant;
import org.egov.util.EstimateServiceUtil;
import org.egov.util.ProjectUtil;
import org.egov.validator.EstimateServiceValidator;
import org.egov.web.models.Estimate;
import org.egov.web.models.EstimateRequest;
import org.egov.web.models.EstimateSearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import static java.util.stream.Collectors.toList;

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
    private final ProjectUtil projectUtil;
    private final RedisService redisService;
    private final ObjectMapper objectMapper;

    private static final String ESTIMATE_REDIS_KEY = "ESTIMATE_{id}";

    @Autowired
    public EstimateService(EstimateServiceConfiguration serviceConfiguration, EstimateProducer producer, EstimateServiceValidator serviceValidator, EnrichmentService enrichmentService, EstimateRepository estimateRepository, WorkflowService workflowService, NotificationService notificationService, EstimateServiceUtil estimateServiceUtil, ProjectUtil projectUtil, RedisService redisService, ObjectMapper objectMapper) {
        this.serviceConfiguration = serviceConfiguration;
        this.producer = producer;
        this.serviceValidator = serviceValidator;
        this.enrichmentService = enrichmentService;
        this.estimateRepository = estimateRepository;
        this.workflowService = workflowService;
        this.notificationService = notificationService;
        this.estimateServiceUtil = estimateServiceUtil;
        this.projectUtil = projectUtil;
        this.redisService = redisService;
        this.objectMapper = objectMapper;
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
        if (Boolean.TRUE.equals(serviceConfiguration.getIsCachingEnabled()))
            redisService.setCache(getEstimateRedisKey(estimateRequest.getEstimate().getId()), estimateRequest.getEstimate());
        producer.push(serviceConfiguration.getSaveEstimateTopic(), estimateRequest);
        estimateRequest.getEstimate().setProcessInstances(null);
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
        List<Estimate> estimates = new ArrayList<>();
        if (Boolean.TRUE.equals(estimateServiceUtil.isCacheSearchRequired(searchCriteria))) {
            estimates = getEstimatesFromRedis(new HashSet<>(searchCriteria.getIds()));
            if (estimates.size() == searchCriteria.getIds().size()) {
                return estimates;
            } else {
                searchCriteria.getIds().removeAll(estimates.stream().map(Estimate::getId).collect(toList()));
                if (searchCriteria.getIds().isEmpty())
                    return estimates;
            }
        }
        estimates.addAll(estimateRepository.getEstimate(searchCriteria));
        return estimates;
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
        if (Boolean.TRUE.equals(serviceConfiguration.getIsCachingEnabled()))
            redisService.setCache(getEstimateRedisKey(estimateRequest.getEstimate().getId()), estimateRequest.getEstimate());
        producer.push(serviceConfiguration.getUpdateEstimateTopic(), estimateRequest);
        estimateRequest.getEstimate().setProcessInstances(null);
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
                if (Boolean.TRUE.equals(serviceConfiguration.getIsCachingEnabled()))
                    redisService.setCache(getEstimateRedisKey(oldEstimate.getId()), oldEstimate);
                producer.push(serviceConfiguration.getUpdateEstimateTopic(), oldEstimateRequest);
            }
        }
    }

    private List<Estimate> getEstimatesFromRedis(Set<String> ids) {
        log.info("EstimateService::getEstimatesFromRedis");
        List<Estimate> estimates = new ArrayList<>();
        for (String id : ids) {
            Estimate estimate = redisService.getCache(getEstimateRedisKey(id), Estimate.class);
            if (estimate != null)
                estimates.add(estimate);
        }
        return estimates;
    }

    private String getEstimateRedisKey(String id) {
        return ESTIMATE_REDIS_KEY.replace("{id}", id);
    }

    public List<Estimate> searchEstimatePlainSearch(EstimateSearchCriteria searchCriteria, RequestInfo requestInfo) {
        List<Estimate> estimates = getEstimatesPlainSearch(searchCriteria);

        // Project enrichment
        for (Estimate estimate: estimates) {
            log.info("DenormalizeAndEnrichEstimateService:: Enrich project details for estimate number %s", estimate.getEstimateNumber());
            Object projectRes = projectUtil.getProjectDetailsNoEstimateRequest(estimate.getProjectId(), estimate.getTenantId(), requestInfo);

            //If project payload changes, this key needs to be modified!
            List<Project> projects = objectMapper.convertValue(((LinkedHashMap) projectRes).get(EstimateServiceConstant.PROJECT_RESP_PAYLOAD_KEY), new TypeReference<List<Project>>() {
            })  ;

            if (projects != null && !projects.isEmpty()) {
                estimate.setProject(projects.get(0));
            }
            else {
                log.warn(String.format("Unable to enrich project details for estimate %s. Inbox and search will not function correctly!", estimate.getEstimateNumber()));
            }
        }

        return estimates;
    }

    List<Estimate> getEstimatesPlainSearch(EstimateSearchCriteria searchCriteria) {

        if (searchCriteria.getLimit() != null && searchCriteria.getLimit() > serviceConfiguration.getMaxLimit())
            searchCriteria.setLimit(serviceConfiguration.getMaxLimit());
        if(searchCriteria.getLimit()==null)
            searchCriteria.setLimit(serviceConfiguration.getDefaultLimit());
        if(searchCriteria.getOffset()==null)
            searchCriteria.setOffset(serviceConfiguration.getDefaultOffset());

        EstimateSearchCriteria estimateCriteria = new EstimateSearchCriteria();
        if (searchCriteria.getIds() != null) {
            estimateCriteria.setIds(searchCriteria.getIds());
        } else {
            List<String> uuids = estimateRepository.fetchIds(searchCriteria);
            if (uuids.isEmpty())
                return Collections.emptyList();
            estimateCriteria.setIds(uuids);
        }
        estimateCriteria.setLimit(searchCriteria.getLimit());
        List<Estimate> estimates = estimateRepository.getEstimatesForBulkSearch(estimateCriteria);


        if(estimates.isEmpty())
            return Collections.emptyList();

        return estimates;
    }
}
