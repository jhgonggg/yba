package com.yb.yue.ba.admin.mapper;

import com.yb.yue.ba.admin.abstracts.BaseCrudMapper;
import com.yb.yue.ba.admin.entity.Record;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface RecordMapper extends BaseCrudMapper<Record> {
    /**
     *  获取聊天记录
     * @param record
     * @return
     */
     List<Record> getRecordById(Record record);
}
