
package com.yd.ar.common.cache.interceptor;

import org.aspectj.lang.ProceedingJoinPoint;

public class DataCache {
	private DataCacheHandler dataCacheHandler;

	public void cacheData(ProceedingJoinPoint pjp) throws Throwable {

		System.out.println("执行拦截器的processCache()方法----------开始");
		dataCacheHandler.putResultToCache(pjp);
		System.out.println("执行拦截器的processCache()方法----------结束");

	}
}
