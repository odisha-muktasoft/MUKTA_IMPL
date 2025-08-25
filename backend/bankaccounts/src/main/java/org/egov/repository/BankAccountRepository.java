package org.egov.repository;

import lombok.extern.slf4j.Slf4j;
import org.egov.common.exception.InvalidTenantIdException;
import org.egov.common.utils.MultiStateInstanceUtil;
import org.egov.repository.rowmapper.BankAccountQueryBuilder;
import org.egov.repository.rowmapper.BankAccountRowMapper;
import org.egov.tracer.model.CustomException;
import org.egov.web.models.BankAccount;
import org.egov.web.models.BankAccountSearchCriteria;
import org.egov.web.models.BankAccountSearchRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

import static org.egov.util.BankAccountConstant.INVALID_TENANT_ID_ERR_CODE;

@Repository
@Slf4j
public class BankAccountRepository {


    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private BankAccountQueryBuilder queryBuilder;

    @Autowired
    private BankAccountRowMapper rowMapper;

    @Autowired
    private MultiStateInstanceUtil multiStateInstanceUtil;

    /**
     * @param searchRequest
     * @return
     */
    public List<BankAccount> getBankAccount(BankAccountSearchRequest searchRequest) {
        log.info("BankAccountRepository::getBankAccount");
        BankAccountSearchCriteria searchCriteria = searchRequest.getBankAccountDetails();
        List<Object> preparedStmtList = new ArrayList<>();
        if (searchCriteria.getIsCountNeeded() == null) {
            searchCriteria.setIsCountNeeded(Boolean.FALSE);
        }
        String query = queryBuilder.getBankAccountQuery(searchRequest, preparedStmtList);
        try {
            query = multiStateInstanceUtil.replaceSchemaPlaceholder(query, searchRequest.getBankAccountDetails().getTenantId());
        } catch (InvalidTenantIdException e) {
            throw new CustomException(INVALID_TENANT_ID_ERR_CODE, e.getMessage());
        }
        List<BankAccount> bankAccountList = jdbcTemplate.query(query, rowMapper, preparedStmtList.toArray());
        return bankAccountList;
    }

    /**
     * Get the count of bank accounts based on the given search criteria (using dynamic
     * query build at the run time)
     *
     * @param searchRequest
     * @return
     */
    public Integer getBankAccountCount(BankAccountSearchRequest searchRequest) {
        log.info("BankAccountRepository::getBankAccountCount");
        List<Object> preparedStatement = new ArrayList<>();
        String query = queryBuilder.getSearchCountQueryString(searchRequest, preparedStatement);

        if (query == null)
            return 0;

        try {
            query = multiStateInstanceUtil.replaceSchemaPlaceholder(query, searchRequest.getBankAccountDetails().getTenantId());
        } catch (InvalidTenantIdException e) {
            throw new CustomException(INVALID_TENANT_ID_ERR_CODE, e.getMessage());
        }

        Integer count = jdbcTemplate.queryForObject(query, preparedStatement.toArray(), Integer.class);
        return count;
    }
}
