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
      <div id="video_check" class="am-fl am-cf"><strong class="am-text-primary am-text-lg">视频管理</strong> / <small>视频审查</small></div>
    </div>
    <hr>

    <div class="am-g am-margin-top">

      <div class="am-u-md-1">

      </div>

      <div class="am-u-md-8">
        <embed src="${pageContext.request.contextPath}/resources/ckplayer/ckplayer.swf"
               flashvars="f=${video.path}" quality="high" width="600"
               height="400" align="middle" allowScriptAccess="always" allowFullscreen="true"
               type="application/x-shockwave-flash"></embed>

        <%--<div id="a1">--%>

        <%--</div>--%>


      </div>

      <div class="am-u-md-3">

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

<%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/ckplayer/ckplayer.js" charset="utf-8"></script>--%>
<%--<script type="text/javascript">--%>
  <%--var flashvars={--%>
    <%--f:${video.path},--%>
    <%--c:0,--%>
    <%--loaded:'loadedHandler'--%>
  <%--};--%>
  <%--var video=['${video.path}->video/mp4','${video.path}->video/webm','${video.path}->video/m3u8','${video.path}->video/ogg'];--%>
  <%--CKobject.embed('${pageContext.request.contextPath}/static/ckplayer/ckplayer.swf','a1','ckplayer_a1','600','400',false,flashvars,video);--%>
<%--</script>--%>