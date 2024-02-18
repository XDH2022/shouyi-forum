package com.pzhu.acp.model.dto;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.Date;


@Data
public class AnswerAddRequest {
    /**
     * 被回复人id
     */
    private Long uid;

    /**
     * 问题id
     */
    private Long qid;

    /**
     * 回复人id
     */
    private Long answerId;

    /**
     * 回复内容
     */
    private String answerContent;
}
