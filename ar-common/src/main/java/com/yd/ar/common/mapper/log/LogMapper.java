package com.yd.ar.common.mapper.log;

import com.yd.ar.common.po.log.Log;

public interface LogMapper {
    int deleteByPrimaryKey(Integer logId);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer logId);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);
}