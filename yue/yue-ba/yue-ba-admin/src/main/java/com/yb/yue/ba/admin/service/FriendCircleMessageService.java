package com.yb.yue.ba.admin.service;
import com.yb.yue.ba.admin.abstracts.BaseCrudService;
import com.yb.yue.ba.admin.entity.FriendCircleMessage;
import java.util.List;

/**
 * 朋友圈业务接口
 */
public interface FriendCircleMessageService extends BaseCrudService<FriendCircleMessage> {
    /**
     * 获取用户朋友圈
     * @param uid  用户id
     * @return
     */
    List<FriendCircleMessage> getFriendMessageByUid(Long uid);

    /**
     * 获取自己发布的朋友圈
     * @param uid 用户id
     * @return
     */
    List<FriendCircleMessage> getOwnMessageByUid(Long uid);

    /**
     * 发布朋友圈
     * @param friendCircleMessage 用户发布朋友圈的消息
     */
    void sendFriendMessage(FriendCircleMessage friendCircleMessage);

    /**
     * 用户删除朋友圈
     * @param id
     */
    void delete(Long id);
}
