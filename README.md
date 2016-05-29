#就拍-TJUSTV接口文档

## 1、Videos 相关接口
* [getAll()：http://121.42.217.4:8080/TJUSTV/videos](http://121.42.217.4:8080/TJUSTV/videos)
    *  method: get
    *  response: application/json
    *  exmaple:

		 { "state":200, 
		"message":"操作成功",																					
		"data":{"videos":[{"videoId":20,"name":"《琅琊榜》MV-刘涛《红颜旧》_标清.flv","description":"视频文件：《琅琊榜》MV-刘涛《红颜旧》_标清.flv","performer":"xx 明星","album":"xx 电视剧","path":"http://121.42.217.4:8080/upload/video/2016_05_29/15504856250368481/2016_05_29_10_32_13_15504856274117801.flv",
		"imagePath":"http://121.42.217.4:8080/upload/video/2016_05_29/15504856250368481/2016_05_29_10_32_13_15504856274117801.jpg",
	"praise":0,"createtime":1464489135000,"updatetime":1464489309000,"size":8106010,"duration":"00:03:46.02","visitedTimes":0,"targetDir":"/alidata/upload/video/2016_05_29/15504856250368481","state":0,"type":4,"index":1
	}]}
	}`