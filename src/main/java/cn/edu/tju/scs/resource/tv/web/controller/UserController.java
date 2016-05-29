package cn.edu.tju.scs.resource.tv.web.controller;

import cn.edu.tju.scs.oauth2.common.BizCode;
import cn.edu.tju.scs.oauth2.common.StateCode;
import cn.edu.tju.scs.oauth2.entity.User;
import cn.edu.tju.scs.oauth2.service.UserService;
import cn.edu.tju.scs.oauth2.web.controller.base.BaseController;
import cn.edu.tju.scs.resource.tv.domain.Comment;
import cn.edu.tju.scs.resource.tv.service.CollectionService;
import cn.edu.tju.scs.resource.tv.service.CommentService;
import cn.edu.tju.scs.resource.tv.web.aspect.RequireOwner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
* User Controller
* Created by jack on 2016/3/28.
*/

@Controller(value = "userController")
@RequestMapping(value = "/users")
public class UserController extends BaseController {

    @Autowired
    UserService userService;

    @Autowired
    CommentService commentService;

    @Autowired
    CollectionService collectionService;



    /**
     * 查看所有用户信息
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody
    StateCode getAllUser() {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("users",userService.findAll());
        return stateCode;
    }

    /**
     * 查看 指定 id 用户信息
     * @return
     */
    @RequireOwner("User")
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public @ResponseBody
    StateCode getAllUser(@PathVariable int id) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("user",userService.findOne(id));
        return stateCode;
    }




    /**
     * 添加一个收藏
     * @return
     */
    @RequestMapping(value = "/{userId}/collections",method = RequestMethod.POST)
    public @ResponseBody
    StateCode collect(@PathVariable int userId,@RequestParam(value = "videoId") int videoId ) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("collectionId",collectionService.collect(userId,videoId));
        return stateCode;
    }

    /**
     * 取消一个收藏
     * @return
     */
    @RequestMapping(value = "/{userId}/collections/{collectionId}",method = RequestMethod.DELETE)
    public @ResponseBody
    StateCode deCollect(@PathVariable int userId,@PathVariable int collectionId) {
        collectionService.deCollect(collectionId);
        return StateCode.buildCode(BizCode.SUCCESS);
    }


    /**
     * 查看所有收藏
     * @return
     */
    @RequestMapping(value = "/{userId}/collections",method = RequestMethod.GET)
    public @ResponseBody
    StateCode getAllCollection(@PathVariable int userId) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("collections", collectionService.getAllCollection(userId));
        return stateCode;
    }


    /**
     * 添加一个评论，可能有错
     * @return
     */
    @RequestMapping(value = "/{userId}/comments",method = RequestMethod.POST)
    public @ResponseBody
    StateCode comment(@RequestBody Comment comment,@PathVariable int userId ) {
        StateCode stateCode;
        User user = userService.findOne(userId);
        if(user != null) {
            stateCode =  StateCode.buildCode(BizCode.SUCCESS);
            comment.setUser(user);
            commentService.add(comment);
        }else{
            stateCode = StateCode.buildCode(BizCode.FAIL);
        }
        return stateCode;
    }


    /**
     * 删除一个评论
     * @return
     */
    @RequestMapping(value = "/{userId}/comments/{commentId}",method = RequestMethod.DELETE)
    public @ResponseBody
    StateCode deComment(@PathVariable int userId,@PathVariable int commentId) {
        commentService.removeComment(commentId);
        return StateCode.buildCode(BizCode.SUCCESS);
    }


}
