package com.yd.ar.portal.service.my;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.po.user.User;


public interface AccountService {

    /**
     * TODO 查询用户账号信息
     * @param userId
     * @return
     * @throws ServiceException
     */
    User getUserById(Integer userId) throws ServiceException;

    /**
     * TODO 更新用户账号信息
     * @param user
     * @return
     * @throws ServiceException
     */
    Integer updateUser(User user) throws ServiceException;
}
