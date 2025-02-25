package org.egov.hrms.web.contract;

import lombok.*;

import java.util.Map;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class WorksSmsRequest {

    private String mobileNumber;
    private String message;

    private Map<String,Object> additionalFields;


}
