package com.pzhu.acp.enums;

import com.pzhu.acp.common.ErrorCode;
import com.pzhu.acp.exception.BusinessException;
import lombok.Getter;

import java.util.Objects;


public enum OrderTypeEnum {
    INIT_ORDER(0, "倒序"),
    POSITIVE(1, "正序"),
    UP_ORDER(2, "点赞数"),
    DOWN_ORDER(3, "踩数");
    /**
     * 排序规则
     */
    @Getter
    private final Integer orderType;

    /**
     * 排序描述
     */
    @Getter
    private final String orderMsg;

    OrderTypeEnum(Integer orderType, String orderMsg) {
        this.orderType = orderType;
        this.orderMsg = orderMsg;
    }

    public static OrderTypeEnum getOrderTypeEnum(Integer type) {
        for (OrderTypeEnum orderTypeEnum : values()) {
            if (Objects.equals(orderTypeEnum.getOrderType(), type)) {
                return orderTypeEnum;
            }
        }
        throw new BusinessException(ErrorCode.ERROR_ENUM_PARAM);
    }
}
