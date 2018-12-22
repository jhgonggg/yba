package com.yb.yue.ba.admin.service.impl;

import com.yb.yue.ba.admin.abstracts.impl.AbstractBaseCrudServiceImpl;
import com.yb.yue.ba.admin.entity.UserInfo;
import com.yb.yue.ba.admin.mapper.UserInfoMapper;
import com.yb.yue.ba.admin.service.UserInfoService;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl extends AbstractBaseCrudServiceImpl<UserInfo, UserInfoMapper> implements UserInfoService {
}
