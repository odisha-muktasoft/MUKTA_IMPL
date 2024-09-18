package org.egov.repository;

import lombok.extern.slf4j.Slf4j;
import org.egov.repository.querybuilder.AttendanceLogQueryBuilder;
import org.egov.repository.rowmapper.AttendanceLogRowMapper;
import org.egov.web.models.AttendanceLog;
import org.egov.web.models.AttendanceLogSearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@Slf4j
public class AttendanceLogRepository {
    private final AttendanceLogRowMapper rowMapper;

    private final AttendanceLogQueryBuilder queryBuilder;

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public AttendanceLogRepository(AttendanceLogRowMapper rowMapper, AttendanceLogQueryBuilder queryBuilder, JdbcTemplate jdbcTemplate) {
        this.rowMapper = rowMapper;
        this.queryBuilder = queryBuilder;
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<AttendanceLog> getAttendanceLogs(AttendanceLogSearchCriteria searchCriteria) {
        List<Object> preparedStmtList = new ArrayList<>();
        log.info("Fetching Attendance Log list. RegisterId ["+searchCriteria.getRegisterId()+"]");
        String query = queryBuilder.getAttendanceLogSearchQuery(searchCriteria, preparedStmtList);
        log.info("Query build successfully. RegisterId ["+searchCriteria.getRegisterId()+"]");
        List<AttendanceLog> attendanceLogList = jdbcTemplate.query(query, rowMapper, preparedStmtList.toArray());
        log.info("Fetched Attendance Log list. RegisterId ["+searchCriteria.getRegisterId()+"]");
        return attendanceLogList;
    }

    public List<AttendanceLog> getAttendanceLogsBasedOnIndividualId(AttendanceLogSearchCriteria searchCriteria) {
        List<Object> preparedStmtList = new ArrayList<>();
        log.info("Fetching Attendance Log list. Based on Individual Ids ["+searchCriteria.getIndividualIds().toString()+"]");
        String query = queryBuilder.getAttendanceLogSearchQuery(searchCriteria, preparedStmtList);
        log.info("Query build successfully. Based on Individual Ids ["+searchCriteria.getIndividualIds().toString()+"]");
        List<AttendanceLog> attendanceLogList = jdbcTemplate.query(query, rowMapper, preparedStmtList.toArray());
        log.info("Fetched Attendance Log list. Based on Individual Ids ["+searchCriteria.getIndividualIds().toString()+"]");
        return attendanceLogList;
    }
}
