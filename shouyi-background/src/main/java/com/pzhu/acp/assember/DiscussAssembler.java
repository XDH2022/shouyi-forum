package com.pzhu.acp.assember;

import com.pzhu.acp.model.query.GetDiscussByPageQuery;
import com.pzhu.acp.model.dto.GetDiscussByPageRequest;


public class DiscussAssembler {
    /**
     * GetDiscussByPageRequest=>GetDiscussByPageQuery
     */
    public static GetDiscussByPageQuery toGetDiscussByPageQuery(GetDiscussByPageRequest getDiscussByPageRequest) {
        GetDiscussByPageQuery getDiscussByPageQuery = new GetDiscussByPageQuery();
        if (getDiscussByPageRequest.getTitle() != null) {
            getDiscussByPageQuery.setTitle(getDiscussByPageRequest.getTitle());
        }
        if (getDiscussByPageRequest.getSortType() != null) {
            getDiscussByPageQuery.setSortType(getDiscussByPageRequest.getSortType());
        }
        if (getDiscussByPageRequest.getIsAuditType() != null) {
            getDiscussByPageQuery.setIsAuditType(getDiscussByPageRequest.getIsAuditType());
        }
        if (getDiscussByPageRequest.getTid() != null) {
            getDiscussByPageQuery.setTid(getDiscussByPageRequest.getTid());
        }
        getDiscussByPageQuery.setPageNum(getDiscussByPageRequest.getPageNum());
        getDiscussByPageQuery.setPageSize(getDiscussByPageRequest.getPageSize());
        return getDiscussByPageQuery;
    }
}
