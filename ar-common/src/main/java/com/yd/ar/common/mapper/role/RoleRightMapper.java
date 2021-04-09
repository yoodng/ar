package com.yd.ar.common.mapper.role;

import com.yd.ar.common.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

public interface RoleRightMapper extends BaseMapper {

	Integer deleteRoleRights(@Param("roleId") Integer roleId);
}