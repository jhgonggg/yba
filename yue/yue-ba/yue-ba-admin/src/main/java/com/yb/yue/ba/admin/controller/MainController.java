package com.yb.yue.ba.admin.controller;
import com.yb.yue.ba.admin.abstracts.AbstractBaseController;
import com.yb.yue.ba.admin.constants.SystemConstants;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.service.UserService;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MainController extends AbstractBaseController<User, UserService> {
    /**
     * 进入首页 输入空白时也进入拦截器 登录过就进主页
     * @return
     */
    @RequestMapping(value = {"","/main"})
    public String main(HttpServletRequest request, Model model){

        // 根据用户当前性别 搜索对象的性别
        User user = (User) request.getSession().getAttribute(SystemConstants.CACHE_KEY_USER);
        int gender = user.getGender() == 1?0:1;
        // 当前页
        int page = 1;
        // 长度
        int length = 6;
        // 起始位置
        int start = (page-1)*6;

        List<User> show = service.show(start, length);

        model.addAttribute("show",show);

        return "main";
    }
    @GetMapping("back/main")
    public String backMain(){
        return "back/main";
    }
}
