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
import org.springframework.jdbc.core.SingleColumnRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.util.ObjectUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Repository
@Slf4j
public class EstimateRepository {

    private final EstimateRowMapper rowMapper;

    private final EstimateQueryBuilder queryBuilder;

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public EstimateRepository(EstimateRowMapper rowMapper, EstimateQueryBuilder queryBuilder, JdbcTemplate jdbcTemplate) {
        this.rowMapper = rowMapper;
        this.queryBuilder = queryBuilder;
        this.jdbcTemplate = jdbcTemplate;
    }


    /**
     * Get all the estimate list based on the given search criteria (using dynamic
     * query build at the run time)
     * @param searchCriteria
     * @return
     */
    public List<Estimate> getEstimate(EstimateSearchCriteria searchCriteria) {
        log.info("EstimateRepository::getEstimate");
        List<Object> preparedStmtList = new ArrayList<>();
        if (searchCriteria.getIsCountNeeded() == null) {
            searchCriteria.setIsCountNeeded(Boolean.FALSE);
        }
        String query = queryBuilder.getEstimateQuery(searchCriteria, preparedStmtList);
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

        return jdbcTemplate.queryForObject(query, preparedStatement.toArray(), Integer.class);
    }


    public List<Estimate> getEstimatesForBulkSearch(EstimateSearchCriteria criteria, Boolean isPlainSearch) {
        List<Object> preparedStmtList = new ArrayList<>();
        String query = queryBuilder.getEstimateQueryForBulkSearch(criteria, preparedStmtList, isPlainSearch);
        System.out.println(query);
        System.out.println(preparedStmtList);
        System.out.println("hey last query");
        return jdbcTemplate.query(query, preparedStmtList.toArray(), rowMapper);
    }

    public List<String> fetchIds(EstimateSearchCriteria criteria, Boolean isPlainSearch) {

        List<Object> preparedStmtList = new ArrayList<>();
        String basequery = "select id from eg_wms_estimate";
        StringBuilder builder = new StringBuilder(basequery);

        if(!ObjectUtils.isEmpty(criteria.getTenantId()))
        {
            builder.append(" where tenant_id=?");
            preparedStmtList.add(criteria.getTenantId());
        }

        String orderbyClause = " order by last_modified_time,id offset ? limit ?";
        builder.append(orderbyClause);
        preparedStmtList.add(criteria.getOffset());
        preparedStmtList.add(criteria.getLimit());
        System.out.println(builder.toString());
        System.out.println(preparedStmtList);
        System.out.println("heyquery");

        return jdbcTemplate.query(builder.toString(), preparedStmtList.toArray(), new SingleColumnRowMapper<>(String.class));
    }
}
