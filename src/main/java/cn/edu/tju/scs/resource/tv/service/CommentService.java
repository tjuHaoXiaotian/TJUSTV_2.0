package cn.edu.tju.scs.resource.tv.service;



import cn.edu.tju.scs.resource.tv.domain.Comment;

import java.util.List;

/**
 * Comment Service Interface
 * Created by jack on 2016/3/28.
 */
public interface CommentService {

    public List<Comment> getAll(int videoId);

    public void add(Comment comment);

    public void removeComment(int commentId);
}
