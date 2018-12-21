package com.yb.yue.ba.admin.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MainController {
    /**
     * 进入首页 输入空白时也进入拦截器 登录过就进主页
     * @return
     */
    @RequestMapping(value = {"","/main"})
    public String main(){
        return "main";
    }


    /**
     * 后台首页
     * @return
     */
    @RequestMapping("/back/main")
    public String backMain(){
        return "back/main";
    }
}
