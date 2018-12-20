<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <div class="row" id="share" style="display: none">
                            <!--文本编辑器-->
                        <div class="col-md-6" >
                            <input type="hidden" id="pub1" >
                            <div id="pub" >
                            </div>
                                    <button id="pubFriend" type="button" class="btn green pull-right" style="padding:4px 8px ">
                                        <span>发布</span>
                                    </button>
                        </div>
                            <!--图片上传-->
                        <div class="col-md-6">
                             <div class="dropzone dropzone-file-area " id="my-dropzone" >
                                 <h3 class="sbold">将图片拖到此处或点击上传</h3>
                                 <i class="fa fa-photo" style="font-size: 50px;padding: 20px 20px"></i>
                             </div>
                         </div>
                        </div>
                        <div class="portlet-body">
                            <div class="timeline">
                                <!-- TIMELINE ITEM -->
                                <div class="timeline-item">
                                    <div class="timeline-badge">
                                        <!--头像-->
                                        <img class="timeline-badge-userpic" src="/static/assets/pages/media/users/avatar80_1.jpg"> </div>
                                    <div class="timeline-body">
                                    <div class="timeline-body-arrow"> </div>
                                    <div class="timeline-body-head">
                                        <div class="timeline-body-head-caption">
                                            <a href="javascript:;" class="timeline-body-title font-blue-madison">装鼎</a>
                                            <span class="timeline-body-time font-grey-cascade">发布于 at 7:45 PM</span>
                                        </div>
                                    </div>
                                    <div class="timeline-body-content">

                                        <img class="timeline-body-img pull-right" src="/static/assets/pages/media/blog/4.jpg" alt="">
                                        <span class="font-grey-cascade">
                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,
                                                    quis nostrud exerci tationullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                                        </span>

                                        <div class="pull-left">

                                            <a href="javascript:;" class="btn btn-circle btn-icon-only grey-cascade">
                                                <i class="fa fa-link"></i>
                                            </a>
                                            <a href="javascript:;" class="btn btn-circle btn-icon-only white">

                                                <i class="fa fa-thumbs-o-up"></i>
                                            </a>

                                        </div>
                                    </div>

                                </div>

                                </div>
                            </div>
                         <%--   <div class="timeline">
                                <!-- TIMELINE ITEM -->
                                <div class="timeline-item">
                                    <div class="timeline-badge">
                                        <!--头像-->
                                        <img class="timeline-badge-userpic" src="/static/assets/pages/media/users/avatar80_1.jpg"> </div>
                                    <div class="timeline-body">
                                        <div class="timeline-body-arrow"> </div>
                                        <div class="timeline-body-head">
                                            <div class="timeline-body-head-caption">
                                                <a href="javascript:;" class="timeline-body-title font-blue-madison">装鼎</a>
                                                <span class="timeline-body-time font-grey-cascade">发布于 at 7:45 PM</span>
                                            </div>
                                            <div class="timeline-body-head-actions">

                                            </div>
                                        </div>
                                        <div class="timeline-body-content">

                                            <img class="timeline-body-img pull-right" src="/static/assets/pages/media/blog/4.jpg" alt="">
                                            <span class="font-grey-cascade">
                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,
                                                    quis nostrud exerci tationullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                                            </span>

                                            <div class="pull-left">

                                                <a href="javascript:;" class="btn btn-circle btn-icon-only grey-cascade">
                                                    <i class="fa fa-link"></i>
                                                </a>
                                                <a href="javascript:;" class="btn btn-circle btn-icon-only white">
                                                    <i class="fa fa-thumbs-o-up"></i>
                                                </a>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>--%>
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

<!-- END CONTAINER -->
<!-- BEGIN QUICK SIDEBAR -->
<a href="javascript:;" class="page-quick-sidebar-toggler">
    <i class="icon-login"></i>
</a>
<%@include file="../includes/chat.jsp"%>

<%@include file="../includes/footer.jsp"%>
<!--wangEditor-->
<script src="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.js"></script>
<!--dropZone-->
<script src="/static/assets/global/plugins/dropzone/dropzone.min.js" type="text/javascript"></script>

<script>
    $(function () {
        Dropzone.options.myDropzone = {
            url: "/upload",//上传到哪个页面
            dictDefaultMessage: "",//设置默认的提示语句
            paramName: "dropzFile",//传到后台的参数名称
            maxFilesize: 1,//最大上次数量
        };

        //启动wangEditor
        var E = window.wangEditor;
        var editor = new E('#editor1','#editor2');
        var editor1 = new E('#pub');
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
        editor1.customConfig.menus = [
            'head',
            'bold',
            'italic',
            'underline',
            'emoticon',
            'undo',
            'table',
            'link',  // 插入链接
            'list',  // 列表
            'justify' // 对齐方式
        ],
            editor.customConfig.onchange = function (html) {
                $("#info").val(html)
            }
             editor1.customConfig.onchange = function (html) {
            $("#pub1").val(html)
         }
        editor.create();
        editor1.create();

    })
</script>
</body>
</html>
