<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2016/4/17
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!doctype html>
<html class="no-js fixed-layout">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>TJUSTV OAUTH2.0</title>
  <meta name="description" content="学视Oauth2.0 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/i/top-logo.png">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/i/top-logo.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/admin.css">

  <%-- dataTable --%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/datatables/media/css/dataTables.bootstrap.min.css">

  <!--引入CSS-->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/webupload/css/webuploader.css">



</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>TJUSTV</strong> <small>Oauth2.0 后台管理</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
          <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
          <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
      <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="${pageContext.request.contextPath}/admin/index"><span class="am-icon-home"></span> 首页</a></li>

        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav-client'}"><span class="am-primary am-icon-btn am-icon-desktop"></span> 客户端管理 <span  class="am-icon-angle-right  am-fr am-margin-right" style="height: 48px; padding-top: 12px; padding-bottom: 12px;"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav-client">
            <li><a href="${pageContext.request.contextPath}/clients" class="am-cf"><span class="am-icon-table"></span> 客户端列表</a></li>
            <li><a href="${pageContext.request.contextPath}/clients/create"><span class="am-icon-plus-circle"></span> 新建客户端</a></li>
          </ul>
        </li>

        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav-user'}"><span class="am-success am-icon-btn am-icon-user "></span> 用户管理 <span class="am-icon-angle-right  am-fr am-margin-right" style="height: 48px; padding-top: 12px; padding-bottom: 12px;"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav-user">
            <li><a href="${pageContext.request.contextPath}/localUsers" class="am-cf"><span class="am-icon-table"></span> 用户列表</a></li>
            <li><a href="${pageContext.request.contextPath}/localUsers/create"><span class="am-icon-user-plus"></span> 添加用户</a></li>
          </ul>
        </li>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav-video'}"><span class="am-btn-default am-icon-btn am-icon-youtube-play "></span> 视频管理 <span class="am-icon-angle-right  am-fr am-margin-right" style="height: 48px; padding-top: 12px; padding-bottom: 12px;"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav-video">
            <li><a href="${pageContext.request.contextPath}/videos/videos.html" class="am-cf"><span class="am-icon-video-camera"></span> 视频列表</a></li>
            <li><a href="${pageContext.request.contextPath}/videos/upload.html"><span class="am-icon-upload"></span> 上传视频</a></li>
          </ul>
        </li>

        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav-video-category'}"><span class="am-btn-default am-icon-btn am-icon-youtube-play "></span> 视频类别 <span class="am-icon-angle-right  am-fr am-margin-right" style="height: 48px; padding-top: 12px; padding-bottom: 12px;"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav-video-category">
            <li><a href="${pageContext.request.contextPath}/videos/videos.html?type=0" class="am-cf"><span class="am-icon-video-camera"></span> 热门</a></li>
            <li><a href="${pageContext.request.contextPath}/videos/videos.html?type=1" class="am-cf"><span class="am-icon-video-camera"></span> 精选</a></li>
            <li><a href="${pageContext.request.contextPath}/videos/videos.html?type=2" class="am-cf"><span class="am-icon-video-camera"></span> 经典</a></li>
            <li><a href="${pageContext.request.contextPath}/videos/videos.html?type=3" class="am-cf"><span class="am-icon-video-camera"></span> 最新</a></li>
            <li><a href="${pageContext.request.contextPath}/videos/videos.html?type=4" class="am-cf"><span class="am-icon-video-camera"></span> 游戏</a></li>
            <li><a href="${pageContext.request.contextPath}/videos/videos.html?type=5" class="am-cf"><span class="am-icon-video-camera"></span> 搞笑</a></li>
            <li><a href="${pageContext.request.contextPath}/videos/videos.html?type=6" class="am-cf"><span class="am-icon-video-camera"></span> 学视</a></li>
          </ul>
        </li>

        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav-video-index'}"><span class="am-btn-default am-icon-btn am-icon-youtube-play "></span> 首页 <span class="am-icon-angle-right  am-fr am-margin-right" style="height: 48px; padding-top: 12px; padding-bottom: 12px;"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav-video-index">
            <li><a href="${pageContext.request.contextPath}/videos/index.html" class="am-cf"><span class="am-icon-video-camera"></span> 首页视频 </a></li>
          </ul>
        </li>

        <li><a href="${pageContext.request.contextPath}/logout"><span class="am-icon-sign-out"></span> 注销</a></li>
      </ul>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-bookmark"></span> 公告</p>
          <p>系统采用Oauth 2.0 Grant_Code 方式 认证</p>
        </div>
      </div>

    </div>
  </div>
  <!-- sidebar end -->

