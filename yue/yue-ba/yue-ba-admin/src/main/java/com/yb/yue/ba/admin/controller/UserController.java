package com.yb.yue.ba.admin.controller;


import com.yb.yue.ba.admin.abstracts.AbstractBaseController;
import com.yb.yue.ba.admin.constants.SystemConstants;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.service.UserGoodFriendService;
import com.yb.yue.ba.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;

import java.util.List;

@Controller
@RequestMapping(value = "user")
public class UserController extends AbstractBaseController<User, UserService> {


    /**
     * 前端注册，这里就只插入4个字段
     * @param username
     * @param password
     * @param email
     * @param gender
     * @return
     */

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

    /**
     * 前端校验用户名，邮箱是否重复，目前没有进行判断，直接允许
     * @param user_name
     * @param email
     * @return
     */
    @ResponseBody
    @PostMapping(value = "check")
    public String check(String user_name,String email){
        System.out.println(user_name);
        System.out.println(email);
        return "1";
    }


    /**
     * 瀑布流展示数据
     * @param page
     * @return
     */
    @ResponseBody
    @GetMapping(value = "show")
    public List<User> show(int page, HttpServletRequest request){
        // 根据用户当前性别 搜索对象的性别
        User user = (User) request.getSession().getAttribute(SystemConstants.CACHE_KEY_USER);
        int gender = user.getGender() == 1?0:1;
        // 长度
        int length = 6;
        // 起始位置
        int start = (page-1) * length;

        List<User> show = service.show(start, length);
        System.out.println(page);
        System.out.println(show);
        return show /*"{\n" +
                "\t\"data\": [{\n" +
                "\t\t\"src\": \"3.jpg\"\n" +
                "\t}, {\n" +
                "\t\t\"src\": \"4.jpg\"\n" +
                "\t}, {\n" +
                "\t\t\"src\": \"2.jpg\"\n" +
                "\t}, {\n" +
                "\t\t\"src\": \"5.jpg\"\n" +
                "\t}, {\n" +
                "\t\t\"src\": \"1.jpg\"\n" +
                "\t}, {\n" +
                "\t\t\"src\": \"6.jpg\"\n" +
                "\t}]\n" +
                "}"*/;
    }

}
