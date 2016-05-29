<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2016/4/17
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp" %>


<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">TJUSTV</div>
    <div class="am-modal-bd">
      你，确定要删除这条视频记录吗？
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>

<!-- content start -->
<div class="admin-content" style="height: 100%">
  <div class="admin-content-body">
    <div class="am-cf am-padding">
      <div id="video_lists" class="am-fl am-cf"><strong class="am-text-primary am-text-lg">视频管理</strong> / <small>视频列表</small></div>
    </div>

    <div class="am-g" style="height: 50%">
      <div class="am-u-sm-12">
        <table id="videos" class="am-table am-table-bd am-table-striped admin-content-table">
          <thead>
          <tr>
            <th>ID</th>
            <th>缩略图</th>
            <th>种类</th>
            <th>视频名称</th>
            <th>视频描述</th>
            <th>系列</th>
            <th>主演</th>
            <th>时长</th>
            <th>大小</th>
            <th>访问次数</th>
            <th>创建时间</th>
            <th>是否首页</th>
            <th>设为首页</th>
            <th>置顶</th>
            <th>操作</th>

          </tr>
          </thead>
          <tbody id="video-modal-list">


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

<script>

  var rootUrl = "<%=basePath%>";

  function getUrl(){
    if(${type!=null}){
      return rootUrl + "${pageContext.request.contextPath}/videos?type=${type}";
    }else{
      return rootUrl + "${pageContext.request.contextPath}/videos";
    }
  }
  var table;
  function loadTable(){
    $.ajax({
      url: getUrl(),
      type: 'get',
      dataType: 'json'
    }).success(function(data){
              table = $('#videos').DataTable({
                "bProcessing": true,
                "bDestroy": true,
                "sPaginationType" : "full_numbers",
                "oLanguage" : {
                  "sLengthMenu": "每页显示 _MENU_ 条记录",
                  "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                  "sInfoEmpty": "没有数据",
                  "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                  "sZeroRecords": "没有检索到数据",
                  "sSearch": "搜索: &nbsp",
                  "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                  }
                },
                "data":data.data.videos,
                "columns": [
                  { "data": 'videoId' } ,
                  { "data":'path'} ,
                  { "data":'type'} ,
                  { "data": 'name' },
                  { "data": 'description' },
                  { "data": 'album' },
                  { "data": 'performer' },
                  { "data": 'duration' },
                  { "data": 'size' },
                  { "data": 'visitedTimes' },
                  { "data": 'createtime' },
                  { "data": 'index'},
                  { "data": 'videoId' },
                  { "data": 'videoId' },
                  { "data": 'videoId' }
                ],
                "columnDefs": [
                  {
                    "targets": 0,
                    "render": function (data, type, row, table) {
                      return '<a href="${pageContext.request.contextPath}/videos/check/'+ data + '" >'+data+ '</a>';
                    }
                  },
                  {
                    "targets": 1,
                    "render": function (data, type, row, table) {
                      var imageUrl = data.substring(0,data.lastIndexOf("."))+".jpg";
                      console.log("数据是2：" + data + '  ;' + imageUrl);
                      return '<div><img class="am-radius" alt="120*80" width="120" height="80" src="' + imageUrl + '" /> </div>';
                    }

                  },
                  {
                    "targets": 2,
                    "render": function (data, type, row, table) {
                      return  Video.parseType(data);
                    }
                  },
                  {
                    "targets": -4,
                    "render": function (data, type, row, table) {
                      return  function(){
                        if(data == 1){
                          return '<span style="color: greenyellow">yes</span>';
                        }else{
                          return '<span>no</span>';
                        }
                      }
                    }
                  },
                  {
                    "targets": -3,
                    "render": function (data, type, row, table) {

                      return '<a onclick="setTop('+data+')" class="am-btn am-btn-default am-btn-xs"> <span class="am-icon-play am-text-success">置顶</span></a>';
                    }
                  },
                  {
                    "targets": -2,
                    "render": function (data, type, row, table) {

                      return '<a onclick="setIndex('+data+')" class="am-btn am-btn-default am-btn-xs"> <span class="am-icon-play am-text-success">设为首页</span></a>';
                    }
                  },
                  {
                    "targets": -1,
                    "render": function (data, type, row, table) {

                      return '<a href="${pageContext.request.contextPath}/videos/check/'+data + '" class="am-btn am-btn-default am-btn-xs"> <span class="am-icon-play am-text-success"> 播放</span></a>'
                              + '<a href="" class="am-btn am-btn-default am-btn-xs" onclick=""> <span class="am-icon-pencil-square-o am-text-secondary"> 编辑</span></a>'
                              +'<a onclick="deleteClick('+data+',this)" class="btn-delete am-btn am-btn-default am-btn-xs" id="'+data+'"> <span class="am-icon-trash-o am-text-danger"> 删除</span></a>';
                    }
                  }]
              });
            });


  }

  function deleteVideo(id){
    $.ajax({
      url: rootUrl+'${pageContext.request.contextPath}/videos/'+id,

//             contentType:"application/json",
      type: 'delete',
      dataType: 'json'
//             data:JSON.stringify(newApply)
    }).success(function(data){
      loadTable();
    }).error(function(){
      alert("删除失败");
    });
  }

  function deleteClick(id,ele) {
              $('#my-confirm').modal({
                relatedTarget: ele,
                onConfirm: function(options) {
                  var $link = $(this.relatedTarget);
                  console.log("数据：",$link.attr("id"));
                  deleteVideo($link.attr("id"));
                },
                // closeOnConfirm: false,
                onCancel: function() {
                }
              });
  }

  function setIndex(id){
    $.ajax({
      url: rootUrl+'${pageContext.request.contextPath}/videos/'+id+'/setIndex',
      type: 'get',
      dataType: 'json'
    }).success(function(data){
      loadTable();
      alert("设置成功！");
    }).error(function(){
      alert("设置失败！");
    });
  }

  function setTop(id){
    $.ajax({
      url: rootUrl+'${pageContext.request.contextPath}/videos/'+id+'/setTop',
      type: 'get',
      dataType: 'json'
    }).success(function(data){
      loadTable();
      alert("设置成功！");
    }).error(function(){
      alert("设置失败！");
    });
  }

  $(document).ready(function() {
    loadTable();
  });
</script>
