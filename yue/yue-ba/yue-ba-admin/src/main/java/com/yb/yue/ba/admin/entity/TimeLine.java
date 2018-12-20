package com.yb.yue.ba.admin.entity;

import com.yb.yue.ba.admin.abstracts.AbstractBaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 时间轴表 保存用户发表的朋友圈id 以及用户好友发表的朋友圈id
 * 查看好友朋友圈通过此表查询fcmid
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TimeLine extends AbstractBaseEntity {
    /**
     * 用户id
     */
    private Long uid;
    /**
     * 朋友圈消息id
     */
    private Long fcmid;
    /**
     * 是否为自己发表的朋友圈 true/是  false/否
     */
    private boolean is_own;
}
