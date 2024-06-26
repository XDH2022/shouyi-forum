package com.pzhu.acp.job;

import com.pzhu.acp.constant.RedisConstant;
import com.pzhu.acp.model.entity.Discuss;
import com.pzhu.acp.utils.GsonUtil;
import com.pzhu.acp.enums.TagsEnum;
import com.pzhu.acp.factory.ThumbUpFactory;
import com.pzhu.acp.mapper.DiscussMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Set;


@Slf4j
@Component
public class DiscussUpNumJob extends ThumbUpFactory {
    @Resource
    private DiscussMapper discussMapper;

    /**
     * 每一分钟，清理一下所有点赞数
     */
    @Override
    @Scheduled(cron = "0 0/1 * * * ? ")
    protected void addThumbUpJob() {
        log.info("帖子点赞定时任务开始工作");
        doAddDiscussUp(RedisConstant.DISCUSS_BASE_UP_KEY + SPLIT_SYMBOL + "*", TagsEnum.UP.getFlag());
        doAddDiscussUp(RedisConstant.DISCUSS_DOWN_KEY + SPLIT_SYMBOL + "*", TagsEnum.DOWN.getFlag());
    }

    private void doAddDiscussUp(String redisKey, String flag) {
        Set<String> allKeys = redisTemplate.keys(redisKey);
        if (CollectionUtils.isEmpty(allKeys)) {
            log.info("key empty,do nothing!!!");
            return;
        }
        allKeys.forEach(key -> {
            try {
                String[] split = key.split(SPLIT_SYMBOL);
                Long id = Long.parseLong(split[1]);
                String up = (String) redisTemplate.opsForValue().get(key);
                if (StringUtils.isBlank(up)) {
                    return;
                }
                Discuss discuss = new Discuss();
                discuss.setId(id);
                if (flag.equals(TagsEnum.UP.getFlag())) {
                    discuss.setUp(Integer.parseInt(up));
                } else {
                    discuss.setDown(Integer.parseInt(up));
                }
                discussMapper.updateById(discuss);
                redisTemplate.delete(key);
            } catch (Exception e) {
                log.error("discuss点赞任务失败，该key为:{}", GsonUtil.toJson(key));
            }
        });
    }
}
