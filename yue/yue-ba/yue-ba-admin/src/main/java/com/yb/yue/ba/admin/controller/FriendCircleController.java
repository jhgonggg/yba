package com.yb.yue.ba.admin.controller;
import com.yb.yue.ba.admin.abstracts.AbstractBaseController;
import com.yb.yue.ba.admin.commons.BaseResult;
import com.yb.yue.ba.admin.constants.SystemConstants;
import com.yb.yue.ba.admin.entity.Comment;
import com.yb.yue.ba.admin.entity.FriendCircleMessage;
import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.service.CommentService;
import com.yb.yue.ba.admin.service.FriendCircleMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/circle")
public class FriendCircleController extends AbstractBaseController<FriendCircleMessage, FriendCircleMessageService> {

    @Autowired
    private CommentService commentService;
    /**
     * 查看好友朋友圈
     * @return
     */
    @GetMapping(value = "/friend")
    public String friendList(Model model, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(SystemConstants.CACHE_KEY_USER);
        List<FriendCircleMessage> friendMessage = service.getFriendMessageByUid(user.getId());
        setComments(friendMessage);
        model.addAttribute("friendList",friendMessage);
        System.out.println(friendMessage);
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
        setComments(myMessage);
        model.addAttribute("myList",myMessage);
        return "circle/my";
    }

    @PostMapping(value = "/push")
    public String push(FriendCircleMessage friendCircleMessage){
        service.sendFriendMessage(friendCircleMessage);
        return "redirect:/circle/my";
    }

    /**
     * 删除朋友圈
     * @param id 朋友圈id
     * @return
     */
    @ResponseBody
    @PostMapping(value = "/delete/circles")
    public BaseResult deleteFriendCircleMessage(String id){
        BaseResult baseResult=null;
        if(id==null||"".equals(id)){
            baseResult=BaseResult.fail("删除失败");
        }
        else{
            service.delete(Long.parseLong(id));
            baseResult=BaseResult.success("删除成功");
        }
        return baseResult;
    }

    /**
     * 设置朋友圈评论
     * @param Message
     */
    private void setComments( List<FriendCircleMessage> Message){
        for (FriendCircleMessage friendCircleMessage : Message) {
            List<Comment> allCommentByFcmId = commentService.getAllCommentByFcmId(friendCircleMessage.getId());
            friendCircleMessage.setComments(allCommentByFcmId);
        }
    }
}
