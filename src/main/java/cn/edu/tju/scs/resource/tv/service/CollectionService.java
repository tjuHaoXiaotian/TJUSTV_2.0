package cn.edu.tju.scs.resource.tv.service;

import cn.edu.tju.scs.resource.tv.dao.CollectionDao;
import cn.edu.tju.scs.resource.tv.domain.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 收藏 Service
 * Created by jack on 2016/4/17.
 */


public interface CollectionService {

    public int collect(int userId, int videoId);

    public void deCollect(int collectionId);

    public List<Collection> getAllCollection(int userId);
}
