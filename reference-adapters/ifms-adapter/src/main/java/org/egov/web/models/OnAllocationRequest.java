package org.egov.web.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OnAllocationRequest {
    @JsonProperty("signature")
    private String signature;
    @JsonProperty("header")
    private MsgCallbackHeader header;
    @JsonProperty("message")
    private Allocation message;
}
