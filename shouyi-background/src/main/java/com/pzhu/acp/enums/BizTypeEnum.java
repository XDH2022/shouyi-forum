package com.pzhu.acp.enums;

import lombok.Getter;

import java.util.Objects;


public enum BizTypeEnum {
    DISCUSS("discuss", "帖子"),
    QUESTION("question", "问答"),
    DYNAMIC("dynamic", "动态");
    /**
     * 讨论类型
     */
    @Getter
    private final String type;

    /**
     * 描述信息
     */
    @Getter
    private final String msg;

    BizTypeEnum(String type, String msg) {
        this.type = type;
        this.msg = msg;
    }

    public static Boolean checkBizType(String bizType) {
        for (BizTypeEnum orderTypeEnum : values()) {
            if (Objects.equals(orderTypeEnum.getType(), bizType)) {
                return Boolean.TRUE;
            }
        }
        return Boolean.FALSE;
    }
}
