package com.yd.ar.portal.service.my.impl;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.mapper.user.UserMapper;
import com.yd.ar.common.po.user.User;
import com.yd.ar.common.util.CommonUtil;
import com.yd.ar.portal.service.my.AccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Resource
    private UserMapper userMapper;

    /**
     * TODO 查询用户账号信息
     *
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public User getUserById(Integer userId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(userId)) {
                return userMapper.getById(userId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载用户账号信息时发生异常！");
        }
        return null;
    }

    /**
     * TODO 更新用户账号信息
     *
     * @param user
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer updateUser(User user) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(user.getUserId())) {
                return userMapper.update(user);
            }
        } catch (Exception e) {
            throw new ServiceException("更新用户信息时发生异常");
        }
        return 0;
    }
}
