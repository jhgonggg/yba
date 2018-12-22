package com.yb.yue.ba.admin.entity;

import com.yb.yue.ba.admin.abstracts.AbstractBaseEntity;
import lombok.Data;

@Data
public class UserInfo extends AbstractBaseEntity {

    private Long userId;
    private String profession;
    private String personalSignature;
    private String hobby;


}
