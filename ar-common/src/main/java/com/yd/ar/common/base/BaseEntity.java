/**  
* @Title: BaseEntity.java <br>
* @Package com.yd.ar.common.base <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月21日 下午1:49:34 <br>
* @version V1.0 <br>
*/ 
package com.yd.ar.common.base;

import java.io.Serializable;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;

public abstract class BaseEntity implements Serializable {

	/**
	* @Fields serialVersionUID : TODO <br>
	*/ 
	private static final long serialVersionUID = -3412131575274665203L;

	@Override
    public String toString() {
        return JSONObject.toJSONStringWithDateFormat(this, "yyyy-MM-dd HH:mm:ss", new SerializerFeature[0]);
    }
}
