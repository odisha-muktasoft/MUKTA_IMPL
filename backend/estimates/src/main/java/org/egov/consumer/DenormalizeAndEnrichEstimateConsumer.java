package org.egov.consumer;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.egov.config.EstimateServiceConfiguration;
import org.egov.producer.EstimateProducer;
import org.egov.service.DenormalizeAndEnrichEstimateService;
import org.egov.tracer.model.CustomException;
import org.egov.web.models.EstimateRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.stereotype.Component;
import org.egov.util.EstimateServiceConstant;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Value;


@Component
@Slf4j
public class DenormalizeAndEnrichEstimateConsumer {

    private final EstimateProducer producer;

    private final ObjectMapper mapper;

    private final EstimateServiceConfiguration serviceConfiguration;

    private final DenormalizeAndEnrichEstimateService denormalizeAndEnrichEstimateService;

    @Value("${state.level.tenant.id}")
    private String stateLevelTenantID;

    @Autowired
    public DenormalizeAndEnrichEstimateConsumer(EstimateProducer producer, ObjectMapper mapper, EstimateServiceConfiguration serviceConfiguration, DenormalizeAndEnrichEstimateService denormalizeAndEnrichEstimateService) {
        this.producer = producer;
        this.mapper = mapper;
        this.serviceConfiguration = serviceConfiguration;
        this.denormalizeAndEnrichEstimateService = denormalizeAndEnrichEstimateService;
    }

    /**
     * It consumes the message from 'save-estimate' topic and do the
     * <p>
     * 1. denormalization & enrichment of project
     * 2. Enrichment of current process instance
     * <p>
     * in estimate And finally produce the enriched estimate to the 'enrich-estimate'
     * topic. And indexer consumes the same enriched estimate message from 'enrich-estimate'
     * topic and do the processing to elastic index.
     * <p>
     * This is introduced to get the search - criteria & result of project and status of workflow in
     * estimate-inbox
     *
     * @param message
     * @param topic
     */
    @KafkaListener(topicPattern = "${kafka.consumer.topic.pattern}")
    public void listen(final String message, @Header(KafkaHeaders.RECEIVED_TOPIC) String topic) {
        log.info("DenormalizeAndEnrichEstimateConsumer::listen");
        try {

            EstimateRequest estimateRequest = mapper.readValue(message, EstimateRequest.class);
            if (topic.contains(serviceConfiguration.getSaveEstimateTopic()) || topic.contains(serviceConfiguration.getUpdateEstimateTopic())){
                MDC.put(EstimateServiceConstant.TENANTID_MDC_STRING, stateLevelTenantID);
                if (estimateRequest != null && estimateRequest.getEstimate() != null && estimateRequest.getRequestInfo() != null) {
                    EstimateRequest enrichedEstimateRequest = denormalizeAndEnrichEstimateService.denormalizeAndEnrich(estimateRequest);
                    producer.push(enrichedEstimateRequest.getEstimate().getTenantId(), serviceConfiguration.getEnrichEstimateTopic(), enrichedEstimateRequest);
                }
                }else{
                    log.info("Topic not matches the pattern.");
                }
        } catch (Exception e) {
            log.error("Error occurred while processing the consumed save estimate record from topic : " + topic, e);
            throw new CustomException("CONSUMER_ERROR", "Error occurred while processing the consumed save estimate record from topic : " + topic);
        }
    }
}
