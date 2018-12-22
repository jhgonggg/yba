package com.yb.yue.ba.admin.mapper;

import com.yb.yue.ba.admin.abstracts.BaseCrudMapper;
import com.yb.yue.ba.admin.entity.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 评论访问层接口
 */
@Repository
public interface CommentMapper extends BaseCrudMapper<Comment> {
    /**
     * 根据朋友圈id获取所有父评论
     * @param fcmid  朋友圈id
     * @return
     */
    List<Comment> selectParentCommentByFcmId(Long fcmid);

    /**
     * 根据父评论Id获取所有子评论
     * @param parentCommentId 父评论id
     * @return
     */
    List<Comment> selectChildCommentByParentCommentId(Long parentCommentId);

    /**
     * 删除朋友圈评论
     * @param fcmid
     */
    void delete(Long fcmid);
}
