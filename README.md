#就拍-TJUSTV接口文档

## 1、Videos 相关接口
* 访问所有Video：[http://121.42.217.4:8080/TJUSTV/videos](http://121.42.217.4:8080/TJUSTV/videos)
    *  method: get
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
	*   method: get
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
* 根据类型查询Video：[http://121.42.217.4:8080/TJUSTV/videos?type=4]([http://121.42.217.4:8080/TJUSTV/videos?type=4](http://121.42.217.4:8080/TJUSTV/videos?type=4))
    * method: get
    * parameter: type={value}      	
>            value 取值 0~6 整数  ： 0 热门，1 精选，2 经典，3 最新，4 游戏，5 搞笑，6 学视        
