package com.yb.yue.ba.admin.mapper;
import com.yb.yue.ba.admin.abstracts.BaseCrudMapper;
import com.yb.yue.ba.admin.entity.UserGoodFriend;
import java.util.List;

/**
 * 好友关系表接口
 */
public interface UserGoodFriendMapper extends BaseCrudMapper<UserGoodFriend> {
    /**
     * 通过用户id获取该用户所有好友的id集合
     * @return
     */
    List<Long> getAllFriends(Long id);

}
