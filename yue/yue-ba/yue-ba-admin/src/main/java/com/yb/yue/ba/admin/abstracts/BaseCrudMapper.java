package com.yb.yue.ba.admin.abstracts;
import java.util.List;
import java.util.Map;
/**
 *  mapper公共的方法
 * @param <T> mapper接口泛型
 */
public interface BaseCrudMapper<T extends AbstractBaseEntity> {
    /**
     * 根据loginId获取实例
     * @param entity
     * @return
     */
    public T login(T entity);
    /**
     * 通过id获取实例
     * @param id
     * @return
     */
    public T getById(Long id);

    /**
     * 分页
     * @param params 需要2参数 start/数据的起始位置  length/每页的数据数
     *               如需模糊查询 则还需要entity对象传入参数给mapper
     * @return
     */
    public List<T> page(Map<String, Object> params);

    /**查询总条数
     * @param  entity 模糊查询时的对象
     * @return
     */
    public int count(T entity);

    /**
     * 修改信息
     * @param entity
     */
    public void update(T entity);

    /**
     * 添加
     */
    public void insert(T entity);

    /**
     * 批量删除
     * @param array
     */
    public void delete(String array[]);

    /**
     * 查询所有数据
     * @return
     */
    public List<T> selectAll();
}

