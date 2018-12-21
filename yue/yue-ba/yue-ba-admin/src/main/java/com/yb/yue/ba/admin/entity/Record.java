package com.yb.yue.ba.admin.entity;

import com.yb.yue.ba.admin.abstracts.AbstractBaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;

/**
 * 聊天记录表：
 *          记录双方好友之间的聊天记录
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Record extends AbstractBaseEntity {

    /**
     * 发送方 ID
     */
    private Long senderId;
    /**
     * 接收方 ID
     */
    private Long receiverId;



    /**
     * 聊天记录
     */
    private  String message;
    /**
     * 发送方 名字
     */

    @Transient
    private String senderName;
    /**
     * 接收方 名字
     */
    @Transient
    private String receiverName;
}
