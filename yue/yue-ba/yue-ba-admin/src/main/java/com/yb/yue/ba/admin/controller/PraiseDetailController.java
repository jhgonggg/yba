package com.yb.yue.ba.admin.controller;

import com.yb.yue.ba.admin.abstracts.AbstractBaseController;
import com.yb.yue.ba.admin.commons.BaseResult;
import com.yb.yue.ba.admin.entity.PraiseDetail;
import com.yb.yue.ba.admin.service.PraiseDetailService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/praise")
public class PraiseDetailController extends AbstractBaseController<PraiseDetail, PraiseDetailService> {
    @ResponseBody
    @PostMapping("/love")
    public BaseResult ClickPraise(Long praiseUid,Long fcmId){
        String result = service.ClickPraise(praiseUid, fcmId);
        BaseResult baseResult=BaseResult.success(result);
        return baseResult;
    }
}
