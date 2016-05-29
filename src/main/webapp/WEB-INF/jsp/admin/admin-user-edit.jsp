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



          <form:form class="am-form" method="post" commandName="user">

            <form:hidden path="localId"/>

            <form:hidden path="salt"/>

            <c:if test="${op ne '新增'}">
              <form:hidden path="password"/>
            </c:if>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                用户名
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <form:input class="am-input-sm" path="account"/>
              </div>
              <div class="am-hide-sm-only am-u-md-6">*必填，不可重复</div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                状态
              </div>
              <!--<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">-->
              <!--<input type="text" class="am-input-sm">-->
              <!--</div>-->
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <form:select data-am-selected="{btnSize: 'sm'}" path="state">
                  <form:option value="0">正常</form:option>
                  <form:option value="-1">禁用</form:option>
                </form:select>
              </div>
              <div class="am-hide-sm-only am-u-md-6">*必填，设置用户状态</div>
            </div>

            <c:if test="${op eq '新增'}">
              <div class="am-g am-margin-top">
                <div class="am-u-sm-4 am-u-md-2 am-text-right">
                  密码
                </div>
                <div class="am-u-sm-8 am-u-md-4">
                  <form:password path="password" class="am-input-sm"/>
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
            </c:if>

            <div class="am-margin">
              <form:button class="am-btn am-btn-primary am-btn-xs">${op}</form:button>
              <button type="button" class="am-btn am-btn-primary am-btn-xs">放弃保存</button>
            </div>
          </form:form>

        </div>
      </div>
    </div>



    <footer class="admin-content-footer am-margin-bottom" style="margin-top: 20%">
      <hr>
      <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
  </div>

</div>
<!-- content end -->

</div>


<%@include file="common/footer.jsp" %>

