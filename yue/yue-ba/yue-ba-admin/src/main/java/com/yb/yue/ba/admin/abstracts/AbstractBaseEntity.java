package com.yb.yue.ba.admin.abstracts;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;
/**
 * 每个类相同的属性抽取出来
 */
@Data
public abstract class AbstractBaseEntity implements Serializable {
    /**
     * 编辑状态
     */
    public final static int UPDATE=1;
    /**
     * 添加状态
     */
    public final static int ADD=0;

    /**
     * 修改成功
     */
    public final static int MODIFY_SUCCESS=2;
    /**
     * 编号
     */
    private Long id;
    /**
     * 创建时间
     */
    private Date created;
    /**
     * 修改时间
     */
    private Date updated;

    /**
     * 判断是添加还是修改操作 并设置updateDate属性以及createDate属性 每个类都具有的功能
     * true/添加  false/修该
     * @param abstractBaseEntity
     * @return
     */
     public boolean preSave(AbstractBaseEntity abstractBaseEntity) {
        Date date = new Date();
        //设置更新时间
        abstractBaseEntity.setUpdated(date);
        //添加
        if (abstractBaseEntity.getId() == null) {
            //给id没有自增的表设置id为当前时间的秒数
            abstractBaseEntity.setId(System.currentTimeMillis());
            //设置创建时间
            abstractBaseEntity.setCreated(date);
            return true;
        }
        //编辑
        return false;
    }
}
