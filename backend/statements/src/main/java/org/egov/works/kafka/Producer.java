package org.egov.works.kafka;



import lombok.extern.slf4j.Slf4j;
import org.egov.common.utils.MultiStateInstanceUtil;
import org.egov.tracer.kafka.CustomKafkaTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// NOTE: If tracer is disabled change CustomKafkaTemplate to KafkaTemplate in autowiring

@Service
@Slf4j
public class Producer {

    @Autowired
    private CustomKafkaTemplate<String, Object> kafkaTemplate;

    @Autowired
    private MultiStateInstanceUtil multiStateInstanceUtil;

    public void push(String tenantId, String topic, Object value) {
        String updatedTopic = multiStateInstanceUtil.getStateSpecificTopicName(tenantId, topic);
        kafkaTemplate.send(updatedTopic, value);
    }
}
