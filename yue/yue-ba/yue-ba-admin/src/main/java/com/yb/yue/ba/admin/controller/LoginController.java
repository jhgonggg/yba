package com.yb.yue.ba.admin.controller;
import com.yb.yue.ba.admin.constants.SystemConstants;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.service.ProfileService;
import com.yb.yue.ba.admin.utils.CookieUtils;
import com.yb.yue.ba.admin.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Controller
public class LoginController{

    private static final String COOKIE_NAME="userInfo";

    @Autowired
    private ProfileService profileService;
    /**
     * 进入登录页
     * @return
     * @param request
     */
    @GetMapping(value = "/login")
    public String login(HttpServletRequest request,Model model){
        String value = CookieUtils.getCookieValue(request, COOKIE_NAME);
        if (StringUtils.isNotBlank(value)){
            String loginId=value.split(":")[0];
            String password=value.split(":")[1];
            model.addAttribute("loginId",loginId);
            model.addAttribute("password",password);
        }
        return "login";
    }

    /**
     * 登录验证
     * @param loginId
     * @param password
     * @param remember
     * @param model
     * @param request
     * @return
     */
    @ResponseBody
    @PostMapping(value = "/login")
    public String login(String loginId, String password, String remember, Model model, HttpServletRequest request, HttpServletResponse response){
        User user = profileService.login(loginId, password);
        // 用户名或密码错误
        if(user==null){
            model.addAttribute(SystemConstants.CACHE_KEY_MESSAGE,"用户或密码错误");
            return "0";
        }
        else{
            // 如果是管理员
            if (user.getIsRole() == 1){
                request.getSession().setAttribute("admin",user);
                return "3";
            }
            //勾选记住我 保存Cookie
            if(remember!=null){
                CookieUtils.setCookie(request,response,COOKIE_NAME,String.format("%s:%s",loginId,password),3600*7*24);
            }
            //不记住 如果有对应的Cookie就清除
            else{
                String value = CookieUtils.getCookieValue(request,COOKIE_NAME);
                if(StringUtils.isNotBlank(value)){
                    CookieUtils.deleteCookie(request,response,COOKIE_NAME);
                }
            }
            request.getSession().setAttribute(SystemConstants.CACHE_KEY_USER,user);
            return "1";
        }
    }
    @GetMapping("/back/login")
    public String backLogin(){
        return "back/login";
    }



    /**
     * 注销
     * @param request
     * @return
     */
    @GetMapping(value="/logout")
    public String logout( HttpServletRequest request){
        //清空session
        request.getSession().invalidate();
        return "redirect:/login";
    }



}
