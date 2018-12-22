package com.yb.yue.ba.admin.mapper;
import com.yb.yue.ba.admin.abstracts.BaseCrudMapper;
import com.yb.yue.ba.admin.entity.User;
import org.springframework.stereotype.Repository;
@Repository
public interface UserMapper extends BaseCrudMapper<User> {
        //删除单个
        void delOne(String id);
}
