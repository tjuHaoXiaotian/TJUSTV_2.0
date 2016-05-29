package cn.edu.tju.scs.resource.tv.service.impl;

import cn.edu.tju.scs.resource.tv.dao.CollectionDao;
import cn.edu.tju.scs.resource.tv.domain.Collection;
import cn.edu.tju.scs.resource.tv.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 收藏 ServiceImpl
 * Created by jack on 2016/4/17.
 */

@Service("collectionService")
public class CollectionServiceImpl implements CollectionService{
    @Autowired
    CollectionDao collectionDao;



    @Override
    public int collect(int userId, int videoId) {
        Collection collection = new Collection(userId,videoId);
        collectionDao.save(collection);
        return collection.getCollectionId();
    }


    @Override
    public void deCollect(int collectionId) {
        collectionDao.deleteById(collectionId);
    }

    @Override
    public List<Collection> getAllCollection(int userId) {
        return collectionDao.getListByHQL("from Collection where userId = ?", userId);
    }

}
