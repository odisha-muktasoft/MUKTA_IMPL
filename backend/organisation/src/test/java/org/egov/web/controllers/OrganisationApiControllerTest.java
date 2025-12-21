package org.egov.web.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.egov.common.contract.response.ResponseInfo;
import org.egov.config.Configuration;
import org.egov.helper.OrganisationRequestTestBuilder;
import org.egov.kafka.OrganizationProducer;
import org.egov.repository.OrganisationRepository;
import org.egov.service.OrganisationEnrichmentService;
import org.egov.service.OrganisationService;
import org.egov.util.ResponseInfoFactory;
import org.egov.validator.OrganisationServiceValidator;
import org.egov.web.models.OrgRequest;
import org.egov.web.models.OrgResponse;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.ContextConfiguration;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(controllers = OrganisationApiController.class)
@ContextConfiguration(classes = OrganisationApiController.class)
class OrganisationApiControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean private OrganisationService organisationService;
    @MockBean private ResponseInfoFactory responseInfoFactory;
    @MockBean private OrganisationEnrichmentService organisationEnrichmentService;
    @MockBean private OrganisationServiceValidator organisationServiceValidator;
    @MockBean private OrganisationRepository organisationRepository;
    @MockBean private OrganizationProducer organizationProducer;
    @MockBean private Configuration configuration;
    @MockBean private JdbcTemplate jdbcTemplate;

    @Test
    @DisplayName("Organisation request should pass with API Operation CREATE")
    void createProjectPostSuccess() throws Exception {

        OrgRequest orgRequest = OrganisationRequestTestBuilder.builder()
                .withRequestInfo()
                .addGoodOrganisationForCreate()
                .build();

        when(organisationService.createOrganisationWithoutWorkFlow(any()))
                .thenReturn(orgRequest);

        when(responseInfoFactory.createResponseInfoFromRequestInfo(any(), any()))
                .thenReturn(ResponseInfo.builder().status("successful").build());

        MvcResult result = mockMvc.perform(
                        post("/organisation/v1/_create")
                                .contentType(MediaType.APPLICATION_JSON)
                                .content(objectMapper.writeValueAsString(orgRequest)))
                .andExpect(status().isOk())
                .andReturn();

        OrgResponse response = objectMapper.readValue(
                result.getResponse().getContentAsString(), OrgResponse.class);

        assertEquals("successful", response.getResponseInfo().getStatus());
        assertEquals(1, response.getOrganisations().size());
        assertNotNull(response.getOrganisations().get(0).getName());
    }
}