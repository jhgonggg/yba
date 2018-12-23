package com.yb.yue.ba.admin.controller;

import com.yb.yue.ba.admin.abstracts.AbstractBaseController;
import com.yb.yue.ba.admin.commons.BaseResult;
import com.yb.yue.ba.admin.entity.User;

import com.yb.yue.ba.admin.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("back/user")
public class BackUserController extends AbstractBaseController<User, UserService> {
    /**
     * 管理员管理用户界面
     * @return
     */
    @GetMapping("list")
    public String userList(){
        return "back/user/list";
    }


    @GetMapping("form")
    public String userForm(){
        return "back/user/form";
    }

    /**
     * 保存用户信息，新增或修改
     * @param user
     * @param redirectAttributes
     * @return
     */
    @PostMapping("save")
    public String save(User user, RedirectAttributes redirectAttributes){
        //为真，验证成功
        if(beanValidator(user,redirectAttributes)){

            service.save(user);
            sendMessage(redirectAttributes,"保存用户信息成功");
            return "redirect:/back/user/list";
        }
        //失败
        else{
            return "/back/user/form";
        }
    }

    @GetMapping("delOne")
    public String delOne(String id){
        service.delOne(id);
        return "redirect:/back/user/list";
    }
}
