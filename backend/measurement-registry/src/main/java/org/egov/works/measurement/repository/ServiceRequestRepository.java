package org.egov.works.measurement.repository;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import lombok.extern.slf4j.Slf4j;
import org.egov.common.exception.InvalidTenantIdException;
import org.egov.common.utils.MultiStateInstanceUtil;
import org.egov.tracer.model.CustomException;
import org.egov.tracer.model.ServiceCallException;
import org.egov.works.measurement.repository.querybuilder.MeasurementQueryBuilder;
import org.egov.works.measurement.repository.rowmapper.MeasurementRowMapper;
import org.egov.works.measurement.web.models.Measurement;
import org.egov.works.measurement.web.models.MeasurementCriteria;
import org.egov.works.measurement.web.models.MeasurementSearchRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static org.egov.works.measurement.config.ServiceConstants.*;

@Repository
@Slf4j
public class ServiceRequestRepository {

    private ObjectMapper mapper;
    @Autowired
    private MeasurementQueryBuilder queryBuilder;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RestTemplate restTemplate;

    @Autowired
    private MeasurementRowMapper rowMapper;

    @Autowired
    private MultiStateInstanceUtil multiStateInstanceUtil;


    public ArrayList<Measurement> getMeasurements(MeasurementCriteria searchCriteria, MeasurementSearchRequest measurementSearchRequest) {
        List<Object> preparedStmtList = new ArrayList<>();
        String query = queryBuilder.getMeasurementSearchQuery(searchCriteria, preparedStmtList, measurementSearchRequest,false);
        try {
            query = multiStateInstanceUtil.replaceSchemaPlaceholder(query, searchCriteria.getTenantId());
        } catch (InvalidTenantIdException e) {
            throw new CustomException(INVALID_TENANT_ID_ERR_CODE, e.getMessage());
        }
        ArrayList<Measurement> measurementsList = jdbcTemplate.query(query, rowMapper, preparedStmtList.toArray());
        return measurementsList;
    }

    @Autowired
    public ServiceRequestRepository(ObjectMapper mapper, RestTemplate restTemplate) {
        this.mapper = mapper;
        this.restTemplate = restTemplate;
    }


    public Object fetchResult(StringBuilder uri, Object request) {
        mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
        Object response = null;
        try {
            response = restTemplate.postForObject(uri.toString(), request, Map.class);
        } catch (HttpClientErrorException e) {
            log.error(EXTERNAL_SERVICE_EXCEPTION, e);
            throw new ServiceCallException(e.getResponseBodyAsString());
        } catch (Exception e) {
            log.error(SEARCHER_SERVICE_EXCEPTION, e);
        }

        return response;
    }

    public Integer getCount(MeasurementCriteria criteria) {
        List<Object> preparedStmtList = new ArrayList<>();
        String countQuery = queryBuilder.getSearchCountQueryString(criteria, preparedStmtList, null);
        return jdbcTemplate.queryForObject(countQuery, preparedStmtList.toArray(), Integer.class);
    }
}