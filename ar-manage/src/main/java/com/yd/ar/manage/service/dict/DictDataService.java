/**  
 * @Title: DictDataService.java
 * @Package com.yd.ar.manage.service.dict
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月8日 上午12:38:04
 * @version V1.0  
 */
package com.yd.ar.manage.service.dict;

import java.util.List;
import java.util.Map;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.page.Page;
import com.yd.ar.common.po.dict.DictionaryData;


public interface DictDataService {

	public List<Map<String, Object>> queryDictData(Page<DictionaryData> page, String queryInput)
			throws ServiceException;
	
	public int saveDictData(DictionaryData dictionaryData) throws ServiceException;
}
