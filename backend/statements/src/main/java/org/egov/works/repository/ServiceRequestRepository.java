package org.egov.works.repository;




import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import lombok.extern.slf4j.Slf4j;
import org.egov.tracer.model.ServiceCallException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

import static org.egov.works.config.ServiceConstants.EXTERNAL_SERVICE_EXCEPTION;
import static org.egov.works.config.ServiceConstants.SEARCHER_SERVICE_EXCEPTION;

@Repository
@Slf4j
public class ServiceRequestRepository {

    private ObjectMapper mapper;

    private RestTemplate restTemplate;


    @Autowired
    public ServiceRequestRepository(ObjectMapper mapper, RestTemplate restTemplate) {
        this.mapper = mapper;
        this.restTemplate = restTemplate;
    }


    public Object fetchResult(StringBuilder uri, Object request) {
        mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
        Object response = null;
        try {
            // Log the request object for debugging
            log.info("ServiceRequestRepository::fetchResult - URL: {}, Request object: {}", uri.toString(), request != null ? request.getClass().getName() : "null");
            if (request != null) {
                try {
                    String requestJson = mapper.writeValueAsString(request);
                    log.info("ServiceRequestRepository::fetchResult - Request JSON: {}", requestJson);
                } catch (Exception ex) {
                    log.error("Failed to serialize request object for logging", ex);
                }
            }
            response = restTemplate.postForObject(uri.toString(), request, Map.class);
        }catch(HttpClientErrorException e) {
            log.error(EXTERNAL_SERVICE_EXCEPTION,e);
            throw new ServiceCallException(e.getResponseBodyAsString());
        }catch(Exception e) {
            log.error(SEARCHER_SERVICE_EXCEPTION,e);
        }

        return response;
    }
}