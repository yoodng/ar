
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="col-md-3 about-list" style="padding-left: 40px;padding-top: 20px;font-size: 15px">
    <h4>校园服务</h4>
    <ul>
        <hr>
        <li><a href="http://www.xzit.edu.cn/" target="_blank">学校官网</a></li><hr>
        <c:forEach items="${services}" var="service">
            <li><a href="${pageContext.request.contextPath}/service/school.action?id=${service.infoId}">${service.infoTitle}</a></li><hr>
        </c:forEach>
        <li><a href="http://www.snut.edu.cn/" target="_blank">学报编辑部</a></li><hr>
        <li><a href="http://www.snut.edu.cn/" target="_blank">图书馆</a></li><hr>
        <li><a href="http://www.snut.edu.cn/" target="_blank">档案馆</a></li><hr>
        <li><a href="http://www.snut.edu.cn/" target="_blank">信息公开网</a></li>
    </ul>
    <br>
    <h4>招生就业</h4>
    <ul>
        <hr>
        <li><a href="http://www.snut.edu.cn/" target="_blank" target="_blank">本科招生</a></li><hr>
        <li><a href="http://www.snut.edu.cn/" target="_blank">成教招生</a></li><hr>
        <li><a href="http://www.snut.edu.cn/" target="_blank">就业网</a></li><hr>
        <li><a href="http://www.snut.edu.cn/" target="_blank">人才招聘</a></li><hr>
        <li><a href="recruit.action" >本站招聘</a></li>
    </ul>
</div>




