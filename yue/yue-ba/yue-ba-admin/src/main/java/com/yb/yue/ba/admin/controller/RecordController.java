package com.yb.yue.ba.admin.controller;

import com.yb.yue.ba.admin.abstracts.AbstractBaseController;
import com.yb.yue.ba.admin.entity.Record;
import com.yb.yue.ba.admin.service.RecordService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/record")
public class RecordController extends AbstractBaseController<Record, RecordService> {

    @ResponseBody
    @PostMapping(value = "/list")
    public List<Record> records(Long uid,Long friendId){
        Record record = new Record();
        record.setSenderId(uid);
        record.setReceiverId(friendId);
        List<Record> recordList = service.getRecordList(record);
        return recordList;
    }


    @ResponseBody
    @PostMapping(value = "/save")
    public void save(Long senderId,Long recevierId ,String message){
        System.out.println(senderId);
        System.out.println(recevierId);
        Record record = new Record();
        record.setSenderId(senderId);
        record.setReceiverId(recevierId);
        record.setMessage(message);
        service.save(record);
    }

}
