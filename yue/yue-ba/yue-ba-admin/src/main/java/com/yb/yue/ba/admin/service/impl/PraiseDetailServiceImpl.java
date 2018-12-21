package com.yb.yue.ba.admin.service.impl;

import com.google.common.collect.Maps;
import com.yb.yue.ba.admin.abstracts.impl.AbstractBaseCrudServiceImpl;
import com.yb.yue.ba.admin.entity.FriendCircleMessage;
import com.yb.yue.ba.admin.entity.PraiseDetail;
import com.yb.yue.ba.admin.mapper.FriendCircleMessageMapper;
import com.yb.yue.ba.admin.mapper.PraiseDetailMapper;
import com.yb.yue.ba.admin.service.PraiseDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Map;

/**
 * 点赞业务实现类
 */
@Service
@Transactional(readOnly = true)
public class PraiseDetailServiceImpl extends AbstractBaseCrudServiceImpl<PraiseDetail, PraiseDetailMapper> implements PraiseDetailService {
    @Autowired
    private FriendCircleMessageMapper friendCircleMessageMapper;

    /**
     *  点击朋友圈赞时事件
     * @param praiseUid 点赞用户id
     * @param fcmId 朋友圈id
     */
    @Override
    @Transactional(readOnly = false)
    public String ClickPraise(Long praiseUid, Long fcmId) {
        String message=null;
        Map<String,Long> map= Maps.newHashMap();
        map.put("praiseUid",praiseUid);
        map.put("fcmId",fcmId);
        //查询点赞表
        PraiseDetail praiseDetail = mapper.getPraiseDetail(map);
        //获取这条朋友圈
        FriendCircleMessage friendCircleMessage = friendCircleMessageMapper.getById(fcmId);

        //记录不存在 则为点赞行为
        if (praiseDetail==null||"".equals(praiseDetail)){
            praiseDetail=new PraiseDetail();
            praiseDetail.setFcmId(fcmId);
            praiseDetail.setPraiseUid(praiseUid);
            praiseDetail.setCreated(new Date());
            //添加点赞记录
            mapper.insert(praiseDetail);

            //点赞数加1
            friendCircleMessage.setPraiseNum(friendCircleMessage.getPraiseNum()+1);
            message="点赞成功";
        }
        //记录存在 则为取消赞行为
        else{
            //删除点赞表的这条数据
            mapper.deleteById(praiseDetail.getId());
            //点赞数减1
            friendCircleMessage.setPraiseNum(friendCircleMessage.getPraiseNum()-1);
            message="点赞已取消";
        }

        //更新数据库点赞数
        friendCircleMessageMapper.update(friendCircleMessage);
        return message;
    }
}
