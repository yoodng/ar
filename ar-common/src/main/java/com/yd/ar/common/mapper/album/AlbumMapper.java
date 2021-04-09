package com.yd.ar.common.mapper.album;

import com.yd.ar.common.base.BaseMapper;
import com.yd.ar.common.page.Page;
import com.yd.ar.common.po.album.Album;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AlbumMapper extends BaseMapper{

    /**
     * TODO 加载相册列表
     * @param page
     * @param originId
     * @return
     * @throws Exception
     */
    List<Album> getAlbums(Page<Album> page, @Param("originId") Integer originId) throws Exception;
    
}