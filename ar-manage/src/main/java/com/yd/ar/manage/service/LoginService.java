/**  
* @Title: LoginService.java <br>
* @Package com.yd.ar.manage.service <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月2日 下午2:45:14 <br>
* @version V1.0 <br>
*/ 
package com.yd.ar.manage.service;

import java.util.Map;

import com.yd.ar.common.exception.ServiceException;

public interface LoginService {
	
	public Map<String, Object> validateUser(String account, String password) throws ServiceException;
}
