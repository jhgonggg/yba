package com.yb.yue.ba.admin.dto;
import com.yb.yue.ba.admin.abstracts.AbstractBaseEntity;
import lombok.Data;
import java.util.List;
/**
 * 数据传输对象包下 用来保存分页ajax请求后返回的数据
 * @param <T>
 */
@Data
public class PageInfo<T extends AbstractBaseEntity>{
    /**
     * 保证返回的数据到同一请求
     */
    private int draw;
    /**
     * 分页的总数
     */
    private int recordsTotal;
    /**
     * 过滤后的分页总数
     */
    private int recordsFiltered;
    /**
     * 保存数据的集合
     */
    private List<T> data;
    /**
     * 错误提示信息(可选)
     */
    private String error;
}
