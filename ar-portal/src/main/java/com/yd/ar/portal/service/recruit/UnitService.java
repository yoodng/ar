/**  
 * @Title: UnitService.java
 * @Package com.yd.ar.portal.service.recruit
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月3日 下午4:48:59
 * @version V1.0  
 */
package com.yd.ar.portal.service.recruit;

import java.util.List;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.po.recruit.RecruitUnit;


public interface UnitService {
	
	Integer createUnit(RecruitUnit recruitUnit) throws ServiceException;

	List<RecruitUnit> getUnitsByUserId(Integer userId) throws ServiceException;

	RecruitUnit getUnitByUserId(Integer userId) throws ServiceException;

	Integer updateUnit(RecruitUnit recruitUnit) throws ServiceException;
}
