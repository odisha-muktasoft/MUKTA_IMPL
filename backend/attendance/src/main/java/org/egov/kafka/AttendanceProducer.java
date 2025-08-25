package org.egov.kafka;

import org.egov.common.utils.MultiStateInstanceUtil;
import org.egov.tracer.kafka.CustomKafkaTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AttendanceProducer {

    private final CustomKafkaTemplate<String, Object> kafkaTemplate;
    private final MultiStateInstanceUtil multiStateInstanceUtil;

    @Autowired
    public AttendanceProducer(CustomKafkaTemplate<String, Object> kafkaTemplate, MultiStateInstanceUtil multiStateInstanceUtil) {
        this.kafkaTemplate = kafkaTemplate;
        this.multiStateInstanceUtil = multiStateInstanceUtil;
    }

    public void push(String tenantId, String topic, Object value){
        String updatedTopic = multiStateInstanceUtil.getStateSpecificTopicName(tenantId,topic);
        this.kafkaTemplate.send(updatedTopic,value);
    }

}
