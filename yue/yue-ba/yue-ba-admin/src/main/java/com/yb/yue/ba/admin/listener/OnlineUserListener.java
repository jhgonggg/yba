package com.yb.yue.ba.admin.listener;

import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.utils.ServerUtils;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineUserListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {

    }

    public void sessionDestroyed(HttpSessionEvent event){
        //监听Session状态,用户恶意退出,超出session过期时间
        HttpSession session=event.getSession();
        String id=session.getId()+session.getCreationTime();
        User user = (User) session.getAttribute("user");

        //推送离线用户 ID
        ServerUtils.publish(user.getId()+":out");
    }
}