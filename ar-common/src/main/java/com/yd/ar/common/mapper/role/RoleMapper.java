package com.yd.ar.common.mapper.role;

import java.util.List;
import java.util.Map;

import com.yd.ar.common.base.BaseMapper;
import com.yd.ar.common.page.Page;
import com.yd.ar.common.po.role.Right;
import com.yd.ar.common.po.role.Role;
import org.apache.ibatis.annotations.Param;

public interface RoleMapper extends BaseMapper {

    Integer getRoleId(String roleValue) throws Exception;

    List<Role> queryRole(Page<Role> page) throws Exception;

    List<Right> getRightsByRole(Integer roleId) throws Exception;

    Map<String, Object> getRoleValueByAdminId(@Param("adminId") Integer adminId) throws Exception;

    List<Right> getAllRoles() throws Exception;
}