package com.pzhu.acp.model.dto;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


@Data
public class CollegeAddRequest implements Serializable {
    /**
     * 学院名称
     */
    private String name;

}
