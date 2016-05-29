package cn.edu.tju.scs.resource.tv.web.controller;

import cn.edu.tju.scs.oauth2.common.BizCode;
import cn.edu.tju.scs.oauth2.common.StateCode;
import cn.edu.tju.scs.resource.tv.common.Constants;
import cn.edu.tju.scs.resource.tv.common.Type;
import cn.edu.tju.scs.resource.tv.domain.Video;
import cn.edu.tju.scs.resource.tv.service.CommentService;
import cn.edu.tju.scs.resource.tv.service.VideoService;
import cn.edu.tju.scs.resource.tv.util.GetIP;
import cn.edu.tju.scs.oauth2.web.controller.base.BaseController;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.InetAddress;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Video Controller
 * Created by jack on 2016/3/16.
 */
@Controller
@RequestMapping(value = "/videos")
public class VideoController extends BaseController {

    @Autowired
    VideoService videoService;

    @Autowired
    CommentService commentService;

    /**
     * 获取视频列表 html 页面
     * @return html
     */
    @RequestMapping(value = "/videos.html",method = RequestMethod.GET)
    public String getVideosPage(@RequestParam(value = "type",required = false) Integer type,Model model){
        if(type != null){
            model.addAttribute("type",type);
        }
        return "admin/admin-videos";
    }

    /**
     * 访问所有 video
     * @return Json
     */
    @RequestMapping( method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public @ResponseBody
    StateCode getAll(@RequestParam(value = "key",required = false) String key,@RequestParam(value = "type",required = false) Integer type) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        if(key == null || key.equals("")){
            if(type == null){
                stateCode.addData("videos", videoService.getAll());
            }else{
                stateCode.addData("videos", videoService.getAllByType(type));
            }
        }else{
            if(type == null){
                stateCode.addData("videos",videoService.getAll(key));
            }else{
                stateCode.addData("videos", videoService.getAllByKeyAndType(key,type));
            }
        }
        return stateCode;
    }


    /**
     * uplaod 页面
     * @return
     */
    @RequestMapping(value = "/upload.html",method = RequestMethod.GET)
    public String getVideoUploadPage(){
        return "admin/admin-video-upload";
    }

    @RequestMapping("/index.html")
    public String getAdminIndex(){
        return "admin/admin-index-config";
    }

    /**
     * 访问所有 video
     * @return Json
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public @ResponseBody
    StateCode getAllIndex() {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("videos",videoService.getAllIndex(1));
        return stateCode;
    }


    /**
     * 访问一个 video
     * @return
     */
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public @ResponseBody
    StateCode getVideo(@PathVariable int id ) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("video", videoService.getVideo(id));
        return stateCode;
    }

    /**
     * 设为首页大图
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}/setIndex",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public @ResponseBody StateCode setIndex(@PathVariable("id") Integer id){
        videoService.setIndex(id);
        return StateCode.buildCode(BizCode.SUCCESS);
    }

    /**
     * 取消首页大图
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}/unSetIndex",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public @ResponseBody StateCode unSetIndex(@PathVariable("id") Integer id){
        videoService.unSetIndex(id);
        return StateCode.buildCode(BizCode.SUCCESS);
    }

    /**
     * 置顶
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}/setTop",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public @ResponseBody StateCode setTop(@PathVariable("id") Integer id){
        videoService.unSetIndex(id);
        return StateCode.buildCode(BizCode.SUCCESS);
    }

    /**
     * 检查一个 video
     * admin
     * @return
     */
    @RequestMapping(value = "/check/{id}",method = RequestMethod.GET)
    public String checkVideo(@PathVariable int id,Model model) {
        Video video = videoService.getVideo(id);
        if(video != null){
            model.addAttribute("video",video);
            return "admin/admin-video-check";
        }else{
            return "404";
        }
    }


    /**
     * 访问一个 video 的所有评论
     * @return
     */
    @RequestMapping(value = "/{id}/comments",method = RequestMethod.GET)
    public @ResponseBody
    StateCode getVideoComments(@PathVariable int id ) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("comments", commentService.getAll(id));
        return stateCode;
    }

    /**
     * 更新一个 video
     * @return
     */
    @RequestMapping(value="/{id}",method = RequestMethod.PUT)
    public @ResponseBody
    StateCode updateVideoByPut(@RequestBody  Video video,@PathVariable int id){
        {
            // 是不是有必要
            video.setVideoId(id);

        }
        videoService.updateVideo(video);
        return  StateCode.buildCode(BizCode.SUCCESS);
    }



    /**
     * 赞
     * @param id
     * @return
     */
    @RequestMapping(value="/{id}/praise",method= RequestMethod.GET)
    public @ResponseBody
    StateCode praiseVideoByGet(@PathVariable int id) {
        if(videoService.praiseVideo(id))
            return  StateCode.buildCode(BizCode.SUCCESS);
        else {
            StateCode stateCode =  StateCode.buildCode(BizCode.NOTFOUND);
            stateCode.addData("error","赞的视频文件不存在或已被移除");
            return stateCode;
        }

    }




    /**
     * 删除一个 video
     * @param id
     * @return
     * @throws java.io.IOException
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public @ResponseBody
    StateCode delete(@PathVariable("id") int id) throws IOException {
        if (videoService.deleteVideo(id)) {
            return  StateCode.buildCode(BizCode.SUCCESS);
        }else {
            return  StateCode.buildCode(BizCode.FAIL);
        }
    }

    /**
     *  浏览器端的下载文件？？？？？？？？？？？？ 是否多余
     * @param id
     * @param response
     * @return
     * @throws java.io.IOException
     */
    @RequestMapping(value = "/{id}/download", method = RequestMethod.GET)
    public @ResponseBody
    StateCode download(@PathVariable("id") int id,HttpServletResponse response) throws IOException {
        String [] result = videoService.getVideoPath(id);
        if(result == null){
            StateCode stateCode  = StateCode.buildCode(BizCode.FAIL);
            stateCode.addData("error","下载的资源文件不存在");
            return stateCode;
        }else{
            try{
//            // 将正确能识别的中文文件名转成ISO8859-1 编码才可以正确下载

                String fileNameEncode = new String(result[1].getBytes(),"ISO8859-1");

                response.setContentType("application/x-msdownload");

                File file;
                if(Constants.SYSTEM_TYPE.contains("windows")){
                    // 是 windows
                   file =  new File(result[0]+"\\" + result[1]);
                }else{   // 是 linux
                   file = new File(result[0] + "/" + result[1]);
                }
                FileInputStream fileInputStream = new FileInputStream(file);

                response.setHeader("Content-Disposition","attachment;filename=" + fileNameEncode);

                OutputStream outputStream = response.getOutputStream();

                IOUtils.copy(fileInputStream, outputStream);
            }catch (FileNotFoundException e){
                e.printStackTrace();
            }catch (IOException e){
                e.printStackTrace();
            }
            return StateCode.buildCode(BizCode.SUCCESS);
        }

    }

