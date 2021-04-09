/**  
 * @Title: QueryRecruits.java
 * @Package com.yd.ar.common.cache.portal.recruit
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月26日 下午11:30:34
 * @version V1.0  
 */
package com.yd.ar.common.cache.portal.recruit;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.cache.annotation.Cacheable;

@Cacheable(value="recruitCache")
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface QueryRecruits {

}
