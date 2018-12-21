<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>

<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <title>约吧 | 用户信息</title>
    <%@ include file="../includes/head.jsp" %>
    <link href="/static/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="/static/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="/static/assets/global/plugins/iCheck/all.css">
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
                    <h1>用户管理</h1>
                </div>
            </div>

            <ul class="page-breadcrumb breadcrumb"></ul>

            <sys:message />

            <div class="row search-area" style="display: none;">
                <div class="col-md-12">
                    <div class="portlet light bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                <span class="caption-subject font-blue bold uppercase">高级搜索</span>
                            </div>
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <div class="horizontal-form">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">姓名</label>
                                                <input id="username" type="text" class="form-control" placeholder="姓名">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">手机</label>
                                                <input id="phone" type="text" class="form-control" placeholder="手机">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">邮箱</label>
                                                <input id="email" type="text" class="form-control" placeholder="邮箱">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-actions right">
                                    <button type="button" class="btn blue" onclick="search();"> 搜索</button>
                                </div>
                            </div>
                            <!-- END FORM-->
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN SAMPLE TABLE PORTLET-->
                    <div class="portlet light bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                <span class="caption-subject font-blue bold uppercase">用户列表</span>
                            </div>
                            <div class="actions">
                                <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;" title="搜索" onclick="$('.search-area').toggle('fast');">
                                    <i class="icon-magnifier"></i>
                                </a>
                            </div>

                        </div>

                        <div class="portlet-body">
                            <div class="table_top">
                                <a class="btn btn-circle btn-icon-only btn-default" href="/back/user/form" title="新增">
                                    <i class="icon-plus"></i>
                                </a>
                            </div>
                            <table id="dataTable" class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" class="minimal" /></th>
                                    <th> 姓名 </th>
                                    <th> 邮箱 </th>
                                    <th> 更新时间 </th>
                                    <th> 操作 </th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END SAMPLE TABLE PORTLET-->
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../../includes/footer.jsp" %>
<script src="/static/assets/global/scripts/datatable.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script src="/static/assets/apps/modal/datatables.js" type="text/javascript"></script>
<script src="/static/assets/apps/modal/dateutils.js" type="text/javascript"></script>
<script src="/static/assets/apps/modal/sweetalert.js" type="text/javascript"></script>

<!-- iCheck 1.0.1 -->
<script src="/static/assets/global/plugins/iCheck/icheck.js" type="text/javascript"></script>

<script>
    var _grid;

    $(function () {
        _grid = DataTables.initDataTable("/back/user/page", [
            {
                "data": function (row, type, set, meta) {
                    return '<input id="\' + row.id + \'" type="checkbox" class="minimal" />';
                }
            },
            {"data": "username"},
            {"data": "email"},
            {
                "data": function (row, type, set, meta) {
                    return DateUtils.format(row.updated, 'yyyy-MM-dd');
                }
            },
            {
                "data": function (row, type, set, meta) {
                    return '<a href="/back/user/form?id=' + row.id + '" class="btn default green-stripe"> 编辑 </a>&nbsp;&nbsp;' +
                        '<button class="btn default red-stripe mt-sweetalert" \n' +
                        '        data-title="确定删除当前数据项吗？" \n' +
                        '        data-type="warning" \n' +
                        '        data-show-confirm-button="true" \n' +
                        '        data-confirm-button-class="btn-danger" \n' +
                        '        data-show-cancel-button="true" \n' +
                        '        data-cancel-button-class="btn-default" \n' +
                        '        data-close-on-confirm="false" \n' +
                        '        data-close-on-cancel="false" \n' +
                        '        data-confirm-button-text=\'确定\'\n' +
                        '        data-cancel-button-text=\'取消\' \n' +
                        '        data-popup-title-success="已删除" \n' +
                        '        data-popup-title-cancel="已取消" \n' +
                        '        data-url="/user/delete?id='+ row.id +'" \n' +
                        '        >删除</button>'
                }
            }
        ]);


    });

    function search() {
        // 清理传递的参数
        _grid.clearAjaxParams();

        var username = $("#username").val();
        var phone = $("#phone").val();
        var email = $("#email").val();

        if (username.length != 0) {
            _grid.setAjaxParam("username", username);
        }

        if (phone.length != 0) {
            _grid.setAjaxParam("phone", phone);
        }

        if (email.length != 0) {
            _grid.setAjaxParam("email", email);
        }

        // 重新加载 Ajax 数据
        _grid.getDataTable().ajax.reload();


    }
</script>
</body>
</html>