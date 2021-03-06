package com.yd.ar.manage.service.info.impl;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.mapper.info.InformationMapper;
import com.yd.ar.common.page.Page;
import com.yd.ar.common.po.info.Information;
import com.yd.ar.common.util.CommonUtil;
import com.yd.ar.manage.service.info.InfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service("infoService")
public class InfoServiceImpl implements InfoService {

    @Resource
    private InformationMapper informationMapper;

    /**
     * TODO 根据条件查询信息
     *
     * @param page
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> queryInfo(Page<Map<String, Object>> page) throws ServiceException {
        try {
            return informationMapper.queryInfoByVo(page);
        } catch (Exception e) {
            throw new ServiceException("查询信息时发生异常！");
        }
    }

    /**
     * TODO 保存发布的信息到数据库
     *
     * @param information
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer saveInfo(Information information) throws ServiceException {
        try {
            // 关键参数校验
            if (information != null && CommonUtil.isNotEmpty(information.getUserId())) {
                return informationMapper.save(information);
            }
        } catch (Exception e) {
            throw new ServiceException("保存信息时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 更新信息的属性
     *
     * @param information
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer updateInfo(Information information) throws ServiceException {
        try {
            // 参数校验
            if (information != null && CommonUtil.isNotEmpty(information.getInfoId())) {
                informationMapper.update(information);
            }
        } catch (Exception e) {
            throw new ServiceException("更新信息时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 删除信息
     *
     * @param infoId
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer deleteInfo(Integer infoId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(infoId)) {
                return informationMapper.delete(infoId);
            }
        } catch (Exception e) {
            throw new ServiceException("删除信息时发生异常！");
        }
        return 0;
    }
}
