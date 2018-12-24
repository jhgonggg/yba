package com.yb.yue.ba.admin.utils;

import io.goeasy.GoEasy;
import io.goeasy.publish.GoEasyError;
import io.goeasy.publish.PublishListener;

/**
 * 服务端推送工具类
 */
public class ServerUtils {

    public static void publish(String content){
        GoEasy goEasy =
                new GoEasy( "http://rest-hangzhou.goeasy.io", "BC-697822f1a335419da17331bb84427a10");
        goEasy.publish("sys_channel",content, new PublishListener(){
            @Override
            public void onSuccess() {
                System.out.print("推送成功");
            }
            @Override
            public void onFailed(GoEasyError error) {
                System.out.print("推送失败, 错误编码：" + error.getCode() + " 错误信息： " + error.getContent());
            }
        });


    }
}
