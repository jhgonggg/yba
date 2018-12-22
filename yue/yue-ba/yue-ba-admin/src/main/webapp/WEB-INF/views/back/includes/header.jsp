<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner ">
        <!-- BEGIN LOGO -->
        <div class="page-logo">
            <a href="/main">
                <img src="/static/assets/layouts/layout4/img/logo-light.png" alt="logo" class="logo-default" /> </a>
            <div class="menu-toggler sidebar-toggler">
                <!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
            </div>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
        <!-- END RESPONSIVE MENU TOGGLER -->

        <!-- BEGIN PAGE TOP -->
        <div class="page-top">
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown dropdown-user dropdown-dark">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <span class="username username-hide-on-mobile"> ${sessionScope.admin.username} </span>
                            <img alt="" class="img-circle" src="${sessionScope.admin.picture}" /> </a>
                        <ul class="dropdown-menu dropdown-menu-default">
                            <li>
                                <a href="/back/profile/info">
                                    <i class="icon-user"></i> 个人信息 </a>
                            </li>
                            <li class="divider"> </li>
                            <li>
                                <a href="/back/logout">
                                    <i class="icon-key"></i> 注销 </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                    <!-- BEGIN QUICK SIDEBAR TOGGLER -->
                    <%--<li class="dropdown dropdown-extended quick-sidebar-toggler">--%>
                        <%--<span class="sr-only">Toggle Quick Sidebar</span>--%>
                        <%--<i class="icon-logout"></i>--%>
                    <%--</li>--%>
                    <!-- END QUICK SIDEBAR TOGGLER -->
                </ul>
            </div>
            <!-- END TOP NAVIGATION MENU -->
        </div>
        <!-- END PAGE TOP -->
    </div>
    <!-- END HEADER INNER -->
</div>
<!-- END HEADER -->

<div class="clearfix"> </div>