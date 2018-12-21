package com.yb.yue.ba.admin.service;

import com.yb.yue.ba.admin.abstracts.BaseCrudService;
import com.yb.yue.ba.admin.entity.User;

import java.util.List;

public interface UserService extends BaseCrudService<User> {

    List<User> getFriends(Long id);
}
