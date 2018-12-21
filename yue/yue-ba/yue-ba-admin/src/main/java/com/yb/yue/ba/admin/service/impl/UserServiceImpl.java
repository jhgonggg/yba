package com.yb.yue.ba.admin.service.impl;

import com.yb.yue.ba.admin.abstracts.impl.AbstractBaseCrudServiceImpl;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.mapper.UserMapper;
import com.yb.yue.ba.admin.service.UserService;
import com.yb.yue.ba.admin.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.text.SimpleDateFormat;
import java.util.Date;


@Service
public class UserServiceImpl extends AbstractBaseCrudServiceImpl<User, UserMapper> implements UserService {
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
}
