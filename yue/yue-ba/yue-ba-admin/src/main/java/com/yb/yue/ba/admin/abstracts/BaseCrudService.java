package com.yb.yue.ba.admin.abstracts;
import com.yb.yue.ba.admin.dto.PageInfo;
import java.util.List;

/**
 * 公共业务接口
 * @param <T>
 */
public interface BaseCrudService<T extends  AbstractBaseEntity> {

    /**
     * 分页  entity/模糊查询传递参数 start/数据其实位置 length/每页数据数 draw/保证请求是同一次
     * @param entity
     * @param start
     * @param length
     * @param draw
     * @return
     */
    public PageInfo page(T entity, int start, int length, int draw);

    /**
     * 通过id获取对象
     * @param id
     * @return
     */
    public T getById(Long id);

    /***
     * 保存信息 --添加/修改
     * @param entity
     */
    public int save(T entity);

    /**
     * 批量删除
     * @param id
     */
    public void delete(String id[]);

    /**
     * 查询所有数据
     * @return
     */
    public List<T> selectAll();
}