//    /**
//     * 存储 Video 记录
//     * @param video
//     * @return
//     * @throws java.io.IOException
//     */
//    @RequestMapping( method = RequestMethod.POST)
//    public @ResponseBody
//    StateCode upload(@RequestBody Video video) throws IOException {
//        System.out.println("正在上传0");
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd");
//
//        if(video != null){
////            Video video = new Video();
////            video.setName(uploadFileName);
////            video.setDescription("视频文件：" + uploadFileName);
////            video.setPerformer("xx 明星");
////            video.setAlbum("xx 电视剧");
////            video.setPath(results[0]);
////            video.setImagePath(results[1]);
////            video.setSize(file.getSize());
////            video.setDuration(results[2]);
////            video.setType(Type.MUSIC.getType());
////            video.setTargetDir(targetDir);
//
//
//
//            video.setPraise(0);
//            video.setVisitedTimes(0);
//            video.setState(0);
//            videoService.save(video);
//            return  StateCode.buildCode(BizCode.SUCCESS);
//        }else {
//            StateCode stateCode = StateCode.buildCode(BizCode.BADREQUEST);
//            stateCode.addData("error","请填写视频信息");
//            return stateCode;
//        }
//    }
//
//    /**
//     * 上传文件
//     * @param request
//     * @return
//     * @throws java.io.IOException
//     */
//
//    @RequestMapping(value = "upload",method = RequestMethod.POST)
//    public @ResponseBody StateCode uploadFile(MultipartHttpServletRequest request) throws IOException{
//        System.out.println("正在上传1");
//        MultipartFile file = request.getFile("file");
//        if (file == null || file.getSize() < 0) {// step-2 判断file
//            System.out.println("size 为 0");
//            return StateCode.buildCode(BizCode.UPLOADFILENOTFOUND);
//        }
//
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd");
//        String getDateString = sdf.format(new Date());
//
//        String uniqueDir = String.valueOf(System.nanoTime());
//        // 上传视频保存位置
//        String targetDir;
//        String baseUrl;
//        if(Constants.SYSTEM_TYPE.contains("windows")){  // 是 windows
//            targetDir  = "D:\\upload\\video\\" + getDateString +"\\"+ uniqueDir+"\\";
//            baseUrl =Constants.WINDOWS_HTTP+"upload/video/" + getDateString + "/" + uniqueDir;
//        }else{   // 是 linux
//            targetDir = "/alidata/upload/video/" + getDateString +"/"+ uniqueDir;
//            baseUrl =Constants.LINUX_HTTP+"upload/video/" + getDateString + "/" + uniqueDir;
//        }
//
//        System.out.println(targetDir);
//
//
//        // 获取 服务器及app路径 http://localhost:8080/chapter1/
//        // 测试的时候改为 192.168.191.1
//        String realIp = GetIP.getRealIp();
//        System.out.println("realIp is :" + realIp);
//
//        InetAddress addr = InetAddress.getLocalHost();
//        String ip=addr.getHostAddress();//获得本机IP
//        System.out.println("realIp is :" +ip);
//
//
//
//        String uploadFileName = file.getOriginalFilename();
//        // 返回大小为 4的数组，[0] targetDir, [1] video 路径， [2] image 路径， [3] video 的大小
//        String results[] = videoService.uploadVideo(file,targetDir,baseUrl);
//
//        if(results!=null && results.length == 2){
//            StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
//            stateCode.addData("targetDir",results[0]);
//            stateCode.addData("path",results[1]);
//            stateCode.addData("imagePath",results[2]);
//            stateCode.addData("time",results[3]);
//            return stateCode;
//        }else {
//            return StateCode.buildCode(BizCode.FAIL);
//        }
//
//    }

    /**
     * 更新一个 video
     * 假定用户是友好的
     * @return
     */
    @RequestMapping(value="/{id}",method= RequestMethod.POST)
    public @ResponseBody
    StateCode updateVideoByPost(@RequestBody Video video,@PathVariable int id) {
        if(video != null){
            Video videoOld = videoService.getVideo(id);
            videoOld.setName(video.getName());
            videoOld.setDescription(video.getDescription());
            videoOld.setPerformer(video.getPerformer());
            videoOld.setType(video.getType());
            videoOld.setAlbum(video.getAlbum());
            videoService.updateVideo(videoOld);
            return  StateCode.buildCode(BizCode.SUCCESS);
        }else{
            return StateCode.buildCode(BizCode.FAIL);
        }
    }


    /**
     * 上传文件
     * @param request
     * @return
     * @throws java.io.IOException
     */
    @RequestMapping( method = RequestMethod.POST)
    public @ResponseBody
    StateCode upload(MultipartHttpServletRequest request) throws IOException {
        System.out.println("正在上传0");
        Object uploadResult = handler(request);
        if (uploadResult == null) {
            return StateCode.buildCode(BizCode.FAIL);
        }else {
            StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
            stateCode.addData("videoInfo",uploadResult);
            return  stateCode;
        }
    }

    /**
     * 处理上传文件
     * @param request
     * @return
     * @throws java.io.IOException
     */
    public Object handler(MultipartHttpServletRequest request) throws IOException{
        System.out.println("正在上传1");
        MultipartFile file = request.getFile("file");
        if (file == null || file.getSize() < 0) {// step-2 判断file
            System.out.println("size 为 0");
            return null;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd");
        String getDateString = sdf.format(new Date());

        String uniqueDir = String.valueOf(System.nanoTime());
        URL base = this.getClass().getResource("/"); //先获得本类的所在位置，如/home/popeye/testjava/build/classes/net/
        String path = new File(base.getFile(), "..\\"+"upload").getCanonicalPath(); //就可以得到/home/popeye/testjava/name

        System.out.println("得到的位置：" + path);
        // 上传视频保存位置
        String targetDir;
        String baseUrl;
        if(Constants.SYSTEM_TYPE.contains("windows")){  // 是 windows
//            targetDir  = "D:\\upload\\video\\" + getDateString +"\\"+ uniqueDir+"\\";
            targetDir = request.getSession().getServletContext().getRealPath("/resources/upload");
            targetDir+="\\video\\" + getDateString +"\\"+ uniqueDir+"\\";
            baseUrl =Constants.WINDOWS_HTTP+request.getContextPath()+"/resources/upload/video/" + getDateString + "/" + uniqueDir;
        }else{   // 是 linux
            targetDir = "/alidata/upload/video/" + getDateString +"/"+ uniqueDir;
            baseUrl =Constants.LINUX_HTTP+"upload/video/" + getDateString + "/" + uniqueDir;
        }

        System.out.println(targetDir);


        // 获取 服务器及app路径 http://localhost:8080/chapter1/
        // 测试的时候改为 192.168.191.1
        String realIp = GetIP.getRealIp();
        System.out.println("realIp is :" + realIp);

        InetAddress addr = InetAddress.getLocalHost();
        String ip=addr.getHostAddress();//获得本机IP
        System.out.println("realIp is :" +ip);



        String uploadFileName = file.getOriginalFilename();
        // 返回大小为 2 的数组，【0】 video 路径， 【1】 image 路径,[2] 时长
        String results[] = videoService.uploadVideo(file,targetDir,baseUrl);

        if( results!= null){

            // 业务操作,暂时这样----------------------------------------------------
            // 业务操作
            Video video = new Video();
            // 标题
            video.setName(uploadFileName);
            // 简介
            video.setDescription("视频文件：" + uploadFileName);
            // 演员表
            video.setPerformer("xx 明星");
            // 视频合集，专辑，电视剧名
            video.setAlbum("xx 电视剧");
            // 视频归属类别
            video.setType(Type.MUSIC.getType());

            video.setPath(results[0]);
            video.setImagePath(results[1]);
            video.setPraise(0);
//            String current = MyDate.getCurrentTime();
//            video.setCreatetime(Timestamp.valueOf(current));
//            video.setUpdatetime(Timestamp.valueOf(current));
            video.setVisitedTimes(0);
            video.setSize(file.getSize());
            video.setDuration(results[2]);
            video.setTargetDir(targetDir);
            video.setState(0);

            videoService.save(video);
            return video;
        }else{
            return null;
        }
    }



}
