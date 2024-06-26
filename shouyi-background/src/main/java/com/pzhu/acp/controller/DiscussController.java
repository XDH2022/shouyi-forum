package com.pzhu.acp.controller;

import com.pzhu.acp.assember.DiscussAssembler;
import com.pzhu.acp.common.BaseResponse;
import com.pzhu.acp.common.ErrorCode;
import com.pzhu.acp.common.ResultUtils;
import com.pzhu.acp.constant.CommonConstant;

import com.pzhu.acp.model.dto.*;
import com.pzhu.acp.model.entity.Discuss;
import com.pzhu.acp.model.query.GetDiscussByPageQuery;
import com.pzhu.acp.service.DiscussService;
import com.pzhu.acp.utils.GsonUtil;
import com.pzhu.acp.enums.AuditEnum;
import com.pzhu.acp.exception.BusinessException;

import com.pzhu.acp.model.vo.DiscussVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;


@RestController
@RequestMapping("/discuss")
@Slf4j
public class DiscussController {

    @Resource
    private DiscussService discussService;

    /**
     * 增加讨论
     */
    @PostMapping("/addDiscuss")
    public BaseResponse<Boolean> addDiscuss(@RequestBody DiscussAddRequest discussAddRequest) {
        if (discussAddRequest.getUid() < CommonConstant.MIN_ID ||
                discussAddRequest.getTid() < CommonConstant.MIN_ID) {
            log.error("参数校验失败,该参数为：{}", GsonUtil.toJson(discussAddRequest));
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        if (StringUtils.isBlank(discussAddRequest.getTitle()) ||
                StringUtils.isBlank(discussAddRequest.getCover()) ||
                StringUtils.isBlank(discussAddRequest.getMessage())) {
            log.error("参数校验失败,该参数为：{}", GsonUtil.toJson(discussAddRequest));
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        if (discussAddRequest.getTitle().length() > CommonConstant.TITLE_MAX_LENGTH ||
                discussAddRequest.getMessage().length() < CommonConstant.CONTENT_MIN_LENGTH) {
            log.error("参数校验失败，该参数为：{}", GsonUtil.toJson(discussAddRequest));
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Discuss discuss = new Discuss();
        BeanUtils.copyProperties(discussAddRequest, discuss);
        boolean isSuccess = discussService.addDiscuss(discuss);
        return ResultUtils.success(isSuccess);
    }

    /**
     * 更新讨论
     */
    @PostMapping("/updateDiscuss")
    public BaseResponse<Boolean> updateDiscuss(@RequestBody DiscussUpdateRequest discussUpdateRequest) {
        if (discussUpdateRequest.getUid() < CommonConstant.MIN_ID ||
                discussUpdateRequest.getId() < CommonConstant.MIN_ID ||
                discussUpdateRequest.getTid() < CommonConstant.MIN_ID) {
            log.error("参数校验失败,该参数为：{}", GsonUtil.toJson(discussUpdateRequest));
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        if (StringUtils.isBlank(discussUpdateRequest.getTitle()) ||
                StringUtils.isBlank(discussUpdateRequest.getCover()) ||
                StringUtils.isBlank(discussUpdateRequest.getMessage())) {
            log.error("参数校验失败,该参数为：{}", GsonUtil.toJson(discussUpdateRequest));
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        if (discussUpdateRequest.getIsAudit() < AuditEnum.AUDITING.getType() ||
                discussUpdateRequest.getIsAudit() > AuditEnum.AUDIT_REFUSE.getType()) {
            log.error("参数校验失败,该参数为：{}", GsonUtil.toJson(discussUpdateRequest));
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Discuss discuss = new Discuss();
        BeanUtils.copyProperties(discussUpdateRequest, discuss);
        boolean isSuccess = discussService.updateDiscuss(discuss);
        return ResultUtils.success(isSuccess);
    }

    /**
     * 删除讨论
     */
    @DeleteMapping("/deleteDiscuss")
    public BaseResponse<Boolean> deleteDiscuss(@RequestBody DiscussDeleteRequest discussDeleteRequest) {
        discussDeleteRequest.getIds().forEach(item -> {
            if (item < CommonConstant.MIN_ID) {
                log.error("参数校验失败,该参数为：{}", GsonUtil.toJson(item));
                throw new BusinessException(ErrorCode.PARAMS_ERROR);
            }
        });
        boolean isSuccess = discussService.deleteDiscuss(discussDeleteRequest.getIds());
        return ResultUtils.success(isSuccess);
    }

    /**
     * 点赞相关
     */
    @PostMapping("/upOrDownAction")
    public BaseResponse<Boolean> upOrDownAction(@RequestBody DiscussUpOrDownRequest discussUpOrDownRequest) {
        if (discussUpOrDownRequest.getId() < CommonConstant.MIN_ID) {
            log.error("参数校验失败,该参数为：{}", GsonUtil.toJson(discussUpOrDownRequest));
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        if (StringUtils.isBlank(discussUpOrDownRequest.getFlag())) {
            log.error("参数校验失败,该参数为：{}", GsonUtil.toJson(discussUpOrDownRequest));
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        if ((discussUpOrDownRequest.getUid() == null)) {
            log.error("参数校验失败,该参数为：{}", GsonUtil.toJson(discussUpOrDownRequest));
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Discuss discuss = new Discuss();
        BeanUtils.copyProperties(discussUpOrDownRequest, discuss);
        boolean isSuccess = discussService.upOrDownAction(discuss, discussUpOrDownRequest.getFlag());
        return ResultUtils.success(isSuccess);
    }

    /**
     * 分页获取文章信息
     */
    @PostMapping("/getDiscussByPageOrParam")
    public BaseResponse<Map<String, Object>> getDiscussByPageOrParam(@RequestBody GetDiscussByPageRequest getDiscussByPageRequest) {
        if (getDiscussByPageRequest.getPageNum() < CommonConstant.MIN_PAGE_NUM ||
                getDiscussByPageRequest.getPageSize() < CommonConstant.MIN_PAGE_SIZE) {
            log.error("参数校验失败,该参数为：{}", GsonUtil.toJson(getDiscussByPageRequest));
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        GetDiscussByPageQuery getDiscussByPageQuery = DiscussAssembler.toGetDiscussByPageQuery(getDiscussByPageRequest);
        Map<String, Object> map = discussService.getDiscussByPageOrParam(getDiscussByPageQuery);
        return ResultUtils.success(map);
    }

    /**
     * 根据id获取讨论详情
     */
    @GetMapping("/getDiscussInfoById/{id}")
    public BaseResponse<DiscussVO> getDiscussInfoById(@PathVariable Long id) {
        if (id == null || id < CommonConstant.MIN_ID) {
            log.error("参数校验失败,该参数为：{}", GsonUtil.toJson(id));
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        DiscussVO discussInfoById = discussService.getDiscussInfoById(id);
        return ResultUtils.success(discussInfoById);
    }
}
