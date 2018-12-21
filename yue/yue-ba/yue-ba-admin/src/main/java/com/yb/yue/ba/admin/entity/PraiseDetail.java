package com.yb.yue.ba.admin.entity;

import com.yb.yue.ba.admin.abstracts.AbstractBaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 点赞类 记录点赞的用户与被点赞的朋友圈id
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PraiseDetail extends AbstractBaseEntity {
    /**
     * 点赞的用户的id
     */
    private Long praiseUid;
    /**
     * 这条朋友圈id
     */
    private Long fcmId;
}
