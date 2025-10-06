package org.egov.works.repository;

import lombok.extern.slf4j.Slf4j;
import org.egov.common.exception.InvalidTenantIdException;
import org.egov.common.utils.MultiStateInstanceUtil;
import org.egov.tracer.model.CustomException;
import org.egov.works.repository.rowmapper.StatementQueryBuilder;
import org.egov.works.repository.rowmapper.StatementRowMapper;
import org.egov.works.web.models.SearchCriteria;
import org.egov.works.web.models.Statement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

import static org.egov.works.config.ServiceConstants.INVALID_TENANT_ID_ERR_CODE;

@Repository
@Slf4j
public class StatementRepository {

    private final StatementRowMapper rowMapper;

    private final StatementQueryBuilder queryBuilder;

    private final JdbcTemplate jdbcTemplate;

    private final MultiStateInstanceUtil multiStateInstanceUtil;

    @Autowired
    public StatementRepository(StatementRowMapper rowMapper, StatementQueryBuilder queryBuilder, JdbcTemplate jdbcTemplate, MultiStateInstanceUtil multiStateInstanceUtil) {
        this.rowMapper = rowMapper;
        this.queryBuilder = queryBuilder;
        this.jdbcTemplate = jdbcTemplate;
        this.multiStateInstanceUtil = multiStateInstanceUtil;
    }

    public List<Statement> getStatement(SearchCriteria searchCriteria) {
        log.info("StatementRespository::getStatement");
        List<Object> preparedStmtList = new ArrayList<>();
        String query = queryBuilder.getStatementQuery(searchCriteria, preparedStmtList);
        try {
            query = multiStateInstanceUtil.replaceSchemaPlaceholder(query,searchCriteria.getTenantId());
        } catch (InvalidTenantIdException e) {
            throw new CustomException(INVALID_TENANT_ID_ERR_CODE, e.getMessage());
        }
        return jdbcTemplate.query(query, rowMapper, preparedStmtList.toArray());
    }

}
