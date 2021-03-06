<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${classroom.classGrade}级${classroom.className}班级成员-理工校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>

	<div class="container higher" id="container">
		<%@ include
			file="/WEB-INF/views/class/classroom/classroom-pageheader.jsp"%>
		<div class="mb5"></div>
		<!-- nav tab -->
		<%@ include file="/WEB-INF/views/class/classroom/classroom-nav.jsp"%>

		<!-- Tab panes -->
		<div class="tab-content" style="background-color: #ddd;">
			<div class="tab-pane active" id="classroom-content">
				<div class="people-list">
					<c:forEach items="${page.beanList}" var="member">
						<div class="col-md-2">
							<div class="people-item" style="text-align: center; min-height: 170px; max-height: 170px">
								<a href="${pageContext.request.contextPath}/ta/show.action?userId=${member.userId}">
									<div style="min-height: 125px;">
										<img src="${pageContext.request.contextPath}/${member.imgPath}" class="img-responsive center-block"
											 style="max-height: 125px;">
									</div>
										${member.trueName}
								</a>
							</div>
						</div>
						<!-- col-md-6 -->
					</c:forEach>
				</div>
				<input type="hidden" value="${classroom.classId}" id="classId">
			</div>
			<%@ include file="/WEB-INF/views/portal-common/pagination.jsp"%>
		</div>
		<!-- Tab panes -->

	</div>
	<!-- container -->

	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="${pageContext.request.contextPath}/assets/script/class/classroom/classroom-member.js"></script>
</html>