package com.pzhu.acp.handler;

import com.pzhu.acp.enums.BizTypeEnum;


public class QuestionBizHandler extends BizHandler {
    @Override
    public void afterPropertiesSet() throws Exception {
        BizHandlerRegister.register(BizTypeEnum.QUESTION.getType(), this);
    }
}
