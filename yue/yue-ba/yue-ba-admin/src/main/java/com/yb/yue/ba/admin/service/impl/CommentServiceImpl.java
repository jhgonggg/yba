package com.yb.yue.ba.admin.service.impl;

import com.google.common.collect.Lists;
import com.yb.yue.ba.admin.abstracts.impl.AbstractBaseCrudServiceImpl;
import com.yb.yue.ba.admin.entity.Comment;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.mapper.CommentMapper;
import com.yb.yue.ba.admin.mapper.UserMapper;
import com.yb.yue.ba.admin.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 评论业务实现
 */
@Service
@Transactional(readOnly = true)
public class CommentServiceImpl extends AbstractBaseCrudServiceImpl<Comment, CommentMapper> implements CommentService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 根据朋友圈id 获取这条朋友圈所有评论
     * @return
     */
    @Override
    public List<Comment> getAllCommentByFcmId(Long fcmid) {
        //所有父评论
        List<Comment> comments = mapper.selectParentCommentByFcmId(fcmid);
        for (Comment comment : comments) {
            //回复集合
            List<Comment> replys= Lists.newArrayList();
            //设置评论的回复集合
            comment.setReplyComment(replys);
            //获取评论人的Id
            Long commentatorId = comment.getCommentatorId();
            //设置评论人姓名
            comment.setCustomer(userMapper.getById(commentatorId));
            //构建评论与回复评论的关系
            buildReplyComment(comment, replys);
        }
        return comments;
    }

    /**
     * 构建评论与回复评论的关系
     * @param comment
     * @param replys
     */
    private void buildReplyComment(Comment comment,List<Comment> replys){
        // 获取评论的所有回复
        List<Comment> replyComments = mapper.selectChildCommentByParentCommentId(comment.getId());
        // 把所有的回复添加到评论实例化的回复集合中
        replys.addAll(replyComments);
        for(Comment c : replyComments){ // 遍历回复中的回复
            // 获取回复人的id
            Long customerId = c.getCommentatorId();
            //获取回复人姓名
            User replyCustomer = userMapper.getById(customerId);
            //获取评论人信息
            User customer= userMapper.getById(comment.getCommentatorId());
            c.setCustomer(customer);
            c.setReplyCustomer(replyCustomer);
            buildReplyComment(c, replys);
        }
    }
}
