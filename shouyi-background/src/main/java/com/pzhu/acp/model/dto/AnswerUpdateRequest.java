package com.pzhu.acp.model.dto;

import lombok.Data;


@Data
public class AnswerUpdateRequest {
    /**
     * id
     */
    private Long id;

    /**
     * 是否采纳（0未采纳，1采纳）
     */
    private Integer isAdopt;
}
