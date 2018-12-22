package com.yb.yue.ba.admin.controller;

import com.yb.yue.ba.admin.abstracts.AbstractBaseController;
import com.yb.yue.ba.admin.entity.Comment;
import com.yb.yue.ba.admin.service.CommentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/comment")
public class CommentController extends AbstractBaseController<Comment, CommentService> {
    @ResponseBody
    @PostMapping(value = "/first")
    public String comment(Comment comment){
        comment.setParentCommentId(0L);
        service.save(comment);
        return "1";
    }
}
