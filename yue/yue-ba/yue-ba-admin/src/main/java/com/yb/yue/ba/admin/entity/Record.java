package com.yb.yue.ba.admin.entity;

import com.yb.yue.ba.admin.abstracts.AbstractBaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 聊天记录表：
 *          记录双方好友之间的聊天记录
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Record extends AbstractBaseEntity {

    /**
     * 发送方
     */
    private Long senderId;
    /**
     * 接收方
     */
    private Long receiverId;

    /**
     * 聊天记录
     */
    private  String message;
}
