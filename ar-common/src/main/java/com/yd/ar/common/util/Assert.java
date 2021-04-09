
package com.yd.ar.common.util;

import java.util.Collection;
import java.util.Map;

import com.yd.ar.common.exception.AssertException;
import com.yd.ar.common.exception.ExceptionCode;


public class Assert {

	/**
     * 默认构造函数
     */
    private Assert() {
    }

    /**
     * 
     * Description: <br> 
     *  
     * @author yang.zhipeng <br>
     * @taskId <br>
     * @param obj <br>
     * @param message <br>
     * @param params <br>
     * @throws AssertException <br>
     */
    public static void notNull(Object obj, String message, Object... params) throws AssertException {
        if (obj == null) {
            throw new AssertException(ExceptionCode.IS_NULL_20006, message, params);
        }
    }

    /**
     * 
     * Description: <br> 
     *  
     * @author yang.zhipeng <br>
     * @taskId <br>
     * @param obj <br>
     * @param message <br>
     * @param params <br>
     * @throws AssertException <br>
     */
    public static void isNull(Object obj, String message, Object... params) throws AssertException {
        if (obj != null) {
            throw new AssertException(ExceptionCode.NOT_NULL_20005, message, params);
        }
    }

    /**
     * 
     * Description: <br> 
     *  
     * @author yang.zhipeng <br>
     * @taskId <br>
     * @param str <br>
     * @param message <br>
     * @param params <br>
     * @throws AssertException <br>
     */
    public static void notEmpty(String str, String message, Object... params) throws AssertException {
        if (CommonUtil.isEmpty(str)) {
            throw new AssertException(ExceptionCode.IS_NULL_20006, message, params);
        }
    }

    /**
     * 
     * Description: <br> 
     *  
     * @author yang.zhipeng <br>
     * @taskId <br>
     * @param str <br>
     * @param message <br>
     * @param params <br>
     * @throws AssertException <br>
     */
    public static void isEmpty(String str, String message, Object... params) throws AssertException {
        if (CommonUtil.isNotEmpty(str)) {
            throw new AssertException(ExceptionCode.NOT_NULL_20005, message, params);
        }
    }

    /**
     * 
     * Description: <br> 
     *  
     * @author yang.zhipeng <br>
     * @taskId <br>
     * @param <T> <br>
     * @param str <br>
     * @param message <br>
     * @param params <br>
     * @throws AssertException <br>
     */
    public static <T> void notEmpty(T[] str, String message, Object... params) throws AssertException {
        if (CommonUtil.isEmpty(str)) {
            throw new AssertException(ExceptionCode.IS_NULL_20006, message, params);
        }
    }

    /**
     * 
     * Description: <br> 
     *  
     * @author yang.zhipeng <br>
     * @taskId <br>
     * @param <T> <br>
     * @param str <br>
     * @param message <br>
     * @param params <br>
     * @throws AssertException <br>
     */
    public static <T> void isEmpty(T[] str, String message, Object... params) throws AssertException {
        if (CommonUtil.isNotEmpty(str)) {
            throw new AssertException(ExceptionCode.NOT_NULL_20005, message, params);
        }
    }

    /**
     * 
     * Description: <br> 
     *  
     * @author yang.zhipeng <br>
     * @taskId <br>
     * @param str <br>
     * @param message <br>
     * @param params <br>
     * @throws AssertException <br>
     */
    public static void notEmpty(Collection<?> str, String message, Object... params) throws AssertException {
        if (CommonUtil.isEmpty(str)) {
            throw new AssertException(ExceptionCode.IS_NULL_20006, message, params);
        }
    }

    /**
     * 
     * Description: <br> 
     *  
     * @author yang.zhipeng <br>
     * @taskId <br>
     * @param str <br>
     * @param message <br>
     * @param params <br>
     * @throws AssertException <br>
     */
    public static void isEmpty(Collection<?> str, String message, Object... params) throws AssertException {
        if (CommonUtil.isNotEmpty(str)) {
            throw new AssertException(ExceptionCode.NOT_NULL_20005, message, params);
        }
    }

    /**
     * 
     * Description: <br> 
     *  
     * @author yang.zhipeng <br>
     * @taskId <br>
     * @param str <br>
     * @param message <br>
     * @param params <br>
     * @throws AssertException <br>
     */
    public static void notEmpty(Map<?, ?> str, String message, Object... params) throws AssertException {
        if (CommonUtil.isEmpty(str)) {
            throw new AssertException(ExceptionCode.IS_NULL_20006, message, params);
        }
    }

    /**
     * 
     * Description: <br> 
     *  
     * @author yang.zhipeng <br>
     * @taskId <br>
     * @param str <br>
     * @param message <br>
     * @param params <br>
     * @throws AssertException <br>
     */
    public static void isEmpty(Map<?, ?> str, String message, Object... params) throws AssertException {
        if (CommonUtil.isNotEmpty(str)) {
            throw new AssertException(ExceptionCode.NOT_NULL_20005, message, params);
        }
    }
}
