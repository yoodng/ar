<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/ar-taglib" prefix="ar"%>
<!DOCTYPE html>
<html>
<head>
<title>校园服务-理工校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>
	<!-- 页头 -->
	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>

	<!-- 导航栏 -->
	<%@ include file="/WEB-INF/views/portal-common/navmenu.jsp"%>

	<!-- contact -->
	<div class="container higher">
		<div class="col-md-9 project1">
			<!-- 导航栏 -->
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index.action">主页</a></li>
				<li class="active">校园服务</li>
			</ol>

			<img src="assets/images/school/snut-front.jpg" class="img-responsive center-block"/>
			<p style="font-size: 16px">
				陕西理工大学（Shaanxi University of Technology），简称“陕理工”，始建于1958年，坐落于中国历史文化名城汉中，是一所涵盖文学、经济学、法学、教育学、历史学、理学、工学和管理学的多科性省属普通高等学校，也是全国首批具有学士学位授予权的高校之一，硕士学位授予单位。
				截至2018年4月，学校设南、北、东（筹）三个校区，校园总面积136.13万平方米；设有17个学院和2个教学实验实训中心，65个本科专业；有7个一级学科硕士授权点，5个硕士专业学位授权点；2个国家级特色专业、6个省级特色专业；有专任教师1180多人，双聘院士3人；全日制在校生近2万人。
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</p>
		</div>
		<%@include file="/WEB-INF/views/service/service-list.jsp"%>
		<div class="clearfix"></div>
	</div>
	<!-- //contact -->

	<!-- 页脚 -->
	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>
</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="${pageContext.request.contextPath}/assets/script/message/contact-us.js"></script>
</html>