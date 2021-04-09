
package com.yd.ar.common.constant;


public interface PathConstant {

	String contextAbsolutePath = "D:/cache";

	/**
	 * 项目的相对路径
	 */
	String contextRelativePath = "/ar";

	/**
	 * 上传的图片的相对路径
	 */
	String pictureRelativePath = contextRelativePath + "/pic/upload";

	/**
	 * 图片上传文件夹
	 */
	String pictureUploadAbsolutePath = contextAbsolutePath + pictureRelativePath;

	/**
	 * 相册默认封面图片路径
	 */
	String albumCoverDefaultRelPath = "assets/images/example/ablum-cover/media-audio.png";

}
