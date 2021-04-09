
package com.yd.ar.common.init;

public class RightInitialization implements Initialization {
	
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("---------权限资源初始化---------");
	}

	@Override
	public void destroy() throws Exception {
		
	}

}
