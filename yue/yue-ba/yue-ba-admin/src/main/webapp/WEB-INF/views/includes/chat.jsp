<%--
  Created by IntelliJ IDEA.
  User: DMXS
  Date: 2018/12/19
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--聊天室-->
<div class="page-quick-sidebar-wrapper" data-close-on-body-click="false">
    <div class="page-quick-sidebar">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="javascript:;" data-target="#quick_sidebar_tab_1" data-toggle="tab"> 好友列表
                    <span class="badge badge-danger">2</span>
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active page-quick-sidebar-chat" id="quick_sidebar_tab_1">
                <div class="page-quick-sidebar-chat-users" data-rail-color="#ddd" data-wrapper-class="page-quick-sidebar-list">
                    <h3 class="list-heading">可约炮</h3>
                    <ul class="media-list list-items">
                        <li class="media">
                            <div class="media-status">
                                <span class="badge badge-danger">8</span>
                            </div>
                            <img class="media-object" src="/static/assets/layouts/layout/img/avatar3.jpg" alt="...">
                            <div class="media-body">
                                <h4 class="media-heading">庄鼎</h4>
                                <div class="media-heading-sub"> 社会青年</div>
                            </div>
                        </li>
                        <li class="media">
                            <img class="media-object" src="/static/assets/layouts/layout/img/avatar1.jpg" alt="...">
                            <div class="media-body">
                                <h4 class="media-heading">Lusifer</h4>
                                <div class="media-heading-sub"> 资深程序员 </div>
                            </div>
                        </li>
                        <li class="media">
                            <div class="media-status">
                                <span class="badge badge-danger">3</span>
                            </div>
                            <img class="media-object" src="/static/assets/layouts/layout/img/avatar4.jpg" alt="...">
                            <div class="media-body">
                                <h4 class="media-heading">小泽姐</h4>
                                <div class="media-heading-sub"> 著名影视明星 </div>
                            </div>
                        </li>
                        <li class="media">
                            <img class="media-object" src="/static/assets/layouts/layout/img/avatar2.jpg" alt="...">
                            <div class="media-body">
                                <h4 class="media-heading">桐谷阿旺</h4>
                                <div class="media-heading-sub"> 隔壁老王 </div>
                            </div>
                        </li>
                    </ul>
                    <h3 class="list-heading">暂不可约炮</h3>
                    <ul class="media-list list-items">
                        <li class="media">
                            <div class="media-status">
                                <span class="badge badge-danger">3</span>
                            </div>
                            <img class="media-object" src="/static/assets/layouts/layout/img/avatar6.jpg" alt="...">
                            <div class="media-body">
                                <h4 class="media-heading">Lara Kunis</h4>
                                <div class="media-heading-sub"> CEO, Loop Inc </div>

                            </div>
                        </li>
                    </ul>
                </div>
                <div class="page-quick-sidebar-item">
                    <div class="page-quick-sidebar-chat-user">
                        <div class="page-quick-sidebar-nav">
                            <a href="javascript:;" class="page-quick-sidebar-back-to-list">
                                <i class="icon-arrow-left"></i>返回</a>
                        </div>
                        <!--聊天记录-->
                        <div class="page-quick-sidebar-chat-user-messages">
                            <div class="post out">
                                <img class="avatar" alt="" src="/static/assets/layouts/layout/img/avatar3.jpg" />
                                <div class="message">
                                    <span class="arrow"></span>
                                    <a href="javascript:;" class="name">Bob Nilson</a>
                                    <span class="datetime">20:15</span>
                                    <span class="body"> When could you send me the report ? </span>
                                </div>
                            </div>
                            <div class="post in">
                                <img class="avatar" alt="" src="/static/assets/layouts/layout/img/avatar2.jpg" />
                                <div class="message">
                                    <span class="arrow"></span>
                                    <a href="javascript:;" class="name">Ella Wong</a>
                                    <span class="datetime">20:15</span>
                                    <span class="body"> Its almost done. I will be sending it shortly </span>
                                </div>
                            </div>
                            <div class="post out">
                                <img class="avatar" alt="" src="/static/assets/layouts/layout/img/avatar3.jpg" />
                                <div class="message">
                                    <span class="arrow"></span>
                                    <a href="javascript:;" class="name">Bob Nilson</a>
                                    <span class="datetime">20:17</span>
                                    <span class="body"> Great! Thanks. Will check it right away. </span>
                                </div>
                            </div>

                        </div>
                        <!--这是聊天框-->
                        <div class="page-quick-sidebar-chat-user-form">
                            <div class="input-group"  style="height: 200px">
                                <input type="hidden" id="info" class="form-control">
                                <div id="editor1" class="editor11">
                                </div>
                                <div id="editor2" class="editor22" >
                                </div>

                                        <button id="news" type="button" class="btn green pull-right" style="padding:4px 8px ">
                                            <span>发送</span>
                                        </button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>