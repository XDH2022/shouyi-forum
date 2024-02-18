package com.pzhu.acp.model.dto;

import lombok.Data;

import java.io.Serializable;


@Data
public class ReplyAddRequest implements Serializable {
    /**
     * 被回复人id
     */
    private Long uid;

    /**
     * 评论id
     */
    private Long cid;
    private Long did;

    /**
     * 回复人id
     */
    private Long replyId;

    /**
     * 回复内容
     */
    private String replyContent;
}
