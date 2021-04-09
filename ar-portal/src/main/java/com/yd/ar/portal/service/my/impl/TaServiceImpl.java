package com.yd.ar.portal.service.my.impl;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.mapper.user.UserMapper;
import com.yd.ar.common.util.CommonUtil;
import com.yd.ar.portal.service.my.TaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;


@Service("taService")
public class TaServiceImpl implements TaService {

    @Resource
    private UserMapper userMapper;

    /**
     * TODO 获取用户的基本信息：userId, account, potrait, trueName, introduce
     *
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public Map<String, Object> getUserBasicInfo(Integer userId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(userId)){
                return userMapper.getUserBasicInfo(userId);
            }
        } catch (Exception e) {
            throw new ServiceException("查询用户信息异常！");
        }
        return null;
    }
}
