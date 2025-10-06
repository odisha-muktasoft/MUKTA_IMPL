package org.egov.works.kafka;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.egov.tracer.model.CustomException;
import org.egov.works.config.ContractServiceConfiguration;
import org.egov.works.service.ContractService;
import org.egov.works.web.models.EstimateConsumerError;
import org.egov.works.web.models.EstimateRequest;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.stereotype.Component;

import java.util.Map;

import static org.egov.works.util.ContractServiceConstants.APPROVE_ACTION;
import static org.egov.works.util.ContractServiceConstants.REVISION_ESTIMATE;

@Component
@Slf4j
public class ContractConsumer {


    private final ObjectMapper objectMapper;

    private final ContractService contractService;

    private final ContractServiceConfiguration contractServiceConfiguration;

    public ContractConsumer(ObjectMapper objectMapper,ContractService contractService, ContractServiceConfiguration contractServiceConfiguration) {
        this.objectMapper = objectMapper;
        this.contractService=contractService;
        this.contractServiceConfiguration = contractServiceConfiguration;
    }


    /*
     * Uncomment the below line to start consuming record from kafka.topics.consumer
     * Value of the variable kafka.topics.consumer should be overwritten in application.properties
     */
    //@KafkaListener(topics = {"kafka.topics.consumer"})
    @KafkaListener(topicPattern = "${estimate.kafka.update.topic.pattern}")
    public void listen(final String consumerRecord, @Header(KafkaHeaders.RECEIVED_TOPIC) String topic) {
        log.info("ContractConsumer:listen");
        EstimateRequest request = null;
        try {
            request = objectMapper.readValue(consumerRecord, EstimateRequest.class);
            if(topic.contains(contractServiceConfiguration.getUpdateEstimateTopic())){
                if(request.getEstimate().getBusinessService().equals(REVISION_ESTIMATE)){
                    if(!request.getWorkflow().getAction().equals(APPROVE_ACTION)){
                        log.info("Revised Estimate is not Approved");
                    }else{
                        contractService.createAndPostRevisedContractRequest(request);
                    }

                }else{
                    log.info("Request is not for Revised Estimate");
                }
            }else{
                log.info("Topic not matches the pattern.");
            }

        } catch (Exception exception) {
            log.error("Error occurred while processing the consumed estimate request from the  topic : " + topic, exception);
            final EstimateConsumerError error = EstimateConsumerError.builder()
                    .estimateRequest(request)
                    .exception(exception)
                    .build();
        }
    }
}
