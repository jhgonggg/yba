package com.yb.yue.ba.admin.entity;

import com.yb.yue.ba.admin.abstracts.AbstractBaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;
import java.util.List;

/**
 * 评论类
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Comment extends AbstractBaseEntity {
    private Long fcmid;//朋友圈id
    private Long parentCommentId;// 父评论id
    private Long commentatorId;// 评论人的id
    private String content;// 评论内容

    // =================================
    @Transient
    private List<Comment> replyComment; // 评论回复信息集合
    @Transient
    private User customer;// 评论人
    @Transient
    private User replyCustomer; // 回复评论的人

}
