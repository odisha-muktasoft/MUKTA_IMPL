package org.egov.works.measurement.util;

import org.egov.works.measurement.web.models.MeasurementSearchRequest;
import org.egov.works.measurement.web.models.Pagination;
import org.springframework.stereotype.Component;

@Component
public class PaginationUtil {
    public void handleNullPagination(MeasurementSearchRequest body){
        if (body.getPagination() == null) {
            body.setPagination(new Pagination());
            body.getPagination().setLimit(null);
            body.getPagination().setOffSet(null);
            body.getPagination().setOrder(Pagination.OrderEnum.DESC);
        }
    }
}
