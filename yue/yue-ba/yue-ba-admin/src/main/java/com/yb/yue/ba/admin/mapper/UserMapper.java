package com.yb.yue.ba.admin.mapper;
import com.yb.yue.ba.admin.abstracts.BaseCrudMapper;
import com.yb.yue.ba.admin.entity.User;
import org.springframework.stereotype.Repository;
@Repository
public interface UserMapper extends BaseCrudMapper<User> {
    Integer countByItems(User user);
}
