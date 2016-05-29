#就拍-TJUSTV接口文档

## 1、Videos 相关接口
* 访问所有Video：[http://121.42.217.4:8080/TJUSTV/videos](http://121.42.217.4:8080/TJUSTV/videos)
    *  method: GET
    *  parameter:null
    *  response: application/json
    *  example result:
```js
{
  "state": 200,
  "message": "操作成功",
  "data": {
    "videos": [
      {
        "videoId": 20,
        "name": "《琅琊榜》MV-刘涛《红颜旧》_标清.flv",
        "description": "视频文件：《琅琊榜》MV-刘涛《红颜旧》_标清.flv",
        "performer": "xx 明星",
        "album": "xx 电视剧",
        "path": "http://121.42.217.4:8080/upload/video/2016_05_29/15504856250368481/2016_05_29_10_32_13_15504856274117801.flv",
        "imagePath": "http://121.42.217.4:8080/upload/video/2016_05_29/15504856250368481/2016_05_29_10_32_13_15504856274117801.jpg",
        "praise": 0,
        "createtime": 1464489135000,
        "updatetime": 1464489309000,
        "size": 8106010,
        "duration": "00:03:46.02",
        "visitedTimes": 0,
        "targetDir": "/alidata/upload/video/2016_05_29/15504856250368481",
        "state": 0,
        "type": 4,
        "index": 1
      }]
    }
}    
```
* 根据name检索Video：[http://121.42.217.4:8080/TJUSTV/videos?key=琅琊榜](http://121.42.217.4:8080/TJUSTV/videos?key=琅琊榜)
	*   method: GET
	*   parameter: key={value}
	*   response: application/json
	*   example result:
```js
{
  "state": 200,
  "message": "操作成功",
  "data": {
    "videos": [
      {
        "videoId": 20,
        "name": "《琅琊榜》MV-刘涛《红颜旧》_标清.flv",
        "description": "视频文件：《琅琊榜》MV-刘涛《红颜旧》_标清.flv",
        "performer": "xx 明星",
        "album": "xx 电视剧",
        "path": "http://121.42.217.4:8080/upload/video/2016_05_29/15504856250368481/2016_05_29_10_32_13_15504856274117801.flv",
        "imagePath": "http://121.42.217.4:8080/upload/video/2016_05_29/15504856250368481/2016_05_29_10_32_13_15504856274117801.jpg",
        "praise": 0,
        "createtime": 1464489135000,
        "updatetime": 1464489309000,
        "size": 8106010,
        "duration": "00:03:46.02",
        "visitedTimes": 0,
        "targetDir": "/alidata/upload/video/2016_05_29/15504856250368481",
        "state": 0,
        "type": 4,
        "index": 1
      }
    ]
  }
}
```
* 根据类型查询Video：[http://121.42.217.4:8080/TJUSTV/videos?type=4](http://121.42.217.4:8080/TJUSTV/videos?type=4)
    * method: GET
    * parameter: type={value}   _value 取值 0~6 整数  ： 0 热门，1 精选，2 经典，3 最新，4 游戏，5 搞笑，6 学视_
    * response: application/json
    * example result:
```js
{
  "state": 200,
  "message": "操作成功",
  "data": {
    "videos": [
      {
        "videoId": 20,
        "name": "《琅琊榜》MV-刘涛《红颜旧》_标清.flv",
        "description": "视频文件：《琅琊榜》MV-刘涛《红颜旧》_标清.flv",
        "performer": "xx 明星",
        "album": "xx 电视剧",
        "path": "http://121.42.217.4:8080/upload/video/2016_05_29/15504856250368481/2016_05_29_10_32_13_15504856274117801.flv",
        "imagePath": "http://121.42.217.4:8080/upload/video/2016_05_29/15504856250368481/2016_05_29_10_32_13_15504856274117801.jpg",
        "praise": 0,
        "createtime": 1464489135000,
        "updatetime": 1464489309000,
        "size": 8106010,
        "duration": "00:03:46.02",
        "visitedTimes": 0,
        "targetDir": "/alidata/upload/video/2016_05_29/15504856250368481",
        "state": 0,
        "type": 4,
        "index": 1
      }]
  }
}
```
* 获取首页顶栏轮播视频：[http://121.42.217.4:8080/TJUSTV/videos/index](http://121.42.217.4:8080/TJUSTV/videos/index)
	* method: GET 
	* parameter: null
	* response type: application/json
	* example result:
```js
{
  "state": 200,
  "message": "操作成功",
  "data": {
    "videos": [
      {
        "videoId": 20,
        "name": "《琅琊榜》MV-刘涛《红颜旧》_标清.flv",
        "description": "视频文件：《琅琊榜》MV-刘涛《红颜旧》_标清.flv",
        "performer": "xx 明星",
        "album": "xx 电视剧",
        "path": "http://121.42.217.4:8080/upload/video/2016_05_29/15504856250368481/2016_05_29_10_32_13_15504856274117801.flv",
        "imagePath": "http://121.42.217.4:8080/upload/video/2016_05_29/15504856250368481/2016_05_29_10_32_13_15504856274117801.jpg",
        "praise": 0,
        "createtime": 1464489135000,
        "updatetime": 1464489309000,
        "size": 8106010,
        "duration": "00:03:46.02",
        "visitedTimes": 0,
        "targetDir": "/alidata/upload/video/2016_05_29/15504856250368481",
        "state": 0,
        "type": 4,
        "index": 1
      }]
  }
}
```
* 访问编号为{videoId} Video: [http://121.42.217.4:8080/TJUSTV/videos/{videoId}](http://121.42.217.4:8080/TJUSTV/videos/22)
	* method: GET
	* parameter: null
	* example result:
```js
{
  "state": 200,
  "message": "操作成功",
  "data": {
    "video": {
      "videoId": 22,
      "name": "电视剧《武媚娘传奇》 插曲《敢为天下先》-张靓颖_标清.flv",
      "description": "视频文件：电视剧《武媚娘传奇》 插曲《敢为天下先》-张靓颖_标清.flv",
      "performer": "xx 明星",
      "album": "xx 电视剧",
      "path": "http://121.42.217.4:8080/upload/video/2016_05_29/15504926042700957/2016_05_29_10_33_23_15504926063118501.flv",
      "imagePath": "http://121.42.217.4:8080/upload/video/2016_05_29/15504926042700957/2016_05_29_10_33_23_15504926063118501.jpg",
      "praise": 0,
      "createtime": 1464489203000,
      "updatetime": 1464489203000,
      "size": 10568719,
      "duration": "00:04:54.20",
      "visitedTimes": 0,
      "targetDir": "/alidata/upload/video/2016_05_29/15504926042700957",
      "state": 0,
      "type": 4,
      "index": 0
    }
  }
}
```
## 2、收藏相关接口
* 编号为 {userId} 的用户收藏编号为 {videoId} 的视频：
  [http://121.42.217.4:8080/TJUSTV/users/{userId}/collections](http://121.42.217.4:8080/TJUSTV/users/6/collections)
	* method: POST
	* parameter: videoId={videoId}
	* example result:
```js
{
  "state": 200,
  "message": "操作成功",
  "data": {
    "collectionId": 1
  }
}
```
* 编号为 {userId} 的用户取消编号为{collectionId}的收藏：[http://121.42.217.4:8080/TJUSTV/users/{userId}/collections/{collectionId}](http://121.42.217.4:8080/TJUSTV/users/6/collections/2)
	* method: DELETE
	* example result:
```js
{
  "state": 200,
  "message": "操作成功",
  "data": null
}
```
* 查看编号为 userId 的用户全部收藏 [http://121.42.217.4:8080/TJUSTV/users/{userId}/collections/](http://121.42.217.4:8080/TJUSTV/users/6/collections/)
	* method: GET
	* example result:
```js
{
  "state": 200,
  "message": "操作成功",
  "data": {
    "collections": [
      {
        "collectionId": 1,
        "userId": 6,
        "videoId": 22
      }
    ]
  }
}
```

## 3、视频点赞相关接口
* 编号为 {videoId} 的视频点赞：[http://121.42.217.4:8080/TJUSTV/videos/{videoId}/praise](http://121.42.217.4:8080/TJUSTV/videos/20/praise)
	* method:  GET	
	* example result:
```js
{
  "state": 200,
  "message": "操作成功",
  "data": null
}
```

## 4、视频评论相关接口

* 编号为 {userId} 的用户评论某视频：[http://121.42.217.4:8080/TJUSTV/users/{userId}/comments](http://121.42.217.4:8080/TJUSTV/users/6/comments)
	*  method: POST
	*  header: Content-Type=application/json
	*  request-Body: 
```js
{
   "ref_video_Id":20,
   "content":"琅琊榜真好看！！！！！！！1"
}
```
	* example result：
```js
{
  "state": 200,
  "message": "操作成功",
  "data": null
}
```
* 查看编号为 {videoId} 的视频全部评论：[http://121.42.217.4:8080/TJUSTV/videos/{videoId}/comments](http://121.42.217.4:8080/TJUSTV/videos/20/comments)
	* method: GET
	* example result:
```js
{
  "state": 200,
  "message": "操作成功",
  "data": {
    "comments": [
      {
        "commentId": 1,
        "content": "琅琊榜真好看！！！！！！！1",
        "createtime": 1464509637000,
        "user": {
          "userId": 6,
          "account": "haoxiaotian",
          "aboutMe": null,
          "avatarPath": null,
          "lastIp": null,
          "createtime": 1460823458000,
          "updatetime": 1460829138000
        },
        "ref_video_Id": 20
      }
    ]
  }
}
```
* 编号为 {userId} 的用户删除编号为 {commentId} 的评论：[http://121.42.217.4:8080/TJUSTV/users/{userId}/comments/{commentId}](http://121.42.217.4:8080/TJUSTV/users/6/comments/1)
	* method: DELETE
	* example result:
```js
{
  "state": 200,
  "message": "操作成功",
  "data": null
}
```
	

	