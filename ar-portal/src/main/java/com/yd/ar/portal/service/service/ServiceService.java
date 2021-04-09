package com.yd.ar.portal.service.service;

import com.yd.ar.common.exception.ServiceException;

import java.util.List;
import java.util.Map;

public interface ServiceService {

    /**
     * TODO 获取校园服务信息列表
     * @return
     */
    public List<Map<String, Object>> getSchoolService(String infoType, Integer schoolId) throws ServiceException;
}
