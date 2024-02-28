package com.pzhu.acp.model.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class PermissionDeleteToRoleRequest implements Serializable {
    private Long roleId;

    /**
     * 菜单id
     */
    private List<Long> permissionId;
}
