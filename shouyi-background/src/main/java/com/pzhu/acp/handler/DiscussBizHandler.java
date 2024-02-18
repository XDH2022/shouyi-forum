package com.pzhu.acp.handler;

import com.pzhu.acp.enums.BizTypeEnum;

public class DiscussBizHandler extends BizHandler {
    @Override
    public void afterPropertiesSet() throws Exception {
        BizHandlerRegister.register(BizTypeEnum.DISCUSS.getType(), this);
    }
}
