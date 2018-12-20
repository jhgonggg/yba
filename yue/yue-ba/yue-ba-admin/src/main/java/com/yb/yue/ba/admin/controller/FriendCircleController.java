package com.yb.yue.ba.admin.controller;
import com.yb.yue.ba.admin.abstracts.AbstractBaseController;
import com.yb.yue.ba.admin.constants.SystemConstants;
import com.yb.yue.ba.admin.entity.FriendCircleMessage;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.service.FriendCircleMessageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/circle")
public class FriendCircleController extends AbstractBaseController<FriendCircleMessage, FriendCircleMessageService> {


    /**
     * 查看好友朋友圈
     * @return
     */
    @GetMapping(value = "/friend")
    public String friendList(Model model, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(SystemConstants.CACHE_KEY_USER);
        List<FriendCircleMessage> friendMessage = service.getFriendMessageByUid(user.getId());
        model.addAttribute("friendList",friendMessage);
        return "circle/friend";
    }

    /**
     * 自己朋友圈
     * @return
     */
    @GetMapping(value = "/my")
    public String myList(Model model, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(SystemConstants.CACHE_KEY_USER);
        List<FriendCircleMessage> myMessage = service.getOwnMessageByUid(user.getId());
        model.addAttribute("myList",myMessage);
        return "circle/my";
    }
}
