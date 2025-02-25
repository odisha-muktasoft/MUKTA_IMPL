package org.egov.web.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import digit.models.coremodels.AuditDetails;
import lombok.*;
import org.springframework.validation.annotation.Validated;

import jakarta.validation.Valid;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * AttendanceLog
 */
@Validated

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AttendanceLog {
    @JsonProperty("id")
    private String id = null;

    @JsonProperty("clientReferenceId")
    private String clientReferenceId = null;

    @JsonProperty("registerId")
    private String registerId = null;

    @JsonProperty("individualId")
    private String individualId = null;

    @JsonProperty("tenantId")
    private String tenantId = null;

    @JsonProperty("time")
    private BigDecimal time = null;

    @JsonProperty("type")
    private String type = null;

    @JsonProperty("status")
    private Status status = null;

    @JsonProperty("documentIds")
    @Valid
    private List<Document> documentIds = null;

    @JsonProperty("auditDetails")
    private AuditDetails auditDetails = null;

    @JsonProperty("clientAuditDetails")
    private AuditDetails clientAuditDetails = null;

    @JsonProperty("additionalDetails")
    private Object additionalDetails = null;


    public AttendanceLog addDocumentIdsItem(Document documentIdsItem) {
        if (this.documentIds == null) {
            this.documentIds = new ArrayList<>();
        }
        this.documentIds.add(documentIdsItem);
        return this;
    }

}

