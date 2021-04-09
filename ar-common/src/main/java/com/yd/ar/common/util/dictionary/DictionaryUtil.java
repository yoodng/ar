/**  
 * @Title: DictionaryUtil.java
 * @Package com.yd.ar.common.util.dictionary
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月9日 上午2:35:31
 * @version V1.0  
 */
package com.yd.ar.common.util.dictionary;

import com.yd.ar.common.exception.UtilException;
import com.yd.ar.common.init.context.ARContext;
import com.yd.ar.common.mapper.dict.DictionaryDataMapper;


public class DictionaryUtil {

	public static void loadDictionary() throws UtilException {
		System.out.println("-------------------- 加载数据字典 --------------------");
		try {
			DictionaryDataMapper dictionaryDataMapper = ARContext.applicationContext
					.getBean(DictionaryDataMapper.class);
			// 所有字典数据
			ARContext.dictionary = dictionaryDataMapper.findAll();
			// dictionary 放入Context
			ARContext.context.setAttribute("dictionary", ARContext.dictionary);
		} catch (Exception e) {
			throw new UtilException("加载数据字典失败!");
		}
	}
}
