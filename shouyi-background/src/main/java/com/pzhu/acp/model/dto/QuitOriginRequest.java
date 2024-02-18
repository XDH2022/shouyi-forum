package com.pzhu.acp.model.dto;

import lombok.Data;

import java.io.Serializable;


@Data
public class QuitOriginRequest extends WorkPageRequest implements Serializable {
    private  long uid;
   private long oid;
}
