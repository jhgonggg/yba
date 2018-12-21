<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<!--注意此页面是首页点击美女信息或者我的信息，根据id来改变页面的值-->
<head>
    <meta charset="utf-8" />
    <title>约吧</title>
    <%@include file="../includes/head.jsp"%>
    <!--wangEditor-->
    <link href="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.css" rel="stylesheet">

    <link href="/static/assets/css/style.css" rel="stylesheet" type="text/css" />

    <link href="/static/assets/plugins/commons.css" rel="stylesheet" type="text/css" />
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
<%@include file="../includes/header.jsp"%>
<!-- BEGIN CONTAINER -->

<div class="container-fluid">
    <div class="page-content page-content-popup">
        <%@include file="../includes/menu.jsp"%>
        <div class="page-fixed-main-content">
            <div class="row">
                <div class="row isotope_items">
                    <!-- item -->
                    <div class="col-md-4">
                        <a class="work-item work-image" href="/static/images/1.jpg">
                            <img src="/static/images/1.jpg" alt="">
                            <i class="ti-image"></i>
                            <div class="work-info">
                                <h3><span>${sessionScope.user.username}</span></h3>
                                <p><span>爆肝工程师</span></p>
                            </div>

                        </a>
                    </div>
                    <div class="col-md-8">

                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form class="form-horizontal" role="form">
                                <div class="form-body">
                                    <%--${user.id ==uid  ? "我的" : "个人"}--%>
                                    <h3 class="form-section">个人资料</h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">昵称:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> ${sessionScope.user.username} </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">性别:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> ${sessionScope.user.gender == 1? '男' : '女'} </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">生日:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> ${sessionScope.user.birth} </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">所在地:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static">广州天河</p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">职业:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> 学生 </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--row-->
                                    <h3 class="form-section">个人兴趣</h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">签名:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static">爆肝工程师</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">爱好:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static">篮球</p>
                                                    <p class="form-control-static">约P</p>
                                                    <p class="form-control-static">健身</p>
                                                    <p class="form-control-static"></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">交友宣言:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static">颜高活好</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </form>
                            <div class="pull-right">
                                <a href="javascript:;" class="btn btn-circle btn-icon-only">
                                    <i class="fa fa-heart" style="font-size: 30px;color: red"></i>
                                </a>
                                <a href="javascript:;" class="btn btn-circle btn-icon-only ">
                                    <i class="fa fa-close" style="font-size: 40px;color: grey"></i>
                                </a>
                            </div>
                            <%--<div class="pull-right">--%>
                            <%--<a href="/index/update"><button type="submit" class="btn green">--%>
                            <%--修改--%>
                            <%--</button></a>--%>
                            <%--<button type="button" class="btn default " onclick="history.go(-1)">--%>
                            <%--返回--%>
                            <%--</button>--%>
                            <%--</div>--%>
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
<%@include file="../includes/chat.jsp"%>

<%@include file="../includes/footer.jsp"%>
<!--wangEditor-->
<script src="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.js"></script>
<script>
    $(function () {
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

    })
</script>
</body>
</html>
