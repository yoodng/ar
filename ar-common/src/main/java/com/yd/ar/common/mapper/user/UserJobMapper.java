package com.yd.ar.common.mapper.user;

import com.yd.ar.common.base.BaseMapper;
import com.yd.ar.common.po.user.UserJob;

import java.util.List;

public interface UserJobMapper extends BaseMapper{

    /**
     * TODO 查询用户工作信息
     * @param userId
     * @return
     * @throws Exception
     */
    List<UserJob> getUserJobByUserId(Integer userId) throws Exception;

}