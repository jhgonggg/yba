package com.yb.yue.ba.admin.commons;

import lombok.Data;

/**
 * 结果处理类 目前用于删除 做为json数据返回给前端
 */
@Data
public final class BaseResult {
    private int status;
    private String message;
    /**
     * 操作成功状态
     */
    public static final int SUCCESS=200;
    /**
     * 操作失败状态
     */
    public static final int FAIL=500;

    /**
     * 操作成功
     * @param message 返回的消息
     * @return
     */
    public static BaseResult success(String message){
        BaseResult baseResult=new BaseResult();
        baseResult.setStatus(SUCCESS);
        baseResult.setMessage(message);
        return baseResult;
    }

    /**
     * 操作失败
     * @param message 返回的消息
     * @return
     */
    public static BaseResult fail(String message){
        BaseResult baseResult=new BaseResult();
        baseResult.setStatus(FAIL);
        baseResult.setMessage(message);
        return baseResult;
    }
}
