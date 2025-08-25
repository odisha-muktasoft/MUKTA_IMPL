package org.egov.works.kafka;

import lombok.extern.slf4j.Slf4j;
import org.egov.common.utils.MultiStateInstanceUtil;
import org.egov.tracer.kafka.CustomKafkaTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// NOTE: If tracer is disabled change CustomKafkaTemplate to KafkaTemplate in autowiring

@Component
@Slf4j
public class ContractProducer {

    private final CustomKafkaTemplate<String, Object> kafkaTemplate;

    private final MultiStateInstanceUtil multiStateInstanceUtil;

    @Autowired
    public ContractProducer(CustomKafkaTemplate<String, Object> kafkaTemplate, MultiStateInstanceUtil multiStateInstanceUtil) {
        this.kafkaTemplate = kafkaTemplate;
        this.multiStateInstanceUtil = multiStateInstanceUtil;
    }

    public void push(String tenantId, String topic, Object value) {
        String updatedTopic = multiStateInstanceUtil.getStateSpecificTopicName(tenantId, topic);
        this.kafkaTemplate.send(updatedTopic, value);
    }

    public void push( String topic, Object value) {
        kafkaTemplate.send(topic, value);
    }
}