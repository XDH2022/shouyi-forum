package com.pzhu.acp.controller;

import com.pzhu.acp.common.BaseResponse;
import com.pzhu.acp.common.ResultUtils;
import com.pzhu.acp.service.AnalysisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;


@RestController
@Slf4j
@RequestMapping("/analysis")
public class AnalysisController {
    @Resource
    private AnalysisService analysisService;

    /**
     * 统计 总用户数，总组织数，总学院数
     */
    @GetMapping("/analysisInTotal")
    public BaseResponse<Map<String, Object>> analysisInTotal() {
        Map<String, Object> map = analysisService.analysisInTotal();
        return ResultUtils.success(map);
    }

    /**
     * 统计一周内帖子数，问题数，动态数
     */
    @GetMapping("/analysisInWeek")
    public BaseResponse<Map<String, Object>> analysisInWeek() {
        Map<String, Object> map = analysisService.analysisInWeek();
        return ResultUtils.success(map);
    }

    /**
     * 统计一周每天评论条数
     */
    @GetMapping("/analysisInComment")
    public BaseResponse<Map<String, Object>> analysisInComment() {
        Map<String, Object> map = analysisService.analysisInComment();
        return ResultUtils.success(map);
    }

    /**
     * 统计最近一周 每天帖子、问题、动态点赞数最高的数据
     */
    @GetMapping("/analysisInUp")
    public BaseResponse<Map<String,Object>> analysisInUp(){
        Map<String, Object> map = analysisService.analysisInUp();
        return ResultUtils.success(map);
    }
}
