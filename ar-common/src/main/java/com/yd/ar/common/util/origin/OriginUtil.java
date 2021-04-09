/**
 * @Title: OriginUtil.java
 * @Package com.yd.ar.common.util.origin
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月18日 下午8:59:36
 * @version V1.0
 */
package com.yd.ar.common.util.origin;

import com.yd.ar.common.exception.UtilException;
import com.yd.ar.common.init.context.ARContext;
import com.yd.ar.common.mapper.dict.DictionaryDataMapper;
import com.yd.ar.common.mapper.origin.GradeMapper;


public class OriginUtil {

    /**
     * @throws UtilException
     * @Title: initClass
     * @Description: TODO 班级录初始化
     */
    public static void initClass() throws UtilException {
        System.out.println(">>>>>>>>>>>>>>>>>>>> 组织初始化 <<<<<<<<<<<<<<<<<<<<<");
        loadGradeList();
        loadOriginType();
    }

    /**
     * @throws Exception
     * @Title: loadGrade
     * @Description: TODO 加载年级列表
     */
    public static void loadGradeList() throws UtilException {
        try {
            System.out.println("-------------------- 加载年级列表 --------------------");
            ARContext.originGrade = ARContext.applicationContext.getBean(GradeMapper.class).loadGradeList();
        } catch (Exception e) {
            throw new UtilException("加载年级列表异常");
        }
    }

    /**
     * @Title: refreshGradeList
     * @Description: TODO 刷新年级列表
     */
    public static void refreshGradeList() throws UtilException {
        try {
            ARContext.originGrade = ARContext.applicationContext.getBean(GradeMapper.class).loadGradeList();
        } catch (Exception e) {
            throw new UtilException("刷新年级列表异常");
        }
    }

    /**
     * @Description: TODO 加载组织类型
     * @throws UtilException
     */
    public static void loadOriginType() throws UtilException {
        try {
            System.out.println("-------------------- 加载组织类型列表 --------------------");
            ARContext.originType = ARContext.applicationContext.getBean(DictionaryDataMapper.class).loadDictData("ot");
        } catch (Exception e) {
            throw new UtilException("加载组织类型时发生异常！");
        }
    }

}
