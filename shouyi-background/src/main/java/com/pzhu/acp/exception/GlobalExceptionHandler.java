package com.pzhu.acp.exception;

import cn.dev33.satoken.exception.NotLoginException;
import com.pzhu.acp.common.BaseResponse;
import com.pzhu.acp.common.ErrorCode;
import com.pzhu.acp.common.ResultUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(BusinessException.class)
    public BaseResponse businessExceptionHandler(BusinessException e) {
        log.error("businessException: " + e.getMessage(), e);
        return ResultUtils.error(e.getCode(), e.getMessage(), e.getDescription());
    }

    @ExceptionHandler(RuntimeException.class)
    public BaseResponse runtimeExceptionHandler(RuntimeException e) {
        log.error("runtimeException", e);
        return ResultUtils.error(ErrorCode.SYSTEM_ERROR, e.getMessage(), "");
    }

    @ExceptionHandler(NotLoginException.class)
    public BaseResponse saTokenExceptionHandler(RuntimeException e) {
        log.error("notLoginException", e);
        return ResultUtils.error(ErrorCode.NOT_LOGIN, e.getMessage(), "");
    }

}
