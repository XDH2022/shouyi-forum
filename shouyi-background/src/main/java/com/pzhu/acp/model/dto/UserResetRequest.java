package com.pzhu.acp.model.dto;

import java.io.Serializable;

import lombok.Data;

/**
 * 用户重置密码请求体
 *
 * @author gali
 */
@Data
public class UserResetRequest implements Serializable {

    private static final long serialVersionUID = 3191241716373120795L;
    private Long id;
    /**
     * 邮箱
     */
    private String email;

    /**
     * 新密码
     */
    private String password;


    /**
     * 验证码
     */
    private String code;
}
