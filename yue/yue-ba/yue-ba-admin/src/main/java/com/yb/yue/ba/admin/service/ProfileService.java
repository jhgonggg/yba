package com.yb.yue.ba.admin.service;
import com.yb.yue.ba.admin.entity.User;
public interface ProfileService {
    /**
     * 登录验证
     * @param loginId
     * @param password
     * @return
     */
    public User login(String loginId, String password);

    /**
     * 保存信息
     * @param user
     */
    public void save(User user);

    /**
     * 修改密码
     * @param user
     * @return
     */
    public int modifyPwd(User user);
}
