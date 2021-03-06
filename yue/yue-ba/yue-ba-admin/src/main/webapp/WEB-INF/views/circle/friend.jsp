<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="msg" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8" />
    <title>约吧</title>
    <%@include file="../includes/head.jsp"%>
    <link rel="stylesheet" href="/static/assets/css/_all-skins.min.css">
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
        .load2{
            height: 90px;
            width: 330px;
            border: 1px solid pink;
        }
        .dropzone-file-area {
            border: 2px dashed #f47983 !important;
            background: #fff !important;
            padding: 95px !important;
            margin: 0 auto;
            text-align: center
        }
        .btn.white:not(.btn-outline).active, .btn.white:not(.btn-outline):active, .btn.white:not(.btn-outline):hover, .open>.btn.white:not(.btn-outline).dropdown-toggle {
            color: #ffffff;
            background-color: #ff2d51;
            border-color: #e0e0e0;
        }
    </style>
    <script src="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4IU3oIAMpZhfWZsMu7xzqBBAf6vMHcoa"></script>
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
                                <i class="fa fa-comments"></i>
                                <span class="caption-subject bold font-green uppercase">好友动态</span>
                                <span class="caption-helper">一些美好的事...</span>
                            </div>
                            <div class="actions">
                                <div class="btn-group btn-group-devided" data-toggle="buttons">
                                    <label class="btn green-dark btn-outline btn-circle btn-sm " onclick="$('#share').toggle()">
                                        <i class="fa fa-plus" ></i>
                                    </label>
                                </div>

                            </div>
                        </div>
                        <form action="/circle/push" method="post">
                            <input type="hidden" name="uid" value="${sessionScope.user.id}"/>
                            <input type="hidden" name="picture" id="picture">
                            <div class="row" id="share" style="display: none">
                            <!--文本编辑器-->
                            <input type="hidden" name="content" id="content"/>
                            <div class="col-md-6">
                                <div id="editor" >

                                </div>
                            </div>
                                <!--图片上传-->
                            <div class="col-md-6">
                                 <div class="dropzone dropzone-file-area " id="my-dropzone" >
                                     <h3 class="sbold">将图片拖到此处或点击上传</h3>
                                     <i class="fa fa-photo" style="font-size: 50px;padding: 20px 20px"></i>
                                 </div>
                            </div>
                                <div style="margin-left: 16px">
                                    <i class="icon-pointer"></i><input type="text" name="location" id="location" readonly style="cursor: auto"/>
                                </div>
                                    <input type="submit" class="btn-danger pull-left" style="padding:4px 8px;margin-left: 16px;margin-top: 10px" value="发布"/>

                            </div>
                        </form>
                        <div class="portlet-body">
                            <c:forEach items="${friendList}" var="friendMessage">
                            <div class="timeline">
                                <!-- TIMELINE ITEM -->
                                <div class="timeline-item">
                                    <div class="timeline-badge">
                                        <!--头像-->
                                        <img class="timeline-badge-userpic" src="${friendMessage.image}"> </div>
                                    <div class="timeline-body">
                                    <div class="timeline-body-arrow"> </div>
                                    <div class="timeline-body-head">
                                        <div class="timeline-body-head-caption">
                                            <a href="javascript:;" class="timeline-body-title font-blue-madison">${friendMessage.uname}</a>
                                            <span class="timeline-body-time font-grey-cascade">发布于<fmt:formatDate value="${friendMessage.created}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
                                            <span class="timeline-body-time font-grey-cascade">${friendMessage.location}</span>
                                        </div>
                                    </div>
                                    <div class="timeline-body-content">

                                        <img class="timeline-body-img pull-right" src="${friendMessage.picture}" id="pic_${friendMessage.id}">
                                        <span class="font-grey-cascade" id="content_${friendMessage.id}">
                                            <p>${friendMessage.content}</p>
                                        </span>
                                    </div>
                                        <div class="pull-left">
                                            <button class="btn btn-circle btn-icon-only white" onclick="Images.love(${sessionScope.user.id},${friendMessage.id})">
                                                <i class="fa fa-thumbs-o-up"></i>${friendMessage.praiseNum}
                                            </button>
                                            <a href="javascript:;" class="btn btn-circle btn-icon-only white" onclick="cc(${friendMessage.id})">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a href="javascript:;" class="btn btn-circle btn-icon-only grey-cascade" onclick="shareToXl('${friendMessage.id}')">
                                                <i class="fa fa-link"></i>
                                            </a>
                                            <div class="" style="height: 10px"></div>
                                            <div id="loadOrther_${friendMessage.id}" style="display: none">
                                                <input type="hidden" id="loadInput_${friendMessage.id}" >
                                                <div id="load1_${friendMessage.id}" class="load1">
                                                </div>
                                                <div id="load2_${friendMessage.id}" class="load2">
                                                </div>
                                                <button id="loadFriend_${friendMessage.id}" type="button" class="btn green" style="padding:4px 8px " onclick="sb(${friendMessage.id})">
                                                    <span>确定</span>
                                                </button>
                                            </div>
                                            <script>
                                                var E = window.wangEditor;
                                                var editor2 = new E('#load1_'+${friendMessage.id},'#load2_'+${friendMessage.id});
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
                                                    content = content.replace(/(<br>)/g, "");
                                                    content = content.replace(/<\/?p[^>]*>/gi, "");
                                                    $("#loadInput_"+${friendMessage.id}).val(content);
                                                };
                                                editor2.create();
                                            </script>
                                            </br></br>
                                            <c:forEach items="${friendMessage.comments}" var="comment" >
                                                <a class="ellipsis" onclick="pl(${comment.id},${friendMessage.id})">
                                                    【${comment.customer.username}】:
                                                </a>
                                                <span class="ellipsis">${comment.content}</span>
                                                <span class="ellipsis">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${comment.created}" pattern="yyyy/MM/dd HH:mm:ss" />
                                                    </span>
                                                <br />
                                                <c:if test="${!empty comment.replyComment}">
                                                    <c:forEach items="${comment.replyComment}" var="reply">
                                                        <a class="ellipsis" onclick="pl(${reply.id},${friendMessage.id})">【${reply.replyCustomer.username}】:</a><span class="date-dz-pl pl-hf hf-con-block">回复</span>【${reply.customer.username}】:
                                                        <span class="ellipsis" >${reply.content}</span>
                                                        <span class="ellipsis">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${reply.created}" pattern="yyyy/MM/dd HH:mm:ss" />
    				                                        </span>
                                                        <br />
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
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
    <p class="copyright-v2"> 2018 &copy; 年轻人的约会天堂
        <a target="_blank" href="#">约吧</a>
    </p>
    <!-- BEGIN QUICK SIDEBAR TOGGLER -->
    <button type="button" class="quick-sidebar-toggler" data-toggle="collapse">
        <span class="sr-only"></span>
        <span aria-hidden="true" class="icon-bubbles" style="color: lightgreen;font-size: 40px"></span>
        <div class="quick-sidebar-notification">
            <span class="badge badge-danger"></span>
        </div>
    </button>
