
package com.yd.ar.common.init;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class WebInitListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		System.out.println("----------------------------项目启动配置---------------------------");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

}
