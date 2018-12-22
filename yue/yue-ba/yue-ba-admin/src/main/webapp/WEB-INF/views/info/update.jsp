<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<!--注意此页面是首页点击美女信息或者我的信息，根据id来改变页面的值-->
<head>
    <meta charset="utf-8"/>
    <title>约吧</title>
    <%@include file="../includes/head.jsp" %>
    <!--wangEditor-->
    <link href="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.css" rel="stylesheet">

    <link href="/static/assets/css/style.css" rel="stylesheet" type="text/css"/>

    <link href="/static/assets/plugins/commons.css" rel="stylesheet" type="text/css"/>
    <%-- DropZone 插件 --%>
    <link href="/static/assets/global/plugins/dropzone/dropzone.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/assets/global/plugins/dropzone/basic.min.css" rel="stylesheet" type="text/css"/>
    <style>
        .form .form-section, .portlet-form .form-section {
            margin: 10px 0;
            padding-bottom: 5px;
            border-bottom: 1px solid #e7ecf1;
        }

        .btn-icon-only {
            height: 60px;
            width: 60px;
            text-align: center;
            padding-left: 0;
            padding-right: 0;
        }
    </style>
</head>
<body class="allyb">
<%@include file="../includes/header.jsp" %>
<!-- BEGIN CONTAINER -->

<div class="container-fluid">
    <div class="page-content page-content-popup">
        <%@include file="../includes/menu.jsp" %>
        <div class="page-fixed-main-content">
            <div class="row">
                <div class="row isotope_items">
                    <!-- item -->
                    <div class="col-md-4">
                        <a class="work-item work-image" href="#">
                            <img src="${sessionScope.user.picture}" alt="">
                            <i class="ti-image"></i>
                            <div class="work-info">
                                <h3><span>${sessionScope.user.username}</span></h3>
                                <p><span>${sessionScope.user.userInfo.personalSignature}</span></p>
                            </div>

                        </a>
                    </div>
                    <div class="col-md-8">

                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="/user/save" class="horizontal-form" method="post">
                                <div class="form-body">
                                    <h3 class="form-section">我的资料</h3>
                                    <input type="hidden" name="id" value="${sessionScope.user.id}">
                                    <input type="hidden" name="password" value="">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">用户名</label>
                                                <input type="text" name="username" id="firstName" class="form-control"
                                                       placeholder="用户名" value="${sessionScope.user.username}">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">性别</label>
                                                <select name="gender" class="form-control">
                                                    <option value="1" ${sessionScope.user.gender == 1? 'checked':''} >男</option>
                                                    <option value="0" ${sessionScope.user.gender == 0? 'checked':''}>女</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label class="control-label">生日
                                                    </label>
                                                    <input type="text" name="birth" class="form-control"
                                                           placeholder="生日"
                                                           value="<fmt:formatDate value='${sessionScope.user.birth}'></fmt:formatDate> ">
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">所在地</label>
                                                <input type="text" name="location" class="form-control"
                                                       placeholder="所在地" value="${sessionScope.user.location}"></div>
                                        </div>
                                        <!--/span-->

                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label class="control-label">职业</label>
                                                    <input type="text" name="userInfo.profession" class="form-control"
                                                           placeholder="职业"
                                                           value="${sessionScope.user.userInfo.profession}"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">电话</label>
                                                <input type="text" name="phone" class="form-control"
                                                       placeholder="电话" value="${sessionScope.user.phone}"></div>
                                        </div>
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h3 class="form-section">我的兴趣</h3>
                                            <div class="col-md-12 ">
                                                <div class="form-group">
                                                    <label>签名</label>
                                                    <input type="text" name="userInfo.personalSignature"
                                                           class="form-control"
                                                           value="${sessionScope.user.userInfo.personalSignature}">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>爱好</label>
                                                    <input type="text" name="userInfo.hobby" class="form-control"
                                                           value="${sessionScope.user.userInfo.hobby}"></div>
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <h3 class="form-section">修改头像</h3>
                                            <input id="image" name="picture" type="text" class="form-control "
                                                   placeholder="图片" value="${sessionScope.user.picture}">
                                            <div class="dropzone" id="my-awesome-dropzone">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pull-right">
                                        <button type="submit" class="btn green">
                                            保存
                                        </button>
                                        <button type="button" class="btn default " onclick="history.go(-1)">
                                            返回
                                        </button>
                                    </div>
                                </div>
                            </form>

                            <!-- END FORM-->
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
        <%--<span style="font-size: 20px;font-family: '微软雅黑 Light';color: hotpink">约</span>--%>
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
<%@include file="../includes/chat.jsp" %>

<%@include file="../includes/footer.jsp" %>
<!--wangEditor-->
<script src="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.js"></script>

<!--dropZone-->
<script src="/static/assets/global/plugins/dropzone/dropzone.min.js" type="text/javascript"></script>
<script>
    $(function () {
        //启动wangEditor
        var E = window.wangEditor;
        var editor = new E('#editor1', '#editor2');
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
            editor.customConfig.colors = [
                '#000000',
            ],
            editor.customConfig.onchange = function (html) {
                $("#info").val(html)
            }
        editor.customConfig.onblur = function (html) {
            console.log('onblur', html)
        }

        editor.create();


        // 初始化 Dropzone
        Dropzone.options.myAwesomeDropzone = {
            url: "/upload",
            paramName: "uploadFile",
            maxFiles: "1",
            maxFilesize: 2, // MB
            dictDefaultMessage: "<h4>点击或拖动添加图片</h4>",
            dictMaxFilesExceeded: "你不能上传过多图片.",
            init: function () {
                this.on("success", function (file, data) {
                    $("#image").val(data.path);
                });
            }
        };

    })
</script>
</body>
</html>
