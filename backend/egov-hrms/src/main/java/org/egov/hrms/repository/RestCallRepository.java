package org.egov.hrms.repository;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.egov.tracer.model.CustomException;
import org.egov.tracer.model.ServiceCallException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class RestCallRepository {

	@Autowired
	private RestTemplate restTemplate;

	@Autowired
	private ObjectMapper objectMapper;

	/**
	 * Fetches results from the given API and request and handles errors.
	 * 
	 * @param requestInfo
	 * @param serviceReqSearchCriteria
	 * @return Object
	 * @author vishal
	 */
	public Object fetchResult(StringBuilder uri, Object request) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
		Object response = null;
		try {
			response = restTemplate.postForObject(uri.toString(), request, Map.class);
		} catch (HttpClientErrorException e) {
			log.error("External Service threw an Exception: ", e);
			if (!StringUtils.isEmpty(e.getResponseBodyAsString())) {
				throw new ServiceCallException(e.getResponseBodyAsString());
			}
		} catch (Exception e) {
			log.error("Exception while fetching from searcher: ", e);
			log.info("req: " + (request));
		}

		return response;

	}
	public <T> T fetchResult(StringBuilder uri, Object request, Class
			<T> clazz) {
		objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
		T response;
		try {
			response = restTemplate.postForObject(uri.toString(), request, clazz);
		} catch (HttpClientErrorException e) {
			throw new CustomException("HTTP_CLIENT_ERROR",
					String.format("%s - %s", e.getMessage(), e.getResponseBodyAsString()));
		}
		return response;
	}

}
