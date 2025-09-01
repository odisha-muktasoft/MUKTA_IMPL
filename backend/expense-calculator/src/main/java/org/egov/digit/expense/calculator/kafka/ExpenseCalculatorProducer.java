package org.egov.digit.expense.calculator.kafka;

import org.egov.common.utils.MultiStateInstanceUtil;
import org.egov.tracer.kafka.CustomKafkaTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

// NOTE: If tracer is disabled change CustomKafkaTemplate to KafkaTemplate in autowiring

@Service
@Slf4j
public class ExpenseCalculatorProducer {

	private final CustomKafkaTemplate<String, Object> kafkaTemplate;
	private final MultiStateInstanceUtil multiStateInstanceUtil;

	@Autowired
	public ExpenseCalculatorProducer(CustomKafkaTemplate<String, Object> kafkaTemplate, MultiStateInstanceUtil multiStateInstanceUtil) {
		this.kafkaTemplate = kafkaTemplate;
		this.multiStateInstanceUtil = multiStateInstanceUtil;
	}

	public void push(String topic, Object value) {
		kafkaTemplate.send(topic, value);
	}

	public void push(String tenantId, String topic, Object value) {
		String updatedTopic = multiStateInstanceUtil.getStateSpecificTopicName(tenantId,topic);
		kafkaTemplate.send(updatedTopic, value);
		log.info("Meta records pushed into topic ["+updatedTopic+"]");
	}
}
