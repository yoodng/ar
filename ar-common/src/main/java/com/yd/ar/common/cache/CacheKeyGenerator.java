
package com.yd.ar.common.cache;

import java.lang.reflect.Method;

import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.stereotype.Component;

import com.yd.ar.common.page.Page;


@Component("ckg")
public class CacheKeyGenerator implements KeyGenerator {

	@Override
	@SuppressWarnings("rawtypes")
	public Object generate(Object target, Method method, Object... params) {
		String className = target.getClass().getSimpleName();
		String methodName = method.getName();

		// 获取 params 参数串
		StringBuffer sb = new StringBuffer();
		if (params != null && params.length > 0) {
			for (Object obj : params) {
				sb.append(".");
				// 排除 Page 整体作为参数
				if (obj instanceof Page<?>) {
					Page page = (Page) obj;
					sb.append(page.getPageIndex());
					sb.append(page.getPageSize());
				} else if (obj instanceof String[]) {
					String[] strArray = (String[]) obj;
					for (String str : strArray) {
						sb.append(str);
					}
				} else {
					sb.append(obj);
				}
			}
		}
		String paramsStr = sb.toString();
		String key = className + "." + methodName + paramsStr;
		System.out.println("---------> cache-key : " + key);
		return key;
	}

}
