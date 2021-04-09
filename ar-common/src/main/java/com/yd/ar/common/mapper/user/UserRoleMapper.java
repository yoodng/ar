package com.yd.ar.common.mapper.user;

import com.yd.ar.common.po.user.UserRole;

public interface UserRoleMapper {
    int insert(UserRole record);

    int insertSelective(UserRole record);
}