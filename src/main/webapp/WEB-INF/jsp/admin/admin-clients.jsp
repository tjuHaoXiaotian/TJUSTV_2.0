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
<div class="admin-content" style="height: 100%">
  <div class="admin-content-body">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">客户端管理</strong> / <small>客户端列表</small></div>
    </div>

    <c:if test="${not empty msg}">
      <div class="message">${msg}</div>
    </c:if>

    <div class="am-g" style="height: 50%">
      <div class="am-u-sm-12">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
          <thead>
          <tr>
            <th>客户端名</th>
            <th>客户端ID</th>
            <th>客户端安全KEY</th>
            <th>客户端REDIRECT URI</th>
            <th>管理</th>
          </tr>
          </thead>
          <tbody>

          <c:forEach items="${clientList}" var="client">
            <tr>
              <td>${client.clientName}</td>
              <td>${client.clientId}</td>
              <td>${client.clientSecret}</td>
              <td>${client.clientRedirectUri}</td>
              <td>
                <div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                    <a href="${pageContext.request.contextPath}/clients/${client.id}/update" class="am-btn am-btn-default am-btn-xs"><span class="am-icon-pencil-square-o am-text-secondary">修改</span> </a>
                    <a href="${pageContext.request.contextPath}/clients/${client.id}/delete" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-trash-o am-text-danger"> 删除</span></a>
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


</div>
<!-- content end -->
</div>

<%@include file="common/footer.jsp" %>
