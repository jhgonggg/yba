package com.yb.yue.ba.admin.service.impl;

import com.google.common.collect.Lists;
import com.yb.yue.ba.admin.abstracts.impl.AbstractBaseCrudServiceImpl;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.mapper.UserGoodFriendMapper;
import com.yb.yue.ba.admin.mapper.UserMapper;
import com.yb.yue.ba.admin.service.UserService;
import com.yb.yue.ba.admin.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.ArrayList;
import java.util.List;


@Service
public class UserServiceImpl extends AbstractBaseCrudServiceImpl<User, UserMapper> implements UserService {

    @Autowired
    private UserGoodFriendMapper userGoodFriendMapper;

    /**
     * 重写基类的保存方法，在原有的基础上添加密码加密方法
     * @param user
     * @return
     */
    @Override
    public int save(User user) {
        String password = null;
        // 加密
        if (StringUtils.isNoneBlank(user.getPassword())){
            password = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
            user.setPassword(password);
        }

        //添加
        if(user.preSave(user)){
            mapper.insert(user);
            return User.ADD;
        }
        //编辑
        else {
            mapper.update(user);
        }
        return User.UPDATE;

    }


    /**
     * 获取指定用户的好友
     * @param id 用户 ID
     * @return
     */
    public List<User>  getFriends(Long id){
        //创建存储好友的集合
        List<User> friendList = Lists.newArrayList();
        //获取所有好友的 ID
        List<Long> friendIds = userGoodFriendMapper.getAllFriends(id);

        //判断是否有好友
        if(friendIds.size() == 0){
            return  null;
        }

        //遍历得到所有好友
        for (Long friendId : friendIds) {
            friendList.add( mapper.getById(friendId));
        }

        return friendList;
    }
}
