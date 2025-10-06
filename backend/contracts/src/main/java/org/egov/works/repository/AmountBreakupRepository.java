package org.egov.works.repository;

import lombok.extern.slf4j.Slf4j;
import org.egov.common.exception.InvalidTenantIdException;
import org.egov.common.utils.MultiStateInstanceUtil;
import org.egov.tracer.model.CustomException;
import org.egov.works.repository.querybuilder.AmountBreakupQueryBuilder;
import org.egov.works.repository.rowmapper.AmountBreakupRowMapper;
import org.egov.works.web.models.AmountBreakup;
import org.egov.works.web.models.ContractCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

import static org.egov.works.util.ContractServiceConstants.INVALID_TENANT_ID_ERR_CODE;

@Repository
@Slf4j
public class AmountBreakupRepository {
    private final AmountBreakupRowMapper rowMapper;

    private final AmountBreakupQueryBuilder queryBuilder;

    private final JdbcTemplate jdbcTemplate;

    private final MultiStateInstanceUtil multiStateInstanceUtil;

    @Autowired
    public AmountBreakupRepository(AmountBreakupRowMapper rowMapper, AmountBreakupQueryBuilder queryBuilder, JdbcTemplate jdbcTemplate, MultiStateInstanceUtil multiStateInstanceUtil) {
        this.rowMapper = rowMapper;
        this.queryBuilder = queryBuilder;
        this.jdbcTemplate = jdbcTemplate;
        this.multiStateInstanceUtil = multiStateInstanceUtil;
    }

    public List<AmountBreakup> getAmountBreakups(ContractCriteria contractCriteria) {
        List<Object> preparedStmtList = new ArrayList<>();
        String query = queryBuilder.getAmountBreakupSearchQuery(contractCriteria, preparedStmtList);

        try {
            query = multiStateInstanceUtil.replaceSchemaPlaceholder(query, contractCriteria.getTenantId());
        } catch (InvalidTenantIdException e) {
            throw new CustomException(INVALID_TENANT_ID_ERR_CODE, e.getMessage());
        }

        return jdbcTemplate.query(query, rowMapper, preparedStmtList.toArray());
    }
}
