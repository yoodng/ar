
package com.yd.ar.common.init;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import com.yd.ar.common.util.origin.OriginUtil;
import com.yd.ar.common.util.info.InfoUtil;
import org.springframework.web.servlet.DispatcherServlet;

import com.yd.ar.common.init.context.ARContext;
import com.yd.ar.common.mapper.dict.DictionaryDataMapper;
import com.yd.ar.common.util.dictionary.DictionaryUtil;
import com.yd.ar.common.util.privilege.PrivilegeUtil;
import com.yd.ar.common.util.recruit.RecruitUtil;


public class StartupServlet extends DispatcherServlet {
	/**
	 * serialVersionUID <br>
	 */
	private static final long serialVersionUID = 6364903462514241142L;

	/**
	 * web 环境变量 初始化
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		// 加载环境变量
		ARContext.context = config.getServletContext();
		super.init(config);
		ARContext.applicationContext = super.getWebApplicationContext();

		try {

			System.out.println("-------------------- 加载系统数据 --------------------");
			
			/**
			 * 获取数据字典bean
			 */
			ARContext.dataMapper = ARContext.applicationContext.getBean(DictionaryDataMapper.class);
			
			/**
			 * 加载权限
			 */
			PrivilegeUtil.loadAllRights();

			/**
			 * 加载数据字典
			 */
			DictionaryUtil.loadDictionary();

			/**
			 * 职业招聘初始化
			 */
			RecruitUtil.initRecruit();
			
			/**
			 * 班级录初始化
			 */
			OriginUtil.initClass();

			/**
			 * 论坛初始化
			 */
			InfoUtil.initForum();

			System.out.println("-------------------- 理工校友录 启动成功  --------------------");
		} catch (Exception e) {
			System.out.println("-------------------- 理工校友录 启动失败  --------------------");
			e.printStackTrace();
		}
	}
}
