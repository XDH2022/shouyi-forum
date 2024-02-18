package com.pzhu.acp.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pzhu.acp.model.query.GetCommentQuery;
import com.pzhu.acp.model.vo.CommentVO;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;

/**
 * @Auther: gali
 * @Date: 2022-11-22 22:18
 * @Description:
 */
@SpringBootTest
public class TestCommentMapper {
    @Resource
    private CommentMapper commentMapper;
    @Resource
    private OriginUserMapper originUserMapper;


    @Test
    public void testSelectComment(){
        GetCommentQuery getCommentQuery = new GetCommentQuery();
        getCommentQuery.setDid(1L);
        getCommentQuery.setPageNum(1);
        getCommentQuery.setPageSize(5);
        Page<CommentVO> commentVOPage = new Page<>(getCommentQuery.getPageNum(), getCommentQuery.getPageSize());
        System.out.println(commentMapper.selectCommentByPageOrParam(commentVOPage, getCommentQuery).getRecords());
    }
    @Test
    public void testPasswordEncrypt() {
        String password = "123456";
        String salt = "acp_gali"; // 这里可以设置一个盐值，增加密码的安全性
        String encryptPassword = DigestUtils.md5DigestAsHex((salt + password).getBytes());
        System.out.println(encryptPassword);
    }
    @Test
    public void testOriginUser() {
        System.out.println(originUserMapper.findOidListByUid(2L));
    }
}
