/**
 * Created by jack on 2016/5/28.
 */
var Video = {
    type:["热门","精选","经典","最新","游戏","搞笑","学视"],
    parseType:function(type){
        return Video.type[type];
    }
};