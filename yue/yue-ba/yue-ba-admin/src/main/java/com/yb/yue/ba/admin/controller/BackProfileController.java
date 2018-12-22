package com.yb.yue.ba.admin.controller;

import com.yb.yue.ba.admin.constants.SystemConstants;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.service.ProfileService;
import com.yb.yue.ba.admin.utils.BeanUtils;
import com.yb.yue.ba.admin.validator.BeanValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "back/profile")
public class BackProfileController  {

    @Autowired
    private ProfileService profileService;

    /**
     * 跳转个人信息页
     *
     * @return
     */
    @GetMapping(value = "info")
    public String info() {
        return "back/profile/info";
    }

    /**
     * 保存管理员的个人信息
     *
     * @return
     */
    @PostMapping(value = "save")
    public String save(User user, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        String result = BeanValidator.validator(user);

        // 验证失败
        if (result != null) {
            redirectAttributes.addFlashAttribute(SystemConstants.CACHE_KEY_MESSAGE, result);
        }

        // 验证成功
        else {
            // 保存个人信息
            profileService.save(user);

            // 将更新信息放入 session
            User sessionUser = (User) request.getSession().getAttribute("admin");
            BeanUtils.copyPropertiesIgnoreNull(user, sessionUser);
            request.getSession().setAttribute("admin", sessionUser);
            redirectAttributes.addFlashAttribute(SystemConstants.CACHE_KEY_MESSAGE, "保存个人信息成功");
        }

        return "redirect:/back/profile/info";
    }


    /**
     * 修改密码
     *
     * @param user
     * @param redirectAttributes
     * @return
     */
    @PostMapping("modify/password")
    public String modifyPwd(User user, RedirectAttributes redirectAttributes ) {
        boolean flag = true;

        int result = profileService.modifyPwd(user);
        if(result== User.CHECK_OLD_PASSWORD_FAIL){
            flag = false;
            redirectAttributes.addFlashAttribute(SystemConstants.CACHE_KEY_MESSAGE, "旧密码错误，请重新输入");
        } else if (result == User.CHECK_NEW_OLD_FAIL) {
            flag = false;
            redirectAttributes.addFlashAttribute(SystemConstants.CACHE_KEY_MESSAGE, "新密码不符合规范，请重新输入");
        } else {
            redirectAttributes.addFlashAttribute(SystemConstants.CACHE_KEY_MESSAGE, "密码修改成功");
        }
        if (flag) {
            return "redirect:/back/profile/info";
        } else {
            return "redirect:/back/profile/info#tab_1_3";
        }
    }
}
