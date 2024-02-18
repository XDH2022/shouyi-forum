package com.pzhu.acp.handler;

import com.pzhu.acp.common.ErrorCode;
import com.pzhu.acp.enums.BizTypeEnum;
import com.pzhu.acp.exception.BusinessException;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


public class BizHandlerRegister {

    private static final Map<String, BizHandler> handlerMap = new ConcurrentHashMap<>();

    /**
     * 服务注册
     *
     * @param bizType
     * @param bizHandler
     */
    public static void register(String bizType, BizHandler bizHandler) {
        if (BizTypeEnum.checkBizType(bizType)) {
            handlerMap.put(bizType, bizHandler);
        }
        throw new BusinessException(ErrorCode.BIZ_SERVICE_ERROR);
    }

    /**
     * 服务发现
     *
     * @param bizType
     * @return
     */
    public static BizHandler getService(String bizType) {
        BizHandler bizHandler = handlerMap.get(bizType);
        if (bizHandler == null) {
            throw new BusinessException(ErrorCode.BIZ_SERVICE_ERROR);
        }
        return bizHandler;
    }
}
