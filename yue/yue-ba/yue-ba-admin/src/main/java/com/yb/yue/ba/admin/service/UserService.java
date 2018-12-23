package com.yb.yue.ba.admin.service;

import com.yb.yue.ba.admin.abstracts.BaseCrudService;
import com.yb.yue.ba.admin.entity.User;

import java.util.List;

public interface UserService extends BaseCrudService<User> {


    List<User> getFriends(Long id);

    /**
     * 瀑布流的分页查询
     * @param start
     * @param length
     * @return
     */
    public List<User> show(int start, int length);

    /**
     * 查重
     * @param user
     * @return
     */
    Integer countByItems(User user);

}
