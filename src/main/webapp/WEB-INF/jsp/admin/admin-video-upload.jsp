<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2016/4/17
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="common/header.jsp" %>

<!-- content start -->
<div class="admin-content">
  <div class="admin-content-body">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">视频管理</strong> / <small>添加视频</small></div>
    </div>

    <div class="am-g">
      <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <br>

        <div id="uploader" class="wu-example">
          <!--用来存放文件信息-->
          <div id="thelist" class="uploader-list"></div>
          <div class="btns" id="uploadButton">
            <div id="picker">选择文件</div>
            <button id="ctlBtn" class="btn btn-default">开始上传</button>
          </div>
        </div>

      </div>
    </div>
    <hr>

    <div id="videoInfo" class="am-g am-fade">
    <div class="am-u-sm-12">
      <div class="am-tabs-bd">

        <div class="am-tab-panel am-fade am-in am-active" id="tab2">
          <form class="am-form">
            <input type="text" id="videoId" style="display: none"/>
            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                视频名称
              </div>
              <div class="am-u-sm-8 am-u-md-5">
                <input id="name" type="text" class="am-input-sm">
              </div>
              <div class="am-hide-sm-only am-u-md-5">*必填</div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                视频简介
              </div>
              <div class="am-u-sm-8 am-u-md-5 am-u-end col-end">
                <textarea id="description" rows="6" placeholder="请使用富文本编辑插件"></textarea>
              </div>
              <div class="am-hide-sm-only am-u-md-5">选填</div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                演员表
              </div>
              <div class="am-u-sm-8 am-u-md-5">
                <input id="performer" type="text" class="am-input-sm">
              </div>
              <div class="am-hide-sm-only am-u-md-5">选填</div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                分类
              </div>
              <div class="am-u-sm-8 am-u-md-5">
                <select id="type"  class="am-input-sm">
                  <option value="0">电视剧</option>
                  <option value="1">电影</option>
                  <option value="2">娱乐</option>
                  <option value="3">动漫</option>
                  <option value="4">音乐</option>
                  <option value="5">教育</option>
                  <option value="6">科技</option>
                  <option value="7">原创</option>
                  <option value="8">生活</option>
                  <option value="9">学视</option>
                </select>
              </div>
              <div class="am-hide-sm-only am-u-md-5">*必填</div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                话题
              </div>
              <div class="am-u-sm-8 am-u-md-5">
                <input id="album" type="text" class="am-input-sm" placeholder="话题是同一主题的视频集合；如视频内容与话题不匹配，将不能成功进入话题">
              </div>
              <div class="am-hide-sm-only am-u-md-5">选填</div>
            </div>


          </form>

          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right" style="opacity: 0">
              话题
            </div>
            <div class="am-u-sm-8 am-u-md-5">
              <button type="submit" class="am-btn am-btn-primary am-btn-block" onclick="updateVideo()">确定</button>
            </div>
            <div class="am-hide-sm-only am-u-md-5"></div>
          </div>

        </div>

      </div>

    </div>
  </div>

    <div id="successInfo" class="am-g am-fade">
      <div class="am-u-sm-12">
        <div class="am-tabs-bd">

          <div class="am-tab-panel am-fade am-in am-active" id="tab3">
            <br>
            <h4 class="am-u-sm-3 am-u-sm-centered">视频上传成功，进入审核阶段</h4>
          </div>

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
<script>
  var BASE_URL = "${pageContext.request.contextPath}/static/webupload";

  var base = "<%=basePath%>";

  var uploadUrl =base +"${pageContext.request.contextPath}/videos";

  // 文件上传
  jQuery(function() {
    var $ = jQuery,
            $list = $('#thelist'),
            $btn = $('#ctlBtn'),
            state = 'pending',
            uploader;

    uploader = WebUploader.create({

      // 不压缩image
      resize: false,

      // swf文件路径
      swf: BASE_URL + '/js/Uploader.swf',

      // 文件接收服务端。
      server: uploadUrl,

      // 选择文件的按钮。可选。
      // 内部根据当前运行是创建，可能是input元素，也可能是flash.
      pick: '#picker'
    });

    // 当有文件添加进来的时候
    uploader.on( 'fileQueued', function( file ) {
      $list.append( '<div id="' + file.id + '" class="item">' +
      '<h4 class="info" id="title">' + file.name + '</h4>' +
      '<p class="state">等待上传...</p>' +
      '</div>' );
    });

    // 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
      var $li = $( '#'+file.id ),
              $percent = $li.find('.progress .progress-bar');

      // 避免重复创建
      if ( !$percent.length ) {
        $percent = $('<div class="progress progress-striped active">' +
        '<div class="progress-bar" role="progressbar" style="width: 0%">' +
        '</div>' +
        '</div>').appendTo( $li ).find('.progress-bar');
      }

      $li.find('p.state').text('上传中');

      $percent.css( 'width', percentage * 100 + '%' );
    });

    uploader.on( 'uploadSuccess', function( file, response) {
      $( '#'+file.id ).find('p.state').text('已上传');


      var data = response.data.videoInfo;
      console.log("服务器返回的数据的是：" , data);

      initData(data);

      $("#videoInfo").removeClass("am-fade")

    });

    uploader.on( 'uploadError', function( file ) {
      $( '#'+file.id ).find('p.state').text('上传出错');
    });

    uploader.on( 'uploadComplete', function( file ) {
      // 隐藏进度条
//      $( '#'+file.id ).find('.progress').fadeOut();
      // 隐藏 button
      $("#uploadButton").hide();
//      $("#uploadButton").addClass("am-fade");
      $("#title").hide();
    });

    uploader.on( 'all', function( type ) {
      if ( type === 'startUpload' ) {
        state = 'uploading';
      } else if ( type === 'stopUpload' ) {
        state = 'paused';
      } else if ( type === 'uploadFinished' ) {
        state = 'done';
      }

      if ( state === 'uploading' ) {
        $btn.text('暂停上传');
      } else {
        $btn.text('开始上传');
      }
    });

    $btn.on( 'click', function() {
      if ( state === 'uploading' ) {
        uploader.stop();
      } else {
        uploader.upload();
      }
    });
  });


  function initData(data){
    $("#videoId").val(data.videoId);
    $("#name").val(data.name);
    $("#description").val(data.description);
    $("#performer").val(data.performer);
    $("#type").val(data.type);
    $("#album").val(data.album);
  }


  function updateVideo(){
    var video = {
      name:$("#name").val(),
      description: $("#description").val(),
      performer:$("#performer").val(),
      type: $("#type").val(),
      album:$("#album").val()
    };

    $.ajax({
      url: uploadUrl + "/" + $("#videoId").val(),
      contentType:"application/json",
      type: 'post',
      dataType:'JSON',
      data:JSON.stringify(video)
    }).success(function(data){
      if(data.state != 200){
        alert(data.message);
      }else{
        $("#videoInfo").hide();
        $("#successInfo").removeClass("am-fade")
      }
    }).error(function(){

    });
  }



</script>
