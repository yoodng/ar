package com.yd.ar.portal.service.image;

import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.po.image.Image;


public interface ImageService {

    /**
     * TODO 查询图片信息
     * @param imageId
     * @return
     * @throws ServiceException
     */
    Image getImageById(Integer imageId) throws ServiceException;

    /**
     * TODO 存储图片信息到数据库
     * @param image
     * @return
     * @throws ServiceException
     */
    Integer saveImage(Image image) throws ServiceException;

    /**
     * TODO 根据id删除图片信息
     * @param imageId
     * @return
     * @throws ServiceException
     */
    Integer deleteImageById(Integer imageId) throws ServiceException;

    /**
     * TODO 上传图片到相册
     * @param image 图片列表
     * @param albumId albumId
     * @return 上传图片的个数
     * @throws ServiceException
     */
    Integer saveAlbumImage(Image image, Integer albumId) throws ServiceException;
}
