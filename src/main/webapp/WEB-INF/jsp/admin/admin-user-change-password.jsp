<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2016/4/17
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp" %>


<!-- content start -->
<div class="admin-content">
  <div class="admin-content-body">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户管理</strong> / <small>添加用户</small></div>
    </div>

    <div class="am-g">
      <div class="am-u-sm-12">
        <div class="am-tab-panel" id="tab2">
          <form class="am-form" method="post">

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                新密码
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input id="newPassword" name="newPassword" type="password" class="am-input-sm">
              </div>
              <div class="am-hide-sm-only am-u-md-6">*必填</div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                确认密码
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="password" class="am-input-sm">
              </div>
              <div class="am-hide-sm-only am-u-md-6">*必填</div>
            </div>

            <div class="am-margin">
              <input class="am-btn am-btn-primary am-btn-xs" type="submit" value="${op}">
              <input type="reset" class="am-btn am-btn-primary am-btn-xs" value="放弃保存"/>
            </div>

          </form>

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
