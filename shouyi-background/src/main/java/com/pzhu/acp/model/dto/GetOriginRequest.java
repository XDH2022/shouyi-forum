package com.pzhu.acp.model.dto;

import lombok.Data;

import java.io.Serializable;


@Data
public class GetOriginRequest extends WorkPageRequest implements Serializable {
    private  long uid;
    /**
     * 学院名
     */
    private Long collegeId;

    /**
     * 用户
     */
    private String userName;

    /**
     * 组织名
     */
    private String originName;
}
