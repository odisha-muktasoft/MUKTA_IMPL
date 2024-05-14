package org.egov.web.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.egov.common.contract.request.RequestInfo;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

public class ProcessInstanceRequest {

    @JsonProperty("RequestInfo")
    private RequestInfo requestInfo;
    @JsonProperty("ProcessInstances")
    private @Valid
    @NotNull List<ProcessInstance> processInstances;

    public ProcessInstanceRequest addProcessInstanceItem(ProcessInstance processInstanceItem) {
        if (this.processInstances == null) {
            this.processInstances = new ArrayList();
        }

        this.processInstances.add(processInstanceItem);
        return this;
    }
    public ProcessInstanceRequest(RequestInfo requestInfo, @NotNull List<ProcessInstance> processInstances) {
        this.requestInfo = requestInfo;
        this.processInstances = processInstances;
    }

}
