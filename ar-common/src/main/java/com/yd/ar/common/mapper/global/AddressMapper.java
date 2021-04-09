package com.yd.ar.common.mapper.global;

import com.yd.ar.common.base.BaseMapper;
import com.yd.ar.common.exception.MapperException;
import com.yd.ar.common.po.global.Address;

public interface AddressMapper extends BaseMapper{
	
    int deleteByPrimaryKey(Integer addrId) throws MapperException;

    int insert(Address record) throws MapperException;

    int insertSelective(Address record) throws MapperException;

    Address selectByPrimaryKey(Integer addrId) throws MapperException;

    int updateByPrimaryKeySelective(Address record) throws MapperException;

    int updateByPrimaryKey(Address record) throws MapperException;
}