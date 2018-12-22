<%--
  Created by IntelliJ IDEA.
  User: DMXS
  Date: 2018/12/19
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--聊天室-->
<div class="page-quick-sidebar-wrapper" data-close-on-body-click="false">
    <div class="page-quick-sidebar">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="javascript:;" data-target="#quick_sidebar_tab_1" data-toggle="tab"> 好友列表
                    <span class="badge badge-danger" id="app">{{ unreadCount }}</span>
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active page-quick-sidebar-chat" id="quick_sidebar_tab_1">
                <div class="page-quick-sidebar-chat-users" data-rail-color="#ddd" data-wrapper-class="page-quick-sidebar-list">
                    <h3 class="list-heading">可约炮</h3>
                    <ul class="media-list list-items">
                        <c:forEach items="${friends}" var="friend">
                            <li class="media" onclick="getRecord(${friend.id})">
                                <div class="media-status">
                                    <span class="badge badge-danger"></span>
                                </div>
                                <img class="media-object" src="/static/assets/layouts/layout/img/avatar3.jpg" alt="...">
                                <div class="media-body">
                                    <h4 class="media-heading">${friend.username}</h4>
                                    <div class="media-heading-sub"></div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="page-quick-sidebar-item">
                    <div class="page-quick-sidebar-chat-user">
                        <div class="page-quick-sidebar-nav">
                            <a href="javascript:;" class="page-quick-sidebar-back-to-list">
                                <i class="icon-arrow-left"></i>返回</a>
                        </div>
                        <!--聊天记录-->
                        <!--这是聊天框-->
                        <div class="chat-border" id="record">
                            <div class="answer">
                                <div class="row">
                                    <div class="col-md-9"></div>
                                    <div class="col-md-3" style="float: right">
                                        <p >17:50</p>
                                    </div>
                                </div>
                                <div class="heard_img left"><img src="/static/images/1.jpg"></div>
                                <div style="width: 8px"></div>
                                <div class="answer_text">
                                    <p>您可以向我提问哦</p>
                                    <i></i>
                                </div>
                            </div>
                            <div style="height: 5px"></div>
                            <div class="question">
                                <div class="row">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-11" style="float: left"><p >17:50</p></div>
                                </div>
                                <div class="heard_img right">
                                    <img src="/static/images/1.jpg">
                                </div>
                                <div style="width: 8px"></div>
                                <div class="question_text clear" style="max-width: 543px;">
                                    <p>我曹尼玛垃圾页面</p>
                                    <i></i>
                                </div>
                            </div>

                        </div>
                        <!--这是聊天框-->
                        <div class="page-quick-sidebar-chat-user-form">
                            <div class="input-group"  style="height: 200px">
                                <input type="text" class="form-control" id="info">
                                <div id="editor1" class="editor11">
                                </div>
                                <div id="editor2" class="editor22" >
                                </div>
                                        <button id="news" type="button" class="btn green pull-right" onclick="send()" style="padding:4px 8px ">
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