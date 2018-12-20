package com.yb.yue.ba.admin.interceptor;
import com.yb.yue.ba.admin.constants.SystemConstants;
import com.yb.yue.ba.admin.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 * 登录状态拦截 已登录直接进入首页
 */
public class PermissionInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        User user = (User) request.getSession().getAttribute(SystemConstants.CACHE_KEY_USER);
        if(user!=null){
            response.sendRedirect("/main");
            return false;
        }
        return true;
    }
}
