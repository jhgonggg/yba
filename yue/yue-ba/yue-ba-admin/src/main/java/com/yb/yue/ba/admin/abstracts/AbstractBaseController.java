package com.yb.yue.ba.admin.abstracts;
import com.yb.yue.ba.admin.commons.BaseResult;
import com.yb.yue.ba.admin.constants.SystemConstants;
import com.yb.yue.ba.admin.dto.PageInfo;
import com.yb.yue.ba.admin.utils.BeanUtils;
import com.yb.yue.ba.admin.utils.StringUtils;
import com.yb.yue.ba.admin.validator.BeanValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.ParameterizedType;

/**
 * 控制层工具类
 */
@Controller
public abstract class AbstractBaseController<T extends AbstractBaseEntity,S extends BaseCrudService<T>> {
    @Autowired
    protected S service;

    //优先于@xxxMapping执行 返回值自动保存在ModelAttribute中 可以和spring的表单标签库结合(必须需要属性ModelAttribute)
    //*每个类对象编辑后 又会执行这个方法 返回的对象 属性为空的会赋值数据库中的数据
    @ModelAttribute
    public T getObject(String id) throws IllegalAccessException, InstantiationException {
        T entity=null;
        //id不为空 可以确定为修改操作 获取修改的对象 返回给前端
        if (StringUtils.isNoneBlank(id)){
            entity= service.getById(Long.parseLong(id));
        }
        else{
            //泛型实例化
            ParameterizedType pType = (ParameterizedType)this.getClass().getGenericSuperclass();
            Class clazz = (Class<T>) pType.getActualTypeArguments()[0];
            entity = (T) clazz.newInstance();
        }
        return entity;
    }
    /**
     * 分页 ajax 请求
     * draw  确保Ajax从服务器返回的是对应的  必须int
     * start 起始位置
     * length 每页显示数
     * user 模糊查询时需要查询的条件
     * 服务器返回数据时
     *     确保Ajax从服务器返回的是对应的  draw
     *     需要返回的数据  data
     *     数据库里总共记录数 recordsTotal
     *     过滤后的记录数  recordsFiltered
     *     可选 定义一个错误来描述服务器出了问题后的友好提示  error
     * @return map
     */
    @ResponseBody
    @PostMapping(value = "/page")
    public PageInfo<T> page(HttpServletRequest request, T entity){
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength= request.getParameter("length");


        int draw = StringUtils.isBlank(strDraw) ? 1 : Integer.parseInt(strDraw);
        int start = StringUtils.isBlank(strStart) ? 0 : Integer.parseInt(strStart);
        int length = StringUtils.isBlank(strLength) ? 5 : Integer.parseInt(strLength);

        PageInfo pageInfo = service.page(entity,start,length,draw);
        return pageInfo;
    }
    /**
     * 批量删除
     * @param ids id数组
     */
    @ResponseBody
    @PostMapping  (value = "/delete")
    public BaseResult delete(String ids){
        BaseResult baseResult;
        if (StringUtils.isBlank(ids)){
            baseResult=BaseResult.fail("删除失败");
        }
        else{
            String[] id = ids.split(",");
            service.delete(id);
            baseResult=BaseResult.success("删除成功");
        }
        return baseResult;
    }

    /**
     * model对象传递消息
     * @param model
     * @param message
     */
    protected  void sendMessage(Model model,String message){
        model.addAttribute(SystemConstants.CACHE_KEY_MESSAGE,message);
    }

    /**
     * redirectAttributes对象传递消息
     * @param redirectAttributes
     * @param message
     */
    protected void sendMessage(RedirectAttributes redirectAttributes, String message){
        redirectAttributes.addFlashAttribute(SystemConstants.CACHE_KEY_MESSAGE,message);
    }

    /**
     * 校验公共方法
     * 第一个参数为需要校验的实体类
     * 第二个参数为校验失败时发送消息的对象类型(RedirectAttributes为Model子接口)
     * 第三个参数为 组
     * @param entity
     * @return true/校验成功  false/校验失败
     */
    protected boolean beanValidator(T entity,Model model, Class<?>... groups){
        String result = BeanValidator.validator(entity, groups);
        //校验失败 并发送校验消息给前端
        if(StringUtils.isNoneBlank(result)){
            //判断model是不是RedirectAttributes的类型 子类是继承时用 用父类对象做为参数 可传递子父类 实现多态传递
            if(model instanceof RedirectAttributes){
                RedirectAttributes redirectAttributes= (RedirectAttributes) model;
                sendMessage(redirectAttributes,result);
            }
            else{
                sendMessage(model,result);
            }
            return false;
        }
        //校验成功
        else{
            return true;
        }
    }
    /** 获取session对象 并覆盖session中对象的工具类
     * 通过key获取session中对象(目标对象) 再将原对象不为空的属性复制给目标对象中相同的属性
     */
    protected void updateSession(T src, String sessionKey, HttpServletRequest request){
        Object target = request.getSession().getAttribute(sessionKey);
        BeanUtils.copyPropertiesIgnoreNull(src,target);
        request.getSession().setAttribute(sessionKey,target);
    }
}
