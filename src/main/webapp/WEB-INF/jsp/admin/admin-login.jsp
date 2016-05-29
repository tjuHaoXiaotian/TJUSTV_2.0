<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2016/4/17
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>登录</title>
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
    .header p {
      font-size: 14px;
    }
    .error{
      color:red;
    }
  </style>
</head>
<body>
<div class="header am-topbar ">
  <div class="am-g">
    <h1><span class="am-icon-youtube-play am-icon-sm">&nbsp;&nbsp;TUSTV</span></h1>
  </div>

</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <br>
    <div class="error">${error}</div>
    <form action="" method="post" class="am-form">
      <label for="username">用户名:</label>
      <input type="text" name="username" id="username" value="<shiro:principal/>">
      <br>
      <label for="password">密码:</label>
      <input type="password" name="password" id="password" value="">
      <br>
      <label for="remember-me">
        <input id="remember-me" type="checkbox" name="rememberMe" value="true">
        记住密码
      </label>
      <br />
      <div class="am-cf">
        <input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
        <input type="submit" name="" value="忘记密码 ^_^? " class="am-btn am-btn-default am-btn-sm am-fr">
      </div>
    </form>
    <hr>
    <p>© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
  </div>
</div>
</body>
</html>

