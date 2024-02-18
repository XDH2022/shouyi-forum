package com.pzhu.acp.factory;

import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;

import javax.annotation.Resource;

@Slf4j
public abstract class ThumbUpFactory {
    @Resource
    protected RedisTemplate<String, Object> redisTemplate;

    protected static final String SPLIT_SYMBOL = ":";

    protected abstract void addThumbUpJob();
}
