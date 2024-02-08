package org.egov.web.controllers;

import org.egov.service.BulkUpdateService;
import org.egov.web.models.MdmsCriteriaReqV2;
import org.egov.web.models.MdmsResponseV2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping()
public class BulkUpdateController {

    @Autowired
    private BulkUpdateService bulkUpdateService;

    @PostMapping("/_bulkUpdate")
    public List<Map<String, Object>> bulkUpdate(@RequestParam("file") MultipartFile file, @Valid @RequestParam("mdmsSearchCriteria") String mdmsSearchCriteria, @RequestParam("newValidToDate") String newValidToDate) throws Exception {
        return bulkUpdateService.bulkUpdate(file, mdmsSearchCriteria, newValidToDate);
    }

}
