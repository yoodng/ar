/**  
 * @Title: RecruitService.java
 * @Package com.yd.ar.portal.service.recruit
 * @Description: TODO
 * @author QinChong
 * @date 2016年1月24日 下午1:34:02
 * @version V1.0  
 */
package com.yd.ar.portal.service.recruit;

import java.util.List;
import java.util.Map;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.page.Page;
import com.yd.ar.common.po.recruit.Recruit;


public interface RecruitService {

	/**
	 * @param recruit
	 * @return
	 * @throws ServiceException
	 */
	int createRecruit(Recruit recruit) throws ServiceException;

	/**
	 * TODO 条件查询招聘信息
	 * @param page
	 * @param queryStr
	 * @return
	 * @throws ServiceException
	 */
	List<Map<String, Object>> queryRecruit(Page<Map<String, Object>> page, String queryStr) throws ServiceException ;

	/**
	 * TODO 查询招聘详情
	 * @param id
	 * @return
	 * @throws ServiceException
	 */
	Map<String, Object> getDetailRecruit(Integer id) throws ServiceException ;

	/**
	 * TODO 加载其他投递简历的用户
	 * @param unitId
	 * @param recruitId
	 * @return
	 * @throws ServiceException
	 */
	List<Map<String, Object>> loadOtherRecruits(Integer unitId,Integer recruitId) throws ServiceException;

	/**
	 * TODO 
	 * @param page
	 * @param userId
	 * @return
	 * @throws ServiceException
	 */
	List<Map<String, Object>> getRecruitByUserId(Page<Map<String, Object>> page, Integer userId) throws ServiceException ;

    /**
     * TODO 删除招聘信息
     * @param recruitId
     * @return
     * @throws ServiceException
     */
	Integer deleteRecruit(Integer recruitId) throws ServiceException;
}
