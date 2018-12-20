package com.yb.yue.ba.admin.service.impl;

import com.google.common.collect.Lists;
import com.yb.yue.ba.admin.abstracts.impl.AbstractBaseCrudServiceImpl;
import com.yb.yue.ba.admin.entity.FriendCircleMessage;
import com.yb.yue.ba.admin.entity.TimeLine;
import com.yb.yue.ba.admin.entity.UserGoodFriend;
import com.yb.yue.ba.admin.mapper.FriendCircleMessageMapper;
import com.yb.yue.ba.admin.mapper.TimeLineMapper;
import com.yb.yue.ba.admin.mapper.UserGoodFriendMapper;
import com.yb.yue.ba.admin.service.UserGoodFriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 好友关系业务实现类
 */
@Service
@Transactional(readOnly = true)
public class UserGoodFriendServiceImpl extends AbstractBaseCrudServiceImpl<UserGoodFriend, UserGoodFriendMapper> implements UserGoodFriendService {
    @Autowired
    private FriendCircleMessageMapper friendCircleMessageMapper;
    @Autowired
    private TimeLineMapper timeLineMapper;
    @Autowired
    private UserGoodFriendMapper userGoodFriendMapper;
    /**
     * 添加好友
     * 将id小的做为uid
     * id大的做为friendId
     * @param uid1
     * @param uid2
     */
    @Override
    @Transactional(readOnly = false)
    public void save(Long uid1, Long uid2) {
        UserGoodFriend userGoodFriend=new UserGoodFriend();
        //如果uid1<uid2
        if(uid1.longValue()<uid2.longValue()){
            userGoodFriend.setUid(uid1);
            userGoodFriend.setFriendId(uid2);
        }
        //uid1>uid2
        else{
            userGoodFriend.setUid(uid2);
            userGoodFriend.setFriendId(uid1);
        }
        userGoodFriend.setCreated(new Date());
        userGoodFriend.setUpdated(new Date());
        //将用户id1与id2添加进好友表
        userGoodFriendMapper.insert(userGoodFriend);
        //分别获取uid1与uid2发布的朋友圈
        List<FriendCircleMessage> ownMessage1 = friendCircleMessageMapper.getOwnMessageByUid(uid1);
        List<FriendCircleMessage> ownMessage2 = friendCircleMessageMapper.getOwnMessageByUid(uid2);
        //将uid1发布的朋友圈添加到uid2的时间轴
        List<TimeLine> timeLineList= Lists.newArrayList();
        addTimeLine(timeLineList,ownMessage1,uid2);
        //将uid2发布的朋友圈添加到uid1的时间轴
        addTimeLine(timeLineList,ownMessage2,uid1);
        timeLineMapper.insert(timeLineList);
    }

    /**
     * 添加时间轴方法
     * @param list 目标集合
     * @param messageId 用户发布的朋友圈的消息id
     * @param uid 用户id
     */
    private void addTimeLine(List<TimeLine> list,List<FriendCircleMessage> messageId,Long uid){
        for (FriendCircleMessage ownMessage : messageId) {
            TimeLine timeLine=new TimeLine();
            timeLine.setUid(uid);
            timeLine.set_own(false);
            timeLine.setCreated(new Date());
            timeLine.setFcmid(ownMessage.getId());
            list.add(timeLine);
        }
    }
}
