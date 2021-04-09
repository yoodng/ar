package com.yd.ar.portal.service.service.impl;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.mapper.info.InformationMapper;
import com.yd.ar.common.util.CommonUtil;
import com.yd.ar.portal.service.service.ServiceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service("serviceService")
public class ServiceServiceImpl implements ServiceService {

    @Resource
    private InformationMapper informationMapper;

    /**
     * TODO 获取校园服务信息列表
     * @return
     */
    @Override
    public List<Map<String, Object>> getSchoolService(String infoType, Integer schoolId) throws ServiceException {
        List<Map<String, Object>> services = null;
        try {
            if(CommonUtil.isNotEmpty(schoolId)){
                services = informationMapper.loadOriginInfos(infoType, schoolId, 10);
            }
        } catch (Exception e) {
            throw new ServiceException("查询校园服务信息时发生异常！");
        }
        return services;
    }
}
