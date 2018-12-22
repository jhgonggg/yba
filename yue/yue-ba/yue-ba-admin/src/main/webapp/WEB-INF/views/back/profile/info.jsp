<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <title>约吧| 管理员个人信息</title>
    <%@ include file="../includes/head.jsp" %>
    <link href="/static/assets/global/plugins/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
    <link href="/static/assets/global/plugins/dropzone/basic.min.css" rel="stylesheet" type="text/css" />

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="/static/assets/pages/css/profile.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->

    <style>
        .control-label .required, .form-group .required{
            color: black;
        }
    </style>
</head>
<!-- END HEAD -->

<body class="page-container-bg-solid page-header-fixed page-sidebar-closed-hide-logo">
<%@ include file="../includes/header.jsp" %>

<div class="page-container">
    <%@ include file="../includes/menu.jsp" %>

    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="page-head">
                <div class="page-title">
                    <h1>个人信息
                        <small></small>
                    </h1>
                </div>
            </div>

            <ul class="page-breadcrumb breadcrumb"></ul>

            <div class="alert ${message == null ? 'display-hide' : message.contains('成功') ? 'alert-success' : 'alert-danger'}">
                <button class="close" data-close="alert"></button>
                <span> ${message} </span>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="profile-sidebar">
                        <!-- PORTLET MAIN -->
                        <div class="portlet light profile-sidebar-portlet bordered">
                            <div class="profile-userpic">
                                <img src="${sessionScope.admin.picture}" class="img-responsive" alt="">
                            </div>

                            <div class="profile-usertitle">
                                <div class="profile-usertitle-name"> ${sessionScope.admin.username} </div>
                                <div class="profile-usertitle-job"> ${sessionScope.admin.email} </div>
                            </div>
                        </div>
                        <!-- END PORTLET MAIN -->
                        <!-- PORTLET MAIN -->
                        <div class="portlet light bordered">
                            <div>
                                <h4 class="profile-desc-title">关于 ${sessionScope.admin.username}</h4>
                                <span class="profile-desc-text"> 这个家伙很懒，什么都没有留下 </span>
                            </div>
                        </div>
                        <!-- END PORTLET MAIN -->
                    </div>

                    <div class="profile-content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="portlet light bordered">
                                    <div class="portlet-title tabbable-line">
                                        <div class="caption caption-md">
                                            <i class="icon-globe theme-font hide"></i>
                                            <span class="caption-subject font-blue-madison bold uppercase">用户信息</span>
                                        </div>
                                        <ul class="nav nav-tabs">
                                            <li class="active">
                                                <a href="#tab_1_1" data-toggle="tab">个人信息</a>
                                            </li>
                                            <li>
                                                <a href="#tab_1_2" data-toggle="tab">上传头像</a>
                                            </li>
                                            <li>
                                                <a href="#tab_1_3" data-toggle="tab">修改密码</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="tab-content">
                                            <!-- PERSONAL INFO TAB -->
                                            <div class="tab-pane active" id="tab_1_1">
                                                <form id="inputForm" role="form" action="/back/profile/save" method="post">
                                                    <input type="hidden" name="id" value="${sessionScope.admin.id}" />
                                                    <div class="form-group">
                                                        <label class="control-label">姓名</label>
                                                        <input type="text" id="username" name="username" placeholder="${sessionScope.admin.username}" class="form-control required" value="${sessionScope.user.username}" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">手机</label>
                                                        <input type="text" id="phone" name="phone" placeholder="${sessionScope.admin.phone}" class="form-control required mobile" value="${sessionScope.user.phone}" /> </div>
                                                    <div class="form-group">
                                                        <label class="control-label">邮箱</label>
                                                        <input type="text" id="email" name="email" placeholder="${sessionScope.admin.email}" class="form-control required email" value="${sessionScope.user.email}" /> </div>
                                                    <div class="margiv-top-10">
                                                        <button type="submit" class="btn green"> 保存 </button>
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- END PERSONAL INFO TAB -->
                                            <!-- CHANGE AVATAR TAB -->
                                            <!-- CHANGE AVATAR TAB -->
                                            <div class="tab-pane" id="tab_1_2">
                                                <form action="/back/profile/save" method="post">
                                                    <input id="picture" type="hidden" name="picture" value="${sessionScope.admin.picture}"/>
                                                    <input type="hidden" name="username" value="${sessionScope.admin.username}"/>
                                                    <input type="hidden" name="email" value="${sessionScope.admin.email}"/>
                                                    <input type="hidden" name="id" value="${sessionScope.admin.id}"/>
                                                <div action="/upload" class="dropzone dropzone-file-area " id="my-dropzone" style="width: 500px; margin-top: 50px;">
                                                    <h3 class="sbold">拖文件至此或点击此处上传文件</h3>
                                                    <p> 上传文件 </p>
                                                </div>
                                                    <input type="submit" value="确定"/>
                                                </form>
                                            </div>
                                            <!-- END CHANGE AVATAR TAB -->
                                            <!-- END CHANGE AVATAR TAB -->
                                            <!-- CHANGE PASSWORD TAB -->
                                            <div class="tab-pane" id="tab_1_3">
                                                <form id="pwdForm" action="/back/profile/modify/password" method="post">
                                                    <input type="hidden" name="id" value="${sessionScope.admin.id}" />
                                                    <div class="form-group">
                                                        <label class="control-label">当前密码</label>
                                                        <input id="oldPassword" name="oldPwd" type="password" class="form-control required" /> </div>
                                                    <div class="form-group">
                                                        <label class="control-label">新密码</label>
                                                        <input id="newPassword" name="newPwd" type="password" class="form-control required" /> </div>
                                                    <div class="form-group">
                                                        <label class="control-label">确认密码</label>
                                                        <input id="repeatPassword" name="repeatPwd" type="password" class="form-control required" /> </div>
                                                    <div class="margin-top-10">
                                                        <button type="submit" class="btn green"> 保存 </button>
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- END CHANGE PASSWORD TAB -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/static/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery-validation/js/localization/messages_zh.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="/static/assets/apps/modal/validation.js" type="text/javascript"></script>

<script src="/static/assets/global/plugins/dropzone/dropzone.min.js" type="text/javascript"></script>
<script>
    $(function () {
        Validation.initValidation("pwdForm", {
            repeatPassword: {
                equalTo: "#newPassword"
            }
        });


        Dropzone.options.myDropzone = {
            dictDefaultMessage: "",
            paramName: "uploadFile",
            maxFilesize: 2,
            init:function(){
                this.on("success", function (file, data) {
                    $("#picture").val(data.path);
                });
            }
        };
    });
</script>
<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>