package com.yb.yue.ba.admin.controller;


import com.yb.yue.ba.admin.abstracts.AbstractBaseController;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "user")
public class UserController extends AbstractBaseController<User, UserService> {


    @ResponseBody
    @PostMapping(value = "register")
    public String register(String username, String password, String email, int gender ){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setGender(gender);

        service.save(user);

        System.out.println(user);

        return "111";
    }

    @ResponseBody
    @PostMapping(value = "check")
    public String check(String user_name,String email){
        System.out.println(user_name);
        System.out.println(email);
        return "1";
    }


}
