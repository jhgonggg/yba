<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <title>约吧| 用户管理</title>
    <%@ include file="../includes/head.jsp" %>

    <style>
        .control-label .required, .form-group .required{
            color: black;
        }
    </style>
</head>
<!-- END HEAD -->

<body class="page-container-bg-solid page-header-fixed page-sidebar-closed-hide-logo">
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">


<div class="page-container">
    <%@ include file="../includes/menu.jsp" %>

    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="page-head">
                <div class="page-title">
                    <h1>用户管理</h1>
                </div>
            </div>

            <ul class="page-breadcrumb breadcrumb"></ul>

            <%--<sys:message />--%>
            <div class="alert ${result == null ? 'display-hide' : 'alert-danger'}">
                <button class="close" data-close="alert"></button>
                <span> 数据验证失败 </span>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                <span class="caption-subject font-blue bold uppercase">${requestScope.user.id == null ? '新增' : '编辑'}用户</span>
                            </div>
                        </div>
                        <div class="portlet-body form">

                            <!-- BEGIN FORM-->
                            <form id="inputForm" action="/back/user/save" method="post" class="form-horizontal">
                                <input type="hidden" name="id" value="${requestScope.user.id}" />



                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">姓名</label>
                                                <div class="col-md-9">
                                                    <input name="username" type="text" class="form-control required" placeholder="姓名" value="${requestScope.user.username}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${requestScope.user.id==null}">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">密码</label>
                                                <div class="col-md-9">
                                                    <input name="password" type="password"
                                                           class="form-control ${requestScope.user.id == null ? 'required' : ''}"
                                                           placeholder="密码">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:if>
                                    <c:if test="${requestScope.user.id!=null}">

                                        <%--<div class="row">--%>
                                            <%--<div class="col-md-6">--%>
                                                <%--<div class="form-group">--%>
                                                    <%--<label class="control-label col-md-3">生日</label>--%>
                                                    <%--<div class="col-md-9">--%>
                                                        <%--<input name="birth" type="text" id="datepicker" class="form-control required " placeholder="生日" value="${requestScope.user.birth}" />--%>
                                                    <%--</div>--%>
                                                <%--</div>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">电话</label>
                                                    <div class="col-md-9">
                                                        <input name="phone" type="text" class="form-control required mobile" placeholder="手机" value="${requestScope.user.phone}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">地址</label>
                                                <div class="col-md-9">
                                                    <input name="location" type="text" class="form-control required " placeholder="地址" value="${requestScope.user.location}">
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    </c:if>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">邮箱</label>
                                                <div class="col-md-9">
                                                    <input name="email" type="text" class="form-control required email" placeholder="邮箱" value="${requestScope.user.email}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">性别</label>
                                                <div class="col-md-9">
                                                    <select name="gender" class="form-control">
                                                        <option value="1" ${requestScope.user.gender ==1?'selected':''}>男</option>
                                                        <option value="0" ${requestScope.user.gender ==0?'selected':''}>女</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                 </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <button type="submit" class="btn blue">提交</button>
                                                    <button type="button" class="btn default" onclick="history.go(-1);">返回</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6"> </div>
                                    </div>
                                </div>
                            </form>
                            <!-- END FORM-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@ include file="../includes/footer.jsp" %>
<script src="/static/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery-validation/js/localization/messages_zh.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="/static/assets/apps/modal/validation.js" type="text/javascript"></script>


<script>
    $( function() {
        $('#datepicker').datepicker({
            dateFormat: 'yy-mm-dd'
        });

            console.log("22..");
    } );


</script>


</body>
</html>