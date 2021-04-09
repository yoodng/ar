package com.yd.ar.common.mapper.recruit;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.yd.ar.common.base.BaseMapper;
import com.yd.ar.common.po.recruit.RecruitUnit;

public interface RecruitUnitMapper extends BaseMapper {

	List<RecruitUnit> getUnitsByUserId(@Param("userId") Integer userId) throws Exception;
}