/**  
* @Title: GetAllDictsCache.java <br>
* @Package com.yd.ar.common.cache.dict <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月1日 下午9:08:35 <br>
* @version V1.0 <br>
*/
package com.yd.ar.common.cache.manage.dict;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.cache.annotation.Cacheable;


@Cacheable(value = { "dictionaryCache" }, key = "#root.caches[0].name")
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface GetAllDictsCache {

}
