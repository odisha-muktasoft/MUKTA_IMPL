package org.egov.web.controllers;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.egov.TestConfiguration;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
* API tests for BankaccountApiController
*/
@Disabled
@ExtendWith(SpringExtension.class)
@WebMvcTest(BankaccountApiController.class)
@Import(TestConfiguration.class)
public class BankaccountApiControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void bankaccountV1CreatePostSuccess() throws Exception {
        mockMvc.perform(post("/bankaccount/v1/_create")
                        .contentType(MediaType.APPLICATION_JSON))
            .andExpect(status().isOk());
    }

    @Test
    public void bankaccountV1CreatePostFailure() throws Exception {
        mockMvc.perform(post("/bankaccount/v1/_create")
                        .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
    }

    @Test
    public void bankaccountV1SearchPostSuccess() throws Exception {
        mockMvc.perform(post("/bankaccount/v1/_search")
                        .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk());
    }

    @Test
    public void bankaccountV1SearchPostFailure() throws Exception {
        mockMvc.perform(post("/bankaccount/v1/_search")
                        .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
    }

    @Test
    public void bankaccountV1UpdatePostSuccess() throws Exception {
        mockMvc.perform(post("/bankaccount/v1/_update")
                        .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk());
    }

    @Test
    public void bankaccountV1UpdatePostFailure() throws Exception {
        mockMvc.perform(post("/bankaccount/v1/_update")
                        .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
    }

}
