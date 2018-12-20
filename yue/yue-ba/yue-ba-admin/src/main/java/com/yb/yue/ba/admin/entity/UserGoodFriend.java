package com.yb.yue.ba.admin.entity;

import com.yb.yue.ba.admin.abstracts.AbstractBaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 好友关系表
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class UserGoodFriend extends AbstractBaseEntity {
    /**
     * 用户id
     */
    private Long uid;
    /**
     * 好友id
     */
    private Long friendId;
}
