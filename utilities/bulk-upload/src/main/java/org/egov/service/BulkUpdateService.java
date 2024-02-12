package org.egov.service;

import com.fasterxml.jackson.databind.node.ObjectNode;
import org.egov.util.BulkUploadUtil;
import org.egov.web.models.Mdms;
import org.egov.web.models.MdmsCriteriaReqV2;
import org.egov.web.models.MdmsRequest;
import org.egov.web.models.MdmsResponseV2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class BulkUpdateService {

    @Autowired
    private BulkUploadService bulkUploadService;

    @Autowired
    private BulkUploadUtil bulkUploadUtil;

    private List<Mdms> getMdmsV2Data(MdmsCriteriaReqV2 mdmsCriteriaReqV2){

//        Getting all the data from MDMS-V2
        return bulkUploadUtil.search(mdmsCriteriaReqV2).getMdms();

    }

    private List<String> getSorIdsToUpdate(List<Map<String, Object>> jsonData){

        List<String> sorIdsList = new ArrayList<>();

        jsonData.forEach(jsonDatamap -> {

//            Getting sorIds to be updated
            String sorId = (String) jsonDatamap.get("sorId");
            sorIdsList.add(sorId);

        });

        return sorIdsList;

    }

    private void updateValidToDate(List<String> sorIds, MdmsCriteriaReqV2 mdmsCriteriaReqV2, String newValidToDate){

//        Getting Data from Mdms-v2 to update 'validTo' date
        List<Mdms> mdmsDataList = getMdmsV2Data(mdmsCriteriaReqV2);

//        Converting date format to epoc date format
        long epocValidToDate = bulkUploadService.convertDateToEpochDateTime(newValidToDate);

        for (Mdms mdms : mdmsDataList) {
            ObjectNode dataNode = (ObjectNode) mdms.getData();

//            Updating validTo date of SORs matching with sorId in file
            if (sorIds.contains(dataNode.get("sorId").asText())) {
                dataNode.put("validTo", String.valueOf(epocValidToDate));
                MdmsRequest mdmsRequest = MdmsRequest.builder().requestInfo(mdmsCriteriaReqV2.getRequestInfo()).mdms(mdms).build();
                MdmsResponseV2 mdmsResponseV2 = bulkUploadUtil.update(mdmsRequest);
            }
        }
    }

    public List<Map<String, Object>> bulkUpdate(MultipartFile file, String mdmsSearchCriteria, String newValidToDate) throws IOException {

//        Reading new SOR Rates File
        List<Map<String, Object>> fileData = bulkUploadService.readFile(file);

//        Getting sorIds from file to disable old SOR Rates
        List<String> sorIds = getSorIdsToUpdate(fileData);

//        Parsing mdmsSearchCriteria to MdmsSearchCrtiteria of MDMS-V2
        MdmsCriteriaReqV2 mdmsCriteriaReqV2 = bulkUploadUtil.getMdmsV2Request(mdmsSearchCriteria);

//        Updating... (Disabling Old SOR Rates) in MDMS-V2
        updateValidToDate(sorIds, mdmsCriteriaReqV2, newValidToDate);

//        Uploading new SOR Rates to MDMS-V2
        String tenantId = mdmsCriteriaReqV2.getMdmsCriteria().getTenantId();
        return bulkUploadService.createSORRate(bulkUploadUtil.getMdmsRequestForBulkUpload(tenantId),fileData);

    }



}
