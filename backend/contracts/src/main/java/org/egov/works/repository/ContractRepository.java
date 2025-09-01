package org.egov.works.repository;

import lombok.extern.slf4j.Slf4j;
import org.egov.common.exception.InvalidTenantIdException;
import org.egov.common.utils.MultiStateInstanceUtil;
import org.egov.tracer.model.CustomException;
import org.egov.works.config.ContractServiceConfiguration;
import org.egov.works.repository.querybuilder.ContractQueryBuilder;
import org.egov.works.repository.rowmapper.ContractRowMapper;
import org.egov.works.web.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

import static org.egov.works.util.ContractServiceConstants.INVALID_TENANT_ID_ERR_CODE;

@Repository
@Slf4j
public class ContractRepository {
    private final ContractRowMapper rowMapper;

    private final ContractQueryBuilder queryBuilder;

    private final JdbcTemplate jdbcTemplate;
    private final ContractServiceConfiguration contractServiceConfiguration;

    private final MultiStateInstanceUtil multiStateInstanceUtil;

    @Autowired
    public ContractRepository(ContractRowMapper rowMapper, ContractQueryBuilder queryBuilder, JdbcTemplate jdbcTemplate, ContractServiceConfiguration contractServiceConfiguration, MultiStateInstanceUtil multiStateInstanceUtil) {
        this.rowMapper = rowMapper;
        this.queryBuilder = queryBuilder;
        this.jdbcTemplate = jdbcTemplate;
        this.contractServiceConfiguration = contractServiceConfiguration;
        this.multiStateInstanceUtil = multiStateInstanceUtil;
    }

    public List<Contract> getContracts(ContractCriteria contractCriteria) {
        List<Object> preparedStmtList = new ArrayList<>();
        String query = queryBuilder.getContractSearchQuery(contractCriteria, preparedStmtList);

        try {
            query = multiStateInstanceUtil.replaceSchemaPlaceholder(query, contractCriteria.getTenantId());
        } catch (InvalidTenantIdException e) {
            throw new CustomException(INVALID_TENANT_ID_ERR_CODE, e.getMessage());
        }

        return jdbcTemplate.query(query, rowMapper, preparedStmtList.toArray());
    }
    public List<Contract> getActiveContractsFromDB(ContractRequest contractRequest) {
        Pagination pagination = Pagination.builder()
                .limit(contractServiceConfiguration.getContractMaxLimit())
                .offSet(contractServiceConfiguration.getContractDefaultOffset())
                .build();
        ContractCriteria contractCriteria = ContractCriteria.builder()
                .contractNumber(contractRequest.getContract().getContractNumber())
                .status(Status.ACTIVE.toString())
                .tenantId(contractRequest.getContract().getTenantId())
                .requestInfo(contractRequest.getRequestInfo())
                .pagination(pagination)
                .build();
        return getContracts(contractCriteria);
    }
}
