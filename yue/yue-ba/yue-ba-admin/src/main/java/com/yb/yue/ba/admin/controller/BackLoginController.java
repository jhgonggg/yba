package com.yb.yue.ba.admin.controller;

import com.yb.yue.ba.admin.constants.SystemConstants;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class BackLoginController {
    @Autowired
    private ProfileService profileService;

    @PostMapping("/back/login")
    public String backLogin(String loginId, String password, Model model, HttpServletRequest request, HttpServletResponse response) {
        User user = profileService.login(loginId, password);
        // 用户名或密码错误
        if (user == null) {
            model.addAttribute(SystemConstants.CACHE_KEY_MESSAGE, "用户或密码错误");
            return "back/login";
        } else {
            // 如果是管理员
            if (user.getIsRole() == 1) {
                request.getSession().setAttribute("admin", user);
                return "redirect:/back/main";
            }
            else{
                model.addAttribute(SystemConstants.CACHE_KEY_MESSAGE, "没有权限访问");
                return "back/login";
            }
        }
    }

    @GetMapping("/back/login")
    public String backLogin(){
        return "back/login";
    }




    /**
     * 管理员注销
     * @param request
     * @return
     */
    @GetMapping(value="back/logout")
    public String backLogout( HttpServletRequest request){
        //清空session
        request.getSession().invalidate();
        return "redirect:/back/login";
    }
}
