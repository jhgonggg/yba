<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>--%>

<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <title>约吧 | 用户管理</title>
    <%@ include file="includes/head.jsp" %>
</head>
<!-- END HEAD -->

<body class="page-container-bg-solid page-header-fixed page-sidebar-closed-hide-logo">
<%@ include file="includes/header.jsp" %>

<div class="page-container">
    <%@ include file="includes/menu.jsp" %>

    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="page-head">
                <div class="page-title">
                    <h1>用户信息
                        <small>站点统计信息</small>
                    </h1>
                </div>
            </div>

            <ul class="page-breadcrumb breadcrumb"></ul>

            <%--<sys:message />--%>

            <div class="row">
                <div class="col-md-12">
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>