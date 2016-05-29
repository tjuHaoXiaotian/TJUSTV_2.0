package cn.edu.tju.scs.resource.tv.service;

import cn.edu.tju.scs.resource.tv.domain.Video;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Video Service
 * Created by jack on 2016/3/16.
 */
public interface VideoService {

    /**
     * 查询所有
     * @return List<Video>
     */
    public List<Video> getAll();
    /**
     * 根据关键字 查询所有
     * @param key String
     * @return List<Video>
     */
    public List<Video> getAll(String key);

    /**
     * 根据种类查询所有
     * @param type Integer
     * @return List<Video>
     */
    public List<Video> getAllByType(Integer type);

    /**
     * 根据关键字、种类查询所有
     * @param key String
     * @param type Integer
     * @return List<Video>
     */
    public List<Video> getAllByKeyAndType(String key,Integer type);


    /**
     * 获取所有首页视频
     * @return
     */
    public List<Video> getAllIndex(int index);


    public void setIndex(int videoId);

    public void unSetIndex(int videoId);

    public void setTop(int videoId);


    public Video getVideo(int id);

    public void updateVideo(Video video);

    public void save(Video video);

    public boolean uploadImage(MultipartFile file, String targetDir, String baseUrl);

    public String[] uploadVideo(MultipartFile file, String targetDir, String baseUrl);

    public String[] getVideoPath(int id);

    public boolean deleteVideo(int id);

    public boolean praiseVideo(int id);




}
