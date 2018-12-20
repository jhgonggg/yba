package com.yb.yue.ba.admin.service.impl;

import com.yb.yue.ba.admin.abstracts.impl.AbstractBaseCrudServiceImpl;
import com.yb.yue.ba.admin.entity.TimeLine;
import com.yb.yue.ba.admin.mapper.TimeLineMapper;
import com.yb.yue.ba.admin.service.TimeLineService;
import org.springframework.stereotype.Service;

/**
 * 时间轴业务实现类
 */
@Service
public class TimeLineServiceImpl extends AbstractBaseCrudServiceImpl<TimeLine, TimeLineMapper> implements TimeLineService {
}
