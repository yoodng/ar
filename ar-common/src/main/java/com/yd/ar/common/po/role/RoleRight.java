package com.yd.ar.common.po.role;

import com.yd.ar.common.base.BaseEntity;

public class RoleRight extends BaseEntity {
    /**
	* @Fields serialVersionUID : TODO <br>
	*/ 
	private static final long serialVersionUID = 1L;

	private Integer roleId;

    private Integer rightId;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getRightId() {
        return rightId;
    }

    public void setRightId(Integer rightId) {
        this.rightId = rightId;
    }
}