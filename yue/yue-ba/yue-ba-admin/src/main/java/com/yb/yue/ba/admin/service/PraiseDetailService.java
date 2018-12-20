package com.yb.yue.ba.admin.service;

import com.yb.yue.ba.admin.abstracts.BaseCrudService;
import com.yb.yue.ba.admin.entity.PraiseDetail;

/**
 * 点赞业务接口
 */
public interface PraiseDetailService extends BaseCrudService<PraiseDetail> {
    /**
     *  点击朋友圈赞时事件
     * @param praiseUid 点赞用户id
     * @param fcmId 朋友圈id
     */
    void ClickPraise(Long praiseUid, Long fcmId);
}
