package com.yb.yue.ba.admin.service.impl;
import com.google.common.collect.Lists;
import com.yb.yue.ba.admin.abstracts.impl.AbstractBaseCrudServiceImpl;
import com.yb.yue.ba.admin.entity.FriendCircleMessage;
import com.yb.yue.ba.admin.entity.TimeLine;
import com.yb.yue.ba.admin.mapper.FriendCircleMessageMapper;
import com.yb.yue.ba.admin.mapper.PraiseDetailMapper;
import com.yb.yue.ba.admin.mapper.TimeLineMapper;
import com.yb.yue.ba.admin.mapper.UserGoodFriendMapper;
import com.yb.yue.ba.admin.service.FriendCircleMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Date;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class FriendCircleMessageServiceImpl extends AbstractBaseCrudServiceImpl<FriendCircleMessage, FriendCircleMessageMapper> implements FriendCircleMessageService{
    @Autowired
    private TimeLineMapper timeLineMapper;

    @Autowired
    private UserGoodFriendMapper userGoodFriendMapper;

    @Autowired
    private PraiseDetailMapper praiseDetailMapper;

    /**
     * 获取用户朋友圈
     * @param uid  用户id(用于TimeLine表)
     * @return
     */
    @Override
    public List<FriendCircleMessage> getFriendMessageByUid(Long uid) {
        return mapper.getFriendMessageByUid(uid);
    }

    /**
     * 获取用户自己的朋友圈
     * @param uid 用户id
     * @return
     */
    @Override
    public List<FriendCircleMessage> getOwnMessageByUid(Long uid) {
        return mapper.getOwnMessageByUid(uid);
    }

    /**
     * 发布朋友圈
     * @param friendCircleMessage 用户发布朋友圈的消息
     */
    @Override
    @Transactional(readOnly = false)
    public void sendFriendMessage(FriendCircleMessage friendCircleMessage) {
        //在朋友圈消息表添加该用户发布的朋友圈  添加后自动返回该表的id给该对象
        mapper.insert(friendCircleMessage);

        //查询该用户的所有好友id
        List<Long> friendsId = userGoodFriendMapper.getAllFriends(friendCircleMessage.getUid());

        //在该用户以及所有好友的时间轴表添加消息
        Long fcmid = friendCircleMessage.getId();
        Date date=new Date();
        //保存时间轴的集合
        List<TimeLine> timeLines= Lists.newArrayList();
        //设置用户自己的时间轴
        timeLines.add(createTimeLine(friendCircleMessage.getUid(), fcmid, date, true));
        //设置好友的时间轴
        for (Long fid : friendsId) {
            timeLines.add(createTimeLine(fid,fcmid,date,false));
        }
        //添加进时间轴数据库
        timeLineMapper.insert(timeLines);
    }

    /**
     * 用户删除朋友圈消息
     * @param id 朋友圈id
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(Long id) {
        //先删除朋友圈表中该用户发布的这条消息
        mapper.delete(id);

        //删除该用户这条消息的好友的时间轴
        timeLineMapper.delete(id);

        //根据朋友圈id删除点赞表中的朋友圈记录
        praiseDetailMapper.deleteByFcmId(id);
    }

    /***
     * 创建时间轴方法
     * @param uid 用户id
     * @param fcmid 朋友圈消息id
     * @param date 创建时间
     * @param is_own 是否是自己发布 true/是 false/否
     * @return
     */
    private TimeLine createTimeLine(Long uid,Long fcmid,Date date,boolean is_own){
        TimeLine timeLine=new TimeLine();
        timeLine.setUid(uid);
        timeLine.setFcmid(fcmid);
        timeLine.set_own(is_own);
        timeLine.setCreated(date);
        return timeLine;
    }

}
