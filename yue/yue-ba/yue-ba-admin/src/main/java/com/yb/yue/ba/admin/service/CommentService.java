package com.yb.yue.ba.admin.service;

import com.yb.yue.ba.admin.abstracts.BaseCrudService;
import com.yb.yue.ba.admin.entity.Comment;

import java.util.List;

/**
 * 评论业务接口
 */
public interface CommentService extends BaseCrudService<Comment> {
    /**
     * 根据朋友圈id 获取这条朋友圈所有评论
     * @return
     */
    List<Comment> getAllCommentByFcmId(Long fcmid);
}
