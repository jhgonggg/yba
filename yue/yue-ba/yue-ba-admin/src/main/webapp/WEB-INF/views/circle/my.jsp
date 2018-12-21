<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="msg" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8" />
    <title>约吧</title>
    <%@include file="../includes/head.jsp"%>

    <!--wangEditor-->
    <link href="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.css" rel="stylesheet">

    <!--dropZone-->
    <link href="/static/assets/global/plugins/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
    <link href="/static/assets/global/plugins/dropzone/basic.min.css" rel="stylesheet" type="text/css" />

    <link href="/static/assets/plugins/commons.css" rel="stylesheet" type="text/css"/>
    <style>
        .btn.white:not(.btn-outline).active, .btn.white:not(.btn-outline):active, .btn.white:not(.btn-outline):hover, .open>.btn.white:not(.btn-outline).dropdown-toggle {
            color: #ffffff;
            background-color: #ff2d51;
            border-color: #e0e0e0;
        }
    </style>
</head>
<body class="allyb">
<%@include file="../includes/header.jsp"%>
<!-- BEGIN CONTAINER -->

<div class="container-fluid">
    <div class="page-content page-content-popup">
        <%@include file="../includes/menu.jsp"%>
        <div class="page-fixed-main-content">
            <!-- BEGIN PAGE BASE CONTENT -->
            <!--图表-->
            <div class="row">
                <div class="">
                    <div class="portlet light portlet-fit bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-calendar"></i>
                                <span class="caption-subject bold font-green uppercase">我的历史</span>
                                <span class="caption-helper"></span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <c:forEach items="${myList}" var="myMessage">
                            <div class="timeline">
                                <!-- TIMELINE ITEM -->
                                <div class="timeline-item">
                                    <div class="timeline-badge">
                                        <!--头像-->
                                        <img class="timeline-badge-userpic" src="${myMessage.image}"> </div>
                                    <div class="timeline-body">
                                        <div class="timeline-body-arrow"> </div>
                                        <div class="timeline-body-head">
                                            <div class="timeline-body-head-caption">
                                                <a href="javascript:;" class="timeline-body-title font-blue-madison">${myMessage.uname}</a>
                                                <span class="timeline-body-time font-grey-cascade">发布于 <fmt:formatDate value="${myMessage.created}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
                                            </div>
                                            <div class="timeline-body-head-actions">

                                            </div>
                                        </div>
                                        <div class="timeline-body-content">

                                            <img class="timeline-body-img pull-right" src="${myMessage.picture}" alt="">
                                            <span class="font-grey-cascade">
                                                <p>${myMessage.content}</p>
                                            </span>
                                            <div class="pull-left">
                                                <button class="btn btn-circle btn-icon-only white" onclick="love(${myMessage.id})">
                                                    <i class="fa fa-thumbs-o-up"></i>${myMessage.praiseNum}
                                                </button>

                                                <a href="javascript:;" class="btn btn-circle btn-icon-only grey-cascade">
                                                    <i class="fa fa-link"></i>
                                                </a>
                                            </div>
                                            <%--<div class="pull-left">
                                                <span>点赞数</span>
                                                :
                                                <a href="javascript:;">
                                                    ${myMessage.praiseNum}
                                                </a>
                                                <span>评论量</span>
                                                :
                                                <a href="javascript:;">
                                                    26
                                                </a>

                                            </div>--%>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="clearfix"></div>
    </div>
    <!-- BEGIN FOOTER -->
    <p class="copyright-v2"> 2018 &copy; Metronic Theme By
        <a target="_blank" href="#">约吧</a>
    </p>
    <!-- BEGIN QUICK SIDEBAR TOGGLER -->
    <button type="button" class="quick-sidebar-toggler" data-toggle="collapse">
        <span class="sr-only"></span>
        <%--<i class="icon-logout"></i>--%>
        <span style="font-size: 20px;font-family: '微软雅黑 Light';color: hotpink">约</span>
        <div class="quick-sidebar-notification">
            <span class="badge badge-danger">5</span>
        </div>
    </button>
</div>
<msg:modal/>
<!-- END CONTAINER -->
<!-- BEGIN QUICK SIDEBAR -->
<a href="javascript:;" class="page-quick-sidebar-toggler">
    <i class="icon-login"></i>
</a>
<%@include file="../includes/chat.jsp"%>

<%@include file="../includes/footer.jsp"%>
<script>
    //点赞  id---朋友圈id
    function love(id) {
        var uid=${sessionScope.user.id};
        $.ajax({
            "url":"/love",
            "data":{"praiseUid":uid,"fcmId":id},
            "type":"POST",
            "dataType":"JSON",
            "success":function (data) {
                $(".modal-body").html(data.message);
                $("#modal-danger").modal("show");
                $("#check").click(function () {
                    window.location.reload();
                })
            }
        });
    }
</script>
</body>
</html>
