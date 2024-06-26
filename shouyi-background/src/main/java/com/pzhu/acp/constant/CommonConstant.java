package com.pzhu.acp.constant;


public interface CommonConstant {
    /**
     * id最小数
     */
    int MIN_ID = 0;

    /**
     * 页码最小数
     */
    int MIN_PAGE_NUM = 0;

    /**
     * 页数最小数
     */
    int MIN_PAGE_SIZE = 0;

    /**
     * 最小点赞数
     */
    int MIN_UP_NUM = 0;

    /**
     * 最小踩数
     */
    int MIN_DOWN_NUM = 0;

    /**
     * 点赞数
     */
    int UP_NUM = 1;

    /**
     * 取消点赞数
     */
    int REDUCE_UP_NUM = -1;

    /**
     * 踩数
     */
    int DOWN_NUM = 1;

    /**
     * 取消踩数
     */
    int REDUCE_DOWN_NUM = -1;

    /**
     * 标题最大长度
     */
    int TITLE_MAX_LENGTH = 30;

    /**
     * 内容最小长度
     */
    int CONTENT_MIN_LENGTH = 5;

    /**
     * 最小职位数
     */
    int POSITION_MIN_NUM = 0;

    /**
     * 最小状态
     */
    int MIN_USER_STATUS = 0;

    /**
     * 默认头像
     */
    String DEFAULT_AVATAR = "http://localhost:9000/xdh-bucket/20240106/default.png";

    /**
     * 名字最大长度
     */
    int MAX_USERNAME_LENGTH = 20;
}
