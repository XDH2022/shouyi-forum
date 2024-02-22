package com.pzhu.acp.model.dto;

import lombok.Data;

import javax.validation.constraints.Size;
import java.io.Serializable;

@Data
public class BannerAddRequest implements Serializable {
    /**
     * 图片名称
     */
    private String name;

    /**
     * 图片地址
     */
    private String imageUrl;
}
