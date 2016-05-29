package cn.edu.tju.scs.resource.tv.common;

/**
 * 视频种类
 * Created by jack on 2016/3/28.
 */
public enum Type {

    TVPLAY(0,"热门"),
    MOVIE(1,"精选"),
    ENTERTAINMENT(2,"经典"),
    CARTOON(3,"最新"),
    MUSIC(4,"游戏"),
    EDUCATION(5,"搞笑"),
    STV(6,"学视"),

    ;

    // 种类编号
    private int type;

    // 说明
    private String message;

    private Type(int type,String message){
        this.type = type;
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
