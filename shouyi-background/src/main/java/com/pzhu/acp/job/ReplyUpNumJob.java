package com.pzhu.acp.job;

import com.pzhu.acp.constant.RedisConstant;
import com.pzhu.acp.enums.TagsEnum;
import com.pzhu.acp.factory.ThumbUpFactory;
import com.pzhu.acp.mapper.ReplyMapper;
import com.pzhu.acp.model.entity.Reply;
import com.pzhu.acp.utils.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Set;

@Slf4j
@Component
public class ReplyUpNumJob extends ThumbUpFactory {

    @Resource
    private ReplyMapper replyMapper;

    /**
     * 每一分钟，清理一下所有点赞数
     */
    @Override
    @Scheduled(cron = "0 0/1 * * * ? ")
    protected void addThumbUpJob() {
        log.info("回复点赞定时任务开始工作");
        doAddDiscussUp(RedisConstant.REPLY_BASE_UP_KEY + SPLIT_SYMBOL + "*", TagsEnum.UP.getFlag());
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
                Reply dynamic = new Reply();
                dynamic.setId(id);
                if (flag.equals(TagsEnum.UP.getFlag())) {
                    dynamic.setUp(Integer.parseInt(up));
                } else {
                    // donothing
                }
                replyMapper.updateById(dynamic);
                redisTemplate.delete(key);
            } catch (Exception e) {
                log.error("comment点赞任务失败，该key为:{}", GsonUtil.toJson(key));
            }
        });
    }
}
