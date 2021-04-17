<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<ul class="am-list admin-sidebar-list">
    <!-- 首页 bar -->
    <li id="bar-home"><a href="${pageContext.request.contextPath}/manage.action"><span class="am-icon-home"></span> 首页</a></li>

    <!-- 新闻中心 -->
    <li class="admin-parent" id="bar-info">
        <a class="am-cf" href="${pageContext.request.contextPath}/info.action">
            <span class="am-icon-newspaper-o"></span> 信息中心
        </a>
    </li>

    <!-- 班级管理 -->
    <li class="admin-parent" id="bar-origin">
        <a class="am-cf" href="javascript:void(0)" data-am-collapse="{target: '#origin-manage'}">
            <i class="am-icon-graduation-cap"></i> 班级 / 校友组织
            <i class="am-icon-angle-right am-fr am-margin-right"></i>
        </a>
        <ul class="am-list am-collapse admin-sidebar-sub" id="origin-manage">
            <li><a href="${pageContext.request.contextPath}/origin.action"><i class="am-icon-institution"></i> 组织管理</a></li>
            <li><a href="${pageContext.request.contextPath}/origin/add.action"><i class="am-icon-plus-square"></i> &nbsp;创建组织</a></li>
        </ul>
    </li>


    <!-- 用户管理 -->
    <li class="admin-parent" id="bar-user">
        <a class="am-cf" href="javascript:void(0)" data-am-collapse="{target: '#user-manage'}">
            <i class="am-icon-group"></i> 用户管理 <i class="am-icon-angle-right am-fr am-margin-right"></i></a>
        <ul class="am-list am-collapse admin-sidebar-sub" id="user-manage">
            <li><a href="${pageContext.request.contextPath}/user.action"><i class="am-icon-user"></i> 用户列表 </a></li>
            <li><a href="${pageContext.request.contextPath}/user/add.action"><i class="am-icon-plus-square"></i> 添加用户</a></li>
        </ul>
    </li>


    <!-- ... -->
    <li><a href="${pageContext.request.contextPath}/login/logout.action"><span class="am-icon-sign-out"></span> 注销</a></li>
</ul>

<!-- 公告 bookmark -->
<div class="am-panel am-panel-default admin-sidebar-panel">
    <div class="am-panel-bd">
        <p>
            <span class="am-icon-bookmark"></span> 公告
        </p>
        <p>大西北，小江南，汉江之畔我美丽校园。—— 理工校友录</p>
    </div>
</div>


<!-- 社群 wiki -->
<div class="am-panel am-panel-default admin-sidebar-panel">
    <div class="am-panel-bd">
        <p>
            <span class="am-icon-tag"></span>
        </p>
        <p>理工校友录后台管理</p>
    </div>
</div>