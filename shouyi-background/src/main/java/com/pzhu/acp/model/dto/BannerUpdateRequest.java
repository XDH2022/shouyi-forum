package com.pzhu.acp.model.dto;

import lombok.Data;

import java.io.Serializable;


@Data
public class BannerUpdateRequest implements Serializable {
    /**
     * id
     */
    private Long id;

    /**
     * 图片名称
     */
    private String name;

    /**
     * 图片地址
     */
    private String imageUrl;
}
