package com.yb.yue.ba.admin.controller;


import com.yb.yue.ba.admin.abstracts.AbstractBaseController;
import com.yb.yue.ba.admin.constants.SystemConstants;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.service.UserGoodFriendService;
import com.yb.yue.ba.admin.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


import java.text.SimpleDateFormat;
import java.util.Date;


import java.util.List;

@Controller
@RequestMapping(value = "user")
public class UserController extends AbstractBaseController<User, UserService> {

    @Autowired
    private UserGoodFriendService userGoodFriendService;

    /**
     * 格式化 前端表单提交的日期
     * @param binder
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));//true:允许为空, false:不允许为空
    }


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

        // 获取用户的所有好友 ID 的集合
        List<Long> allFriends = userGoodFriendService.getAllFriends(user.getId());
        // 把自己 与 管理员 去除
        allFriends.add(user.getId());
        allFriends.add((long) 1);

        Integer gender = user.getGender() == 1?0:1;
        // 长度
        int length = 6;
        // 起始位置
        int start = (page-1) * length;

        List<User> show = service.show(allFriends, gender, start, length);
        System.out.println(page);
        System.out.println(show);
        return show ;
    }

    /**
     * 个人信息页面的跳转
     * @return
     */
    @GetMapping(value = "profile")
    public String profile(){

        return "/info/profile";
    }

    /**
     * 用户编辑页面的跳转
     */
    @GetMapping(value = "update")
    public String update(){
        return "/info/update";
    }

    /**
     * 用户编辑请求
     * @param user
     * @return
     */
    @PostMapping(value = "save")
    public String save(User user, HttpServletRequest request){
        service.save(user);
        updateSession(user,SystemConstants.CACHE_KEY_USER,request);
        return "/info/profile";
    }

    @GetMapping(value = "info")
    public String info(String id, Model model){
        User user = null;
        if (id != null && id != ""){
            user = service.getById(Long.parseLong(id));
        }
        model.addAttribute("user",user);
        return "info/info";
    }

    @PostMapping(value = "add")
    public String addFriend(Long id, Long uid){
        userGoodFriendService.save(id, uid);
        return "redirect:/main";
    }


}
