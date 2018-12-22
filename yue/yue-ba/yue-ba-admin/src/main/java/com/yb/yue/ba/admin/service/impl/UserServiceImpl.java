package com.yb.yue.ba.admin.service.impl;


import com.google.common.collect.Lists;

import com.google.common.collect.Maps;

import com.yb.yue.ba.admin.abstracts.impl.AbstractBaseCrudServiceImpl;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.entity.UserInfo;
import com.yb.yue.ba.admin.mapper.UserGoodFriendMapper;
import com.yb.yue.ba.admin.mapper.UserInfoMapper;
import com.yb.yue.ba.admin.mapper.UserMapper;
import com.yb.yue.ba.admin.service.UserService;
import com.yb.yue.ba.admin.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;


import java.util.ArrayList;
import java.util.List;

import java.util.List;
import java.util.Map;



@Service
public class UserServiceImpl extends AbstractBaseCrudServiceImpl<User, UserMapper> implements UserService {

    @Autowired
    private UserGoodFriendMapper userGoodFriendMapper;

    @Autowired
    private UserInfoMapper userInfoMapper;

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
            // 添加 yb_user 表
            mapper.insert(user);
            user.getUserInfo().setUserId(user.getId());
            user.getUserInfo().setCreated(user.getCreated());
            user.getUserInfo().setUpdated(user.getUpdated());
            userInfoMapper.insert(user.getUserInfo());
            return User.ADD;
        }
        //编辑
        else {
            // 更新 yb_user 表
            mapper.update(user);
            user.getUserInfo().setUserId(user.getId());
            user.getUserInfo().setCreated(user.getCreated());
            user.getUserInfo().setUpdated(user.getUpdated());
            // 更新 yb_user_info 表
            userInfoMapper.update(user.getUserInfo());
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
    /**
     * 瀑布流的分页查询
     * @param start
     * @param length
     * @return
     */
    @Override
    public List<User> show(int start, int length) {
        Map<String,Object> map= Maps.newHashMap();
        map.put("start",start);
        map.put("length",length);
        return mapper.page(map);

    }
}
