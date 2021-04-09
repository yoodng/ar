package com.yd.ar.common.po.attachment;

import com.yd.ar.common.base.BaseEntity;

public class AttachmentInfo extends BaseEntity {
    /**
	* @Fields serialVersionUID : TODO <br>
	*/ 
	private static final long serialVersionUID = 1L;

	private Integer attachmentId;

    private Integer infoId;

    public Integer getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(Integer attachmentId) {
        this.attachmentId = attachmentId;
    }

	public Integer getInfoId() {
		return infoId;
	}

	public void setInfoId(Integer infoId) {
		this.infoId = infoId;
	}
}