/**  
 * @Title: FlatService.java
 * @Package com.yd.ar.manage.service.job
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月10日 下午3:35:18
 * @version V1.0  
 */
package com.yd.ar.manage.service.job;

import java.util.List;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.po.recruit.RecruitUnit;


public interface FlatService {

	/**
	 * @Title: createUnit
	 * @Description: TODO createUnit
	 * @param @param recruitUnit
	 */
	public Integer createUnit(RecruitUnit recruitUnit) throws ServiceException;

	/**
	 * @Title: getUnitsByUserId
	 * @Description: TODO 查询当前用户的招聘信息单位
	 * @param @param userId
	 */
	public List<RecruitUnit> getUnitsByUserId(Integer userId) throws ServiceException;
}
