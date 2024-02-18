package com.pzhu.acp.assember;

import com.pzhu.acp.model.query.DeleteOriginUserQuery;
import com.pzhu.acp.model.dto.OriginUserDeleteRequest;

public class OriginUserAssembler {
    /**
     * 类型转换：OriginUserDeleteRequest-》DeleteOriginUserQuery
     */
    public static DeleteOriginUserQuery toDeleteOriginUserQuery(OriginUserDeleteRequest originUserDeleteRequest) {
        DeleteOriginUserQuery deleteOriginUserQuery = new DeleteOriginUserQuery();
        deleteOriginUserQuery.setId(originUserDeleteRequest.getIds());
        deleteOriginUserQuery.setOid(originUserDeleteRequest.getOid());
        deleteOriginUserQuery.setUids(originUserDeleteRequest.getUids());
        return deleteOriginUserQuery;
    }
}
