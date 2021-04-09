package com.yd.ar.manage.service.origin;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.page.Page;
import com.yd.ar.common.po.origin.Origin;

import java.util.List;
import java.util.Map;


public interface OriginService {

    /**
     * TODO 条件查询组织
     * @param page
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> queryOrigin(Page<Map<String, Object>> page) throws ServiceException;

    /**
     * TODO 新建组织
     * @param origin
     * @return
     * @throws ServiceException
     */
    Integer saveOrigin(Origin origin) throws ServiceException;

    /**
     * TODO 更新组织信息
     * @param origin
     * @return
     * @throws ServiceException
     */
    Integer updateOrigin(Origin origin) throws ServiceException;

    /**
     * TODO 通过 originId 获取origin信息
     * @param originId
     * @return
     * @throws ServiceException
     */
    Map<String, Object> getOriginById(Integer originId) throws ServiceException;

    /**
     * TODO 获取组织成员列表
     * @param originId
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> getOriginMembers(Page<Map<String, Object>> page, Integer originId) throws ServiceException;
}
