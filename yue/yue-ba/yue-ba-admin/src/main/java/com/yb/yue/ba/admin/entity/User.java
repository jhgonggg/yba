package com.yb.yue.ba.admin.entity;

import com.alibaba.druid.sql.visitor.functions.Char;
import com.yb.yue.ba.admin.abstracts.AbstractBaseEntity;
import com.yb.yue.ba.admin.utils.RegexpUtils;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = false)
//只提供无参构造
public class User extends AbstractBaseEntity {
    /**
     * 旧密码错误
     */
    public final static int CHECK_OLD_PASSWORD_FAIL=0;
    /**
     * 新密码与旧密码一致
     */
    public final static int CHECK_NEW_OLD_FAIL=1;

    @Length(min = 2, max = 6, message = "用户长度必须介于2-6位之间")
    private String username;
    @Pattern(regexp = RegexpUtils.EMAIL,message = "邮箱格式不正确")
    private String email;
    @Pattern(regexp = RegexpUtils.PHONE,message = "手机号格式不正确")
    private String phone;
    @Pattern(regexp = RegexpUtils.PASSWORD,message = "密码格式不正确，请输入6-16位字母数字或下划线")
    private String password;
    /**
     * 性别
     */
    private Integer gender;
    private Date birth;
    private String picture;
    private String location;

    // 判断是否为管理员 1->管理员  0->普通用户
    @Transient
    private Integer isRole;
    //------------------------扩展的属性 用于修改密码时---------------------------
    //实体bean中默认所有的字段都会被映射到数据库中，如果某个属性不想被映射到数据库中@Transient 依赖persistence-api
    @Transient
    @NotBlank(message ="原密码不能为空")
    private String oldPwd;

    @Transient
    //分组 只验证组内属性
    @Pattern(regexp = RegexpUtils.PASSWORD,message="新密码格式不正确，请输入6-16位字母数字或下划线")
    private String newPwd;
}