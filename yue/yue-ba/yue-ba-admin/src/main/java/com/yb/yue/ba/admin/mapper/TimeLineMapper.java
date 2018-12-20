package com.yb.yue.ba.admin.mapper;

import com.yb.yue.ba.admin.abstracts.BaseCrudMapper;
import com.yb.yue.ba.admin.entity.TimeLine;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TimeLineMapper extends BaseCrudMapper<TimeLine> {
    /**
     * 批量添加时间轴
     * @param list 对象集合
     */
    void insert(List<TimeLine> list);
    /**
     * 删除时间轴
     */
    void delete(Long id);

}
