package org.egov.producer;

import lombok.extern.slf4j.Slf4j;
import org.egov.tracer.kafka.CustomKafkaTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.egov.common.utils.MultiStateInstanceUtil;

@Component
@Slf4j
public class EstimateProducer {

    private final CustomKafkaTemplate<String, Object> kafkaTemplate;

    private final MultiStateInstanceUtil multiStateInstanceUtil;

    @Autowired
    public EstimateProducer(CustomKafkaTemplate<String, Object> kafkaTemplate, MultiStateInstanceUtil multiStateInstanceUtil) {
        this.kafkaTemplate = kafkaTemplate;
        this.multiStateInstanceUtil = multiStateInstanceUtil;
    }

    public void push( String topic, Object value) {
        kafkaTemplate.send(topic, value);
    }

    public void push(String tenantId, String topic, Object value) {
        //kafkaTemplate.send(topic, value);
        String updatedTopic = multiStateInstanceUtil.getStateSpecificTopicName(tenantId, topic);
        kafkaTemplate.send(updatedTopic, value);
    }

}
