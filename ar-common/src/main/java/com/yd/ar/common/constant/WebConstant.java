
package com.yd.ar.common.constant;

public interface WebConstant {

	/** 菜单 */
	String MENU_VARIABLE = "MENU_VARIABLE";

	/** 树形菜单 */
	String MENU_VARIABLE_TREE = "menuList";

	/** session保存的admin信息 */
	String SESSION_ADMIN = "SESSION_ADMIN";
	
	/** session保存的user信息 */
	String SESSION_USER = "SESSION_USER";
	
	/** session保存的登录标志 */
	String SESSION_LOGIN_FLAG = "SESSION_LOGIN_FLAG";

	/** session保存的验证码信息 */
	String SESSION_VERIFY_CODE = "SESSION_VERIFY_CODE";

	/** session中保存的权限 */
	String SESSION_RIGHTS = "SESSION_RIGHTS";

	/** url */
	String APPLICATION_URL = "APPLICATION_URL";

	/** menu */
	String APPLICATION_MENU = "APPLICATION_MENU";

	/** CONTEXT_PATH */
	String CONTEXT_PATH = "CONTEXT_PATH";

	/** 错误页面 不跳转 */
	String PAGE_NOT_REDIRECT = "PAGE_NOT_REDIRECT";
	
	/** 默认错误页面 */
	String DEFAULT_ERROR_VIEW = "error/error";
	
	/** 404错误页面 */
	String PAGE_ERROR_404 = "error/page404";
	
	/** 500错误页面 */
	String PAGE_ERROR_500 = "error/page500";
	
	/** 表单校验标识位数 */
	Integer FORM_VALID_NUMBER = 8;
	
	/** 表单校验标识名 */
	String FORM_VALID_NAME = "validFlag";
}
