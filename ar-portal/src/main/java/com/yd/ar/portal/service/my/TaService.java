package com.yd.ar.portal.service.my;

import com.yd.ar.common.exception.ServiceException;

import java.util.Map;

public interface TaService {

    /**
     * TODO 获取用户的基本信息：userId, account, potrait, trueName, introduce
     * @param userId
     * @return
     * @throws ServiceException
     */
    Map<String, Object> getUserBasicInfo(Integer userId) throws ServiceException;
}
