package com.yb.yue.ba.admin.interceptor;
import com.yb.yue.ba.admin.constants.SystemConstants;
import com.yb.yue.ba.admin.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 * 未登录状态拦截 只能进入登录
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    //处理请求前执行 true代表放行 false代表拦截
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        //判断是否登录 否则跳转登录 利用session判断
        // 之所以有session 是因为Cookie  当请求的时候http是无状态的 通过session来代替cookie
        User user = (User) request.getSession().getAttribute(SystemConstants.CACHE_KEY_USER);
        User admin = (User) request.getSession().getAttribute("admin");

        if (admin != null){
            return true;
        }

         if(user != null){
             return true;
         }


         else{

             if(admin==null){
                 response.sendRedirect("/back/login");
                 return false;
             }
             response.sendRedirect("/login");
             return false;
         }



    }

    @Override
    //请求处理完执行
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws IOException {

    }

    @Override
    //逻辑视图处理完执行
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

    }
}
