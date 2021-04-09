
package com.yd.ar.common.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yd.ar.common.constant.WebConstant;
import com.yd.ar.common.util.CommonUtil;
import com.yd.ar.common.util.privilege.PrivilegeUtil;


public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	@SuppressWarnings("rawtypes")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// 获取请求URL
		String uri = request.getRequestURI();
		String queryString = request.getQueryString();
		// 全限定名判断
		if (uri.indexOf("/ar") > -1) {
			uri = uri.substring(uri.indexOf("/", uri.indexOf("/ar") + 1), uri.indexOf(".action"));
			System.out.println(uri);
		}
		// 判断公开资源
		if (PrivilegeUtil.isPublic(uri) || (uri.contains("login"))) {
			// 公开资源， 放行
			return true;
		}

		// 获取 session, 取出登录信息
		HttpSession session = request.getSession();
		// 管理员登录
		Map user = (Map) session.getAttribute(WebConstant.SESSION_ADMIN);
		// 前台用户
		if (user == null) {
			user = (Map) session.getAttribute(WebConstant.SESSION_USER);
		}
		// 获取用户信息
		if (user != null && CommonUtil.isNotEmpty((String) user.get("account"))) {
			// 登录标识位校验
			String loginFlag = (String) session.getAttribute(WebConstant.SESSION_LOGIN_FLAG);
			if (loginFlag.equals(WebConstant.SESSION_LOGIN_FLAG)) {
				return true;
			}
		}

		// session中没有登录信息, 跳转登录界面
		request.getRequestDispatcher("/login.action?queryString=" + uri + ".action?" + queryString).forward(request, response);

		return false;
	}

}
