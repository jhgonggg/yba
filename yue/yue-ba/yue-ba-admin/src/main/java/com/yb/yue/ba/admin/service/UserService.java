package com.yb.yue.ba.admin.service;

import com.yb.yue.ba.admin.abstracts.BaseCrudService;
import com.yb.yue.ba.admin.entity.User;

import java.util.List;

public interface UserService extends BaseCrudService<User> {


    List<User> getFriends(Long id);

    /**
     * 瀑布流的分页查询
     * @param allFriends 好友的 ID 集合，在首页中不展示，所以过滤掉
     * @param gender 根据性别来查询展示陌生人
     * @param start
     * @param length
     * @return
     */
    public List<User> show(List<Long> allFriends, Integer gender, int start, int length);

    /**
     * 查重
     * @param user
     * @return
     */
    Integer countByItems(User user);

     /** 删除单个
     */
    public void delOne(String id);
}
