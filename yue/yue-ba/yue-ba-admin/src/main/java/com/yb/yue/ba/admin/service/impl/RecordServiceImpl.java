package com.yb.yue.ba.admin.service.impl;

import com.google.common.collect.Lists;
import com.yb.yue.ba.admin.abstracts.impl.AbstractBaseCrudServiceImpl;
import com.yb.yue.ba.admin.entity.Record;
import com.yb.yue.ba.admin.mapper.RecordMapper;
import com.yb.yue.ba.admin.service.RecordService;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class RecordServiceImpl extends AbstractBaseCrudServiceImpl<Record, RecordMapper> implements RecordService {


    @Override
    public List<Record> getRecordList(Record record) {

        List<Record> recordList = mapper.getRecordById(record);
        return recordList;
    }
}
