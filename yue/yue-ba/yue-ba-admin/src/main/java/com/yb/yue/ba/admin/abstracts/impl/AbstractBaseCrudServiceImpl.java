package com.yb.yue.ba.admin.abstracts.impl;
import com.google.common.collect.Maps;
import com.yb.yue.ba.admin.abstracts.AbstractBaseEntity;
import com.yb.yue.ba.admin.abstracts.BaseCrudMapper;
import com.yb.yue.ba.admin.abstracts.BaseCrudService;
import com.yb.yue.ba.admin.dto.PageInfo;
import com.yb.yue.ba.admin.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
/**
 * 公共service层的实现类的公共方法的具体实现
 * @param <T> 实体类泛型
 * @param <M> mapper接口类泛型
 */
@Service
@Transactional(readOnly = true)
public abstract class AbstractBaseCrudServiceImpl<T extends AbstractBaseEntity,M extends BaseCrudMapper<T>> implements BaseCrudService<T> {
    @Autowired
    protected M mapper;

    /**
     * 查询所有数据
     * @return
     */
    @Override
    public List<T> selectAll() {
        return mapper.selectAll();
    }

    /**
     * 分页  entity/模糊查询传递参数 start/数据其实位置 length/每页数据数 draw/保证请求是同一次
     * @param entity
     * @param start
     * @param length
     * @param draw
     * @return
     */
    @Override
    public PageInfo page(T entity, int start, int length, int draw) {
        Map<String,Object> map= Maps.newHashMap();
        map.put("start",start);
        map.put("length",length);
        map.put(StringUtils.toLowerCaseFirstOne(entity.getClass().getSimpleName()),entity);
        //获取分页的数据
        List list = mapper.page(map);
        //获取总数据数
        int count=mapper.count(entity);
        //设置分页对象
        PageInfo pageInfo=new PageInfo();
        pageInfo.setDraw(draw);
        pageInfo.setData(list);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        return pageInfo;
    }
    /**
     * 通过id获取对象
     * @param id
     * @return
     */
    @Override
    public T getById(Long id) {
        return mapper.getById(id);
    }
    /**
     * 保存信息 添加或编辑 每个类都有创建时间 更新时间设置 判断id这些步骤
     * @param entity
     * @return
     */
    @Override
    @Transactional(readOnly = false)
    public int save(T entity){
        //添加
        if(entity.preSave(entity)){
            mapper.insert(entity);
            return T.ADD;
        }
        //编辑
        else {
            mapper.update(entity);
        }
        return T.UPDATE;
    }

    /**
     * 批量删除
     * @param id
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(String id[]){
        mapper.delete(id);
    }
}
