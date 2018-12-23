package com.yb.yue.ba.admin.service.impl;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.mapper.UserMapper;
import com.yb.yue.ba.admin.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.Date;

@Service
@Transactional(readOnly = true)
public class ProfileServiceImpl implements ProfileService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 登录验证
     * @param loginId
     * @param password
     * @return
     */
    @Override
    public User login(String loginId, String password) {
        User params=new User();
        //用户名 邮箱 电话 都可当成账号
        params.setUsername(loginId);
        params.setEmail(loginId);
        params.setPhone(loginId);

        User user = userMapper.login(params);
        /*密码加密*/
        String Md5password = DigestUtils.md5DigestAsHex(password.getBytes());
        //先通过账号获取用户 再验证密码 一般加密验证 安全
        if(user!=null){
            if(Md5password .equals(user.getPassword())){
                return user;
            }
        }
        return null;
    }
    /**
     * 保存信息
     * @param user
     */
    @Override
    @Transactional(readOnly = false)
    public void save(User user) {
        user.setUpdated(new Date());
        //编辑
        userMapper.update(user);
    }

    /**
     * 修改密码
     * @param user
     * @return 0/旧密码错误  1/新密码不符合规范 2/修改成功 为了避免数字忘记注释 将数字的意思抽取成常量 用户独有
     */
    @Override
    @Transactional(readOnly = false)
    public int modifyPwd(User user) {
        //根据id获取用户实例
        User profile = userMapper.getById(user.getId());
        //获取输入的旧密码 加密后
        String password = DigestUtils.md5DigestAsHex(user.getOldPwd().getBytes());
        //验证旧密码
        if (!profile.getPassword().equals(password)){
            return User.CHECK_OLD_PASSWORD_FAIL;
        }
        //新密码与旧密码一致
        if (user.getNewPwd().equals(user.getOldPwd())){
            return User.CHECK_NEW_OLD_FAIL;
        }
        //新密码加密设置进用户实例中
        profile.setPassword(DigestUtils.md5DigestAsHex(user.getNewPwd().getBytes()));
        profile.setUpdated(new Date());
        //修改原密码
        userMapper.update(profile);
        return User.MODIFY_SUCCESS;
    }

}
