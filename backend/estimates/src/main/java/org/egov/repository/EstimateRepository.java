package org.egov.repository;


import lombok.extern.slf4j.Slf4j;
import org.egov.repository.rowmapper.EstimateQueryBuilder;
import org.egov.repository.rowmapper.EstimateRowMapper;
import org.egov.tracer.model.CustomException;
import org.egov.web.models.Estimate;
import org.egov.web.models.EstimateDetail;
import org.egov.web.models.EstimateRequest;
import org.egov.web.models.EstimateSearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import org.egov.common.exception.InvalidTenantIdException;
import org.egov.common.utils.MultiStateInstanceUtil;

import static org.egov.util.EstimateServiceConstant.INVALID_TENANT_ID_ERR_CODE;
import static org.egov.util.EstimateServiceConstant.TENANT_ID_MISSING;

@Repository
@Slf4j
public class EstimateRepository {

    private final EstimateRowMapper rowMapper;

    private final EstimateQueryBuilder queryBuilder;

    private final JdbcTemplate jdbcTemplate;

    private final MultiStateInstanceUtil multiStateInstanceUtil;

    @Autowired
    public EstimateRepository(EstimateRowMapper rowMapper, EstimateQueryBuilder queryBuilder, JdbcTemplate jdbcTemplate, MultiStateInstanceUtil multiStateInstanceUtil) {
        this.rowMapper = rowMapper;
        this.queryBuilder = queryBuilder;
        this.jdbcTemplate = jdbcTemplate;
        this.multiStateInstanceUtil = multiStateInstanceUtil;
    }


    /**
     * Get all the estimate list based on the given search criteria (using dynamic
     * query build at the run time)
     * @param searchCriteria
     * @return
     */
    public List<Estimate> getEstimate(EstimateSearchCriteria searchCriteria) {
        log.info("EstimateRepository::getEstimate");
        if (searchCriteria.getTenantId() == null) {
            log.error("TenantId is null in search criteria while calling getEstimate()");
            throw new CustomException(TENANT_ID_MISSING, "TenantId cannot be null while fetching estimates");
        }
        List<Object> preparedStmtList = new ArrayList<>();
        if (searchCriteria.getIsCountNeeded() == null) {
            searchCriteria.setIsCountNeeded(Boolean.FALSE);
        }
        String query = queryBuilder.getEstimateQuery(searchCriteria, preparedStmtList);

        try {
            query = multiStateInstanceUtil.replaceSchemaPlaceholder(query, searchCriteria.getTenantId());
        } catch (InvalidTenantIdException e) {
            throw new CustomException(INVALID_TENANT_ID_ERR_CODE, e.getMessage());
        }

        return jdbcTemplate.query(query, rowMapper, preparedStmtList.toArray());
    }

    /**
     * Get the count of estimates based on the given search criteria (using dynamic
     * query build at the run time)
     * @param criteria
     * @return
     */
    public Integer getEstimateCount(EstimateSearchCriteria criteria) {
        log.info("EstimateRepository::getEstimateCount");
        List<Object> preparedStatement = new ArrayList<>();
        String query = queryBuilder.getSearchCountQueryString(criteria, preparedStatement);

        if (query == null)
            return 0;

        try {
            query = multiStateInstanceUtil.replaceSchemaPlaceholder(query, criteria.getTenantId());
        } catch (InvalidTenantIdException e) {
            throw new CustomException(INVALID_TENANT_ID_ERR_CODE, e.getMessage());
        }


        return jdbcTemplate.queryForObject(query, Integer.class, preparedStatement.toArray());
    }
}
