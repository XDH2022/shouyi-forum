package com.pzhu.acp.handler;

import com.pzhu.acp.enums.BizTypeEnum;


public class DynamicBizHandler extends BizHandler {
    @Override
    public void afterPropertiesSet() throws Exception {
        BizHandlerRegister.register(BizTypeEnum.DYNAMIC.getType(), this);
    }
}
