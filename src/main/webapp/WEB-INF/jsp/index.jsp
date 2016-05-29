<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
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
    <style>
        .header {
            text-align: center;
        }
        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }

        .body h1 {
            font-size: 900%;
            color: #D3D5D1;
            margin-top: 30px;
        }
        .header p {
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="header am-topbar ">
    <div class="am-g">
        <h1><span class="am-icon-youtube-play am-icon-sm">&nbsp;&nbsp;TJUSTV</span></h1>
    </div>

</div>
<div class="am-g">
    <div class="body am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <br>
        <shiro:guest>
            游客你好，请<a href="${pageContext.request.contextPath}/login">登录</a>！
        </shiro:guest>

        <shiro:user>
            欢迎[<shiro:principal/>]，点击<a href="${pageContext.request.contextPath}/logout">退出</a>！<br/>
            <a href="${pageContext.request.contextPath}/clients" target="_blank">客户端管理</a><br/>
            <a href="${pageContext.request.contextPath}/videos/videos.html" target="_blank">视频管理</a><br/>
        </shiro:user>

        <h1 style="text-align: center"> Oauth 2.0</h1>
        <div style="margin-top: 20%">
            <hr>
            <p>© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
        </div>

    </div>
</div>
</body>
</html>

