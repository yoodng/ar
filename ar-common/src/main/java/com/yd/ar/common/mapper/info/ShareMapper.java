package com.yd.ar.common.mapper.info;

import com.yd.ar.common.po.info.Share;

public interface ShareMapper {
    int insert(Share record);

    int insertSelective(Share record);
}