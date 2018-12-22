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
    <!--BEGIN sweetalert -->
    <link href="/static/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
    <!--END sweetalert -->
    <style>
        .btn.white:not(.btn-outline).active, .btn.white:not(.btn-outline):active, .btn.white:not(.btn-outline):hover, .open>.btn.white:not(.btn-outline).dropdown-toggle {
            color: #ffffff;
            background-color: #ff2d51;
            border-color: #e0e0e0;
        }
        .load2{
            height: 90px;
            width: 330px;
            border: 1px solid pink;
        }
    </style>
    <script src="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.js"></script>
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
                                                <span class="timeline-body-time font-grey-cascade">${myMessage.location}</span>
                                            </div>
                                            <div class="timeline-body-head-actions">
                                                <button class="btn btn-circle red btn-sm dropdown-toggle mt-sweetalert"
                                                        data-title="确定删除么?"
                                                        data-type="info" data-show-confirm-button="true" data-confirm-button-class="btn-success"
                                                        data-show-cancel-button="true" data-cancel-button-class="btn-default"
                                                        data-close-on-confirm="false" data-close-on-cancel="false" data-confirm-button-text= "确定"
                                                        data-cancel-button-text="取消" data-popup-title-success="删除成功"
                                                        data-popup-title-cancel="取消成功"
                                                        data-id="${myMessage.id}" data-url="/circle/delete/circles"><i class="fa fa-trash"></i>删除
                                                </button>
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
                                                <a href="javascript:;" class="btn btn-circle btn-icon-only white" onclick="cc(${myMessage.id})">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a href="javascript:;" class="btn btn-circle btn-icon-only grey-cascade">
                                                    <i class="fa fa-link"></i>
                                                </a>
                                                <a href="javascript:void((function(s,d,e,r,l,p,t,z,c){var%20f='http://v.t.sina.com.cn/share/share.php?appkey=真实的appkey',u=z||d.location,p=['&url=',e(u),'&title=',e(t||d.title),'&source=',e(r),'&sourceUrl=',e(l),'&content=',c||'gb2312','&pic=',e(p||'')].join('');function%20a(){if(!window.open([f,p].join(''),'mb',['toolbar=0,status=0,resizable=1,width=440,height=430,left=',(s.width-440)/2,',top=',(s.height-430)/2].join('')))u.href=[f,p].join('');};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else%20a();})(screen,document,encodeURIComponent,'','','图片链接|默认为空','标题|默认当前页标题','内容链接|默认当前页location','页面编码gb2312|utf-8默认gb2312'));">分享至微博</a>
                                                <div class="" style="height: 10px"></div>
                                                <div id="loadOrther_${myMessage.id}" style="display: none">
                                                    <input type="hidden" id="loadInput_${myMessage.id}" >
                                                    <div id="load1_${myMessage.id}" class="load1">
                                                    </div>
                                                    <div id="load2_${myMessage.id}" class="load2">
                                                    </div>
                                                    <button id="loadFriend" type="button" class="btn green" style="padding:4px 8px " onclick="sb(${myMessage.id})">
                                                        <span>确定</span>
                                                    </button>
                                                </div>
                                                <script>
                                                    var E = window.wangEditor;
                                                    var editor2 = new E('#'+('load1_'+${myMessage.id}),'#'+('load2_'+${myMessage.id}));
                                                    editor2.customConfig.menus = [
                                                        'head',
                                                        'bold',
                                                        'italic',
                                                        'underline',
                                                        'emoticon',
                                                        'undo',
                                                        'image',
                                                        'table'
                                                    ],
                                                    editor2.customConfig.onchange = function (html) {
                                                        //过滤部分标签
                                                        var content=html;
                                                        content = content.replace(/(\n)/g, "");
                                                        content = content.replace(/(\r)/g, "");
                                                        content = content.replace(/<\/?p[^>]*>/gi, "");
                                                        $("#loadInput_"+${myMessage.id}).val(content)
                                                    };
                                                editor2.create();
                                                </script>
                                                </br></br>
                                                <c:forEach items="${myMessage.comments}" var="comment" >
                                                    <a class="ellipsis" onclick="pl(${comment.id},${myMessage.id})">
                                                        【${comment.customer.username}】:
                                                    </a>
                                                    <span class="ellipsis">${comment.content}</span>
                                                    <span class="ellipsis">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${comment.created}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                    </span>
                                                    <br />
                                                    <c:if test="${!empty comment.replyComment}">
                                                        <c:forEach items="${comment.replyComment}" var="reply">
                                                            <a class="ellipsis" onclick="pl(${reply.id},${myMessage.id})">【${reply.replyCustomer.username}】:</a><span class="date-dz-pl pl-hf hf-con-block">回复</span>【${reply.customer.username}】:
                                                            <span class="ellipsis">${reply.content}</span>
                                                            <span class="ellipsis">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${reply.created}" pattern="yyyy-MM-dd HH:mm:ss" />
    				                                        </span>
                                                            <br />
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
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
<!--BEGIN sweetalert -->
<script src="/static/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<!--END sweetalert -->
<script src="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.js"></script>
<script src="/static/assets/apps/sweetalert.js"></script>
<script src="/static/assets/apps/wangEditor.js"></script>
<script>
    //点赞  id---朋友圈id
    function love(id) {
        var uid=${sessionScope.user.id};
        $.ajax({
            "url":"/praise/love",
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

    //启动wangEditor
    var E = window.wangEditor;
    var editor = new E('#editor1','#editor2');
    editor.customConfig.uploadImgShowBase64 = true;
    editor.customConfig.menus = [
        'head',
        'bold',
        'italic',
        'underline',
        'emoticon',
        'undo',
        'image',
        'table'
    ],
    editor.customConfig.onchange = function (html) {
        $("#info").val(html.replace(/<\/?(img|a)[^>]*>/gi, ''))
    };
    editor.create();

    //朋友圈id
    function cc(id) {
        $('#'+('loadOrther_'+id)).toggle();
    }
    var parentCommentId;
    //提交评论
    function sb(fcmid) {
        var uid=${sessionScope.user.id}
        var content=$("#loadInput_"+fcmid).val();
        $.ajax({
            "url":"/comment/review ",
            "data":{"commentatorId":uid,"fcmid":fcmid,"content":content,"parentCommentId":parentCommentId},
            "type":"POST",
            "dataType":"JSON",
            "success":function (data) {
                window.location.reload();
            }
        });
    }
    //点击人名评论
    function pl(id,fcmid) {
        cc(fcmid);
        parentCommentId=id;
    }

</script>
</body>
</html>
