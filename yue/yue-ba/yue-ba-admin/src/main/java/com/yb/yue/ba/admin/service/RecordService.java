package com.yb.yue.ba.admin.service;


import com.yb.yue.ba.admin.abstracts.BaseCrudMapper;
import com.yb.yue.ba.admin.abstracts.BaseCrudService;
import com.yb.yue.ba.admin.entity.Record;

import java.util.List;

/**
 * 聊天记录业务逻辑接口
 */
public interface RecordService extends BaseCrudService<Record> {

     /**
      * 获取聊天记录
      * @param record
      * @return
      */
     List<Record> getRecordList(Record record);
}
