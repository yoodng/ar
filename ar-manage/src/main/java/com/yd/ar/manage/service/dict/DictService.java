/**  
* @Title: DictService.java <br>
* @Package com.yd.ar.manage.service <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月25日 下午9:20:11 <br>
* @version V1.0 <br>
*/
package com.yd.ar.manage.service.dict;

import java.util.List;
import java.util.Map;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.page.Page;
import com.yd.ar.common.po.dict.Dictionary;


public interface DictService {

	public int saveDict(Dictionary dictionary) throws ServiceException;

	public int deleteDict(String dictValue) throws ServiceException;

	public Dictionary getByDictValue(String dictValue) throws ServiceException;

	public int updateDict(Dictionary dictionary) throws ServiceException;

	public List<Map<String, Object>> queryDicts(Page<Dictionary> page, String queryInput) throws ServiceException;

	public List<Dictionary> getAllDicts() throws ServiceException;
}
