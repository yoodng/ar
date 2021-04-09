
package com.yd.ar.common.cache.manage.dict;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Caching;

@Caching(evict = { @CacheEvict(value = "dictionaryCache", key = "#dictionary.dictValue", beforeInvocation = true),
		@CacheEvict(value = { "dictionaryCache" }, key = "#root.caches[0].name", beforeInvocation = true) })
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface UpdateDictCache {

}