</div>
<!-- END CONTAINER -->
<!-- BEGIN QUICK SIDEBAR -->
<a href="javascript:;" class="page-quick-sidebar-toggler">
    <i class="icon-login"></i>
</a>
<msg:modal/>
<%@include file="../includes/chat.jsp"%>
<%@include file="../includes/footer.jsp"%>
<!--dropZone-->
<script src="/static/assets/global/plugins/dropzone/dropzone.min.js" type="text/javascript"></script>
<script src="/static/assets/apps/wangEditor.js"></script>
<script src="/static/assets/apps/friendImage.js"></script>
<script>
    $(function () {
        //文件上传
        Dropzone.options.myDropzone = {
            url: "/upload",
            //最大上传文件数
            maxFiles:"1",
            dictDefaultMessage: "",
            //传递过去的参数 取别名file 默认为file
            paramName: "uploadFile",
            //取消自动上传 false
            autoProcessQueue:true,
            init: function() {
                this.on('success', function (files, data) {
                    console.log(data.path);
                    //文件上传成功之后的操作
                    $("#picture").val(data.path);
                });
            }
        };
    });
    //Wang Editor
    WangEditor.init("editor","content");

    audiojs.events.ready(function() {
        audiojs.createAll();
    });


</script>
<script type="text/javascript" >
    var geolocation = new BMap.Geolocation();
    // 创建地理编码实例
    var myGeo = new BMap.Geocoder();
    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            var pt = r.point;
        // 根据坐标得到地址描述
            myGeo.getLocation(pt, function(result){
                if (result){
                    var addComp = result.addressComponents;
                    $("#location").val(addComp.province + " " + addComp.city + " " + addComp.district);
                }
            });
        }
    });
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
            "url":"/comment/review",
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

    function shareToXl(id){
        var title=$("#content_"+id).html();
        //去除内容的html标签
        title=title.replace(/<[^>]+>/g,"");
        //获取图片地址 并将\转换为/
        var picurl=$("#pic_"+id).attr("src");
        picurl=picurl.replace("\\", "\/");
        var sharesinastring='http://v.t.sina.com.cn/share/share.php?title='+title+'&url='+document.URL+'&content=utf-8&sourceUrl='+document.URL+'&pic='+picurl;
        window.open(sharesinastring,'newwindow','height=400,width=400,top=100,left=100');
    }
</script>
</body>
</html>
