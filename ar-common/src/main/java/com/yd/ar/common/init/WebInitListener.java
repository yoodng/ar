/**  
* @Title: WebInitListener.java <br>
* @Package com.yd.ar.common.init <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月2日 下午8:50:26 <br>
* @version V1.0 <br>
*/
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
