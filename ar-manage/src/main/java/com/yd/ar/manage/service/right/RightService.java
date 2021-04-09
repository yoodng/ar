/**  
* @Title: RightService.java <br>
* @Package com.yd.ar.manage.service.right <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月2日 下午10:50:00 <br>
* @version V1.0 <br>
*/ 
package com.yd.ar.manage.service.right;

import java.util.List;
import java.util.Map;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.page.Page;
import com.yd.ar.common.po.role.Right;


public interface RightService {

	List<Map<String, Object>> queryRights(Page<Right> page, String queryInput) throws ServiceException;
	
	Right selectById(Integer rightId) throws ServiceException ;
	
	int saveRight(Right right) throws ServiceException;
	
	Right selectByRightUrl(String rightUrl) throws ServiceException;
	
	int updateRight(Right right) throws ServiceException;

	List<Right> getIsNotPublicRights() throws ServiceException;
}
