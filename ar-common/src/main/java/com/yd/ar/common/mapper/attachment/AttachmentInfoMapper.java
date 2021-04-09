package com.yd.ar.common.mapper.attachment;

import com.yd.ar.common.po.attachment.AttachmentInfo;

public interface AttachmentInfoMapper {
    int insert(AttachmentInfo record);

    int insertSelective(AttachmentInfo record);
}