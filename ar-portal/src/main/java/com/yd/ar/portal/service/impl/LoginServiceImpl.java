/**  
* @Title: LoginServiceImpl.java <br>
* @Package com.yd.ar.manage.service.impl <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月2日 下午2:47:21 <br>
* @version V1.0 <br>
*/
package com.yd.ar.portal.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import com.yd.ar.common.mapper.image.ImageMapper;
import com.yd.ar.common.po.image.Image;
import org.springframework.stereotype.Service;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.mapper.user.UserMapper;
import com.yd.ar.common.util.CommonUtil;

@Service("loginService")
public class LoginServiceImpl implements com.yd.ar.portal.service.LoginService {
	@Resource
	private UserMapper userMapper;

	@Resource
	private ImageMapper imageMapper;

	@Override
	public Map<String, Object> validateUser(String account, String password) throws ServiceException {
		Map<String, Object> user = null;
		try {
			// 关键参数校验
			if (CommonUtil.isNotEmpty(account) && CommonUtil.isNotEmpty(password)) {
				// 查找用户
				user = userMapper.selectByAccount(account);
				if (user != null) {
					// 校验密码
					if (password.equals(user.get("password"))) {
						// 加载用户关联信息
						Integer imageId = (Integer) (user.get("imageId"));
						if(CommonUtil.isNotEmpty(imageId)) {
							Image image = imageMapper.getById(imageId);
							if(image != null){
								user.put("portrait", image.getImagePath());
							}
						}
					} else {
						user.put("userId", null);
						user.put("password", null);
					}
				}
			}
		} catch (Exception e) {
			throw new ServiceException("系统异常，登录失败");
		}
		return user;
	}

}
