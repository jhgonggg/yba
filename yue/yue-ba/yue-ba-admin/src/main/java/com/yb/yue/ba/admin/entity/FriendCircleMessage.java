package com.yb.yue.ba.admin.entity;

import com.yb.yue.ba.admin.abstracts.AbstractBaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;

/**
 * 保存用户发表的朋友圈信息
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class FriendCircleMessage extends AbstractBaseEntity {
    /**
     * 用户id
     */
    private Long uid;
    /**
     * 发表的朋友圈内容 mb4utf-8
     */
    private String content;
    /**
     * 图片地址
     */
    private String picture;
    /**
     * 发表地址
     */
    private String location;
    /**
     * 点赞数
     */
    private int praiseNum;
    /**
     * 用户名
     */
    @Transient
    private String uname;
    /**
     * 用户头像
     */
    @Transient
    private String image;
}
