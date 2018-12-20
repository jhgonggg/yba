package com.yb.yue.ba.admin.service;

import com.yb.yue.ba.admin.abstracts.BaseCrudService;
import com.yb.yue.ba.admin.entity.UserGoodFriend;

/**
 * 好友关系业务接口
 */
public interface UserGoodFriendService extends BaseCrudService<UserGoodFriend> {
    /**
     * 添加好友
     * @param uid1
     * @param uid2
     */
    void save(Long uid1, Long uid2);
}
