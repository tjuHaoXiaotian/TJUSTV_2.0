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
<div class="admin-content" style="height: 100%">
  <div class="admin-content-body">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户管理</strong> / <small>用户列表</small></div>
    </div>

    <div class="am-g" style="height: 50%">
      <div class="am-u-sm-12">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
          <thead>
          <tr>
            <th>ID</th>
            <th>用户名</th>
            <th>状态 state</th>
            <th>管理</th>
          </tr>
          </thead>
          <tbody>

          <c:forEach items="${userList}" var="user">
            <tr>
              <td>${user.localId}</td>
              <td>${user.account}</td>
              <c:if test="${user.state == 0}">
                <td><span class="am-badge am-badge-success">正常</span></td>
              </c:if>
              <c:if test="${user.state == -1}">
                <td><span class="am-badge am-badge-danger">禁用</span></td>
              </c:if>


              <td>
                <div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                    <a href="${pageContext.request.contextPath}/localUsers/${user.localId}/update" class="am-btn am-btn-default am-btn-xs "><span class="am-icon-pencil-square-o am-text-primary">编辑</span> </a>
                    <a href="${pageContext.request.contextPath}/localUsers/${user.localId}/changePassword" class="am-btn am-btn-default am-btn-xs "><span class="am-icon-pencil-square-o am-text-secondary">修改密码</span> </a>
                    <a href="${pageContext.request.contextPath}/localUsers/${user.localId}/delete" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-trash-o am-text-danger">删除</span> </a>
                  </div>
                </div>
              </td>
            </tr>
          </c:forEach>

          </tbody>
        </table>
      </div>
    </div>


    <footer class="admin-content-footer" style="margin-top: 20%">
      <hr>
      <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
  </div>
  <!-- content end -->

</div>
</div>
<%@include file="common/footer.jsp" %>

