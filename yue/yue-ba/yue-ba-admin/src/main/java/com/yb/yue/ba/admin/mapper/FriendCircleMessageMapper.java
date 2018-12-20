package com.yb.yue.ba.admin.mapper;

import com.yb.yue.ba.admin.abstracts.BaseCrudMapper;
import com.yb.yue.ba.admin.entity.FriendCircleMessage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FriendCircleMessageMapper extends BaseCrudMapper<FriendCircleMessage>{
    /**
     * 获取该用户的朋友圈消息接口
     * @param id 该用户id
     * @return
     */
    List<FriendCircleMessage> getFriendMessageByUid(Long id);

    /**
     * 用户根据朋友圈id删除朋友圈消息
     */
    void delete(Long id);

    /**
     * 通过用户id获取自己的朋友圈
     * @param id 用户id
     * @return
     */
    List<FriendCircleMessage> getOwnMessageByUid(Long id);
}
