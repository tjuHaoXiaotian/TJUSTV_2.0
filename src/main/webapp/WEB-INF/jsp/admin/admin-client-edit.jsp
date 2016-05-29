<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2016/4/17
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp" %>

<!-- content start -->
<div class="admin-content">
  <div class="admin-content-body">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">客户端管理</strong> / <small>添加客户端</small></div>
    </div>

    <div class="am-g">
      <div class="am-u-sm-12">
        <div class="am-tab-panel" id="tab2">


          <form:form class="am-form"  method="post"  commandName="client">
            <form:hidden path="id"/>
            <form:hidden path="clientId"/>
            <form:hidden path="clientSecret"/>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                客户端名
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <form:input path="clientName" class="am-input-sm"/>
              </div>
              <div class="am-hide-sm-only am-u-md-6">*必填，不可重复</div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                REDIRECT URI：
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <form:input path="clientRedirectUri" class="am-input-sm"/>
              </div>
              <div class="am-hide-sm-only am-u-md-6">*必填(回调URI)</div>
            </div>

            <div class="am-margin">
              <form:button class="am-btn am-btn-primary am-btn-xs">${op}</form:button>
              <button type="button" class="am-btn am-btn-primary am-btn-xs">放弃保存</button>
            </div>

          </form:form>


        </div>
      </div>
    </div>



    <footer class="admin-content-footer" style="margin-top: 20%">
      <hr>
      <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
  </div>

</div>

<!-- content end -->

</div>

<%@include file="common/footer.jsp" %>
