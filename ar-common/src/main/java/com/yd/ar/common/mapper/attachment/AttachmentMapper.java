package com.yd.ar.common.mapper.attachment;

import com.yd.ar.common.po.attachment.Attachment;

public interface AttachmentMapper {
    int deleteByPrimaryKey(Integer attaId);

    int insert(Attachment record);

    int insertSelective(Attachment record);

    Attachment selectByPrimaryKey(Integer attaId);

    int updateByPrimaryKeySelective(Attachment record);

    int updateByPrimaryKey(Attachment record);
}