package com.yb.yue.ba.admin.mapper;

import com.yb.yue.ba.admin.abstracts.BaseCrudMapper;
import com.yb.yue.ba.admin.entity.PraiseDetail;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface PraiseDetailMapper extends BaseCrudMapper<PraiseDetail> {
    /**
     * 取消点赞 找到了这条记录时删除这条记录 通过这条记录id
     * @param id 点赞表id
     */
    void deleteById(Long id);

    /* 当删除朋友圈时 删除点赞表记录 根据朋友圈id
     * @param id 朋友圈id
     */
    void deleteByFcmId(Long id);

    /**
     * 根据朋友圈id与点赞用户id 获取点赞对象
     * @param map  保存朋友圈id与点赞用户id
     * @return
     */
    PraiseDetail getPraiseDetail(Map<String,Long> map);

}
