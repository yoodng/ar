package com.yd.ar.common.mapper.user;

import com.yd.ar.common.base.BaseMapper;
import com.yd.ar.common.po.user.UserInfo;
import org.apache.ibatis.annotations.Param;

public interface UserInfoMapper extends BaseMapper {

    /**
     * TODO 通过userId获取UserInfo
     * @return
     * @throws Exception
     */
    UserInfo getUserInfoByUserId(@Param("userId") Integer userId) throws Exception;
}