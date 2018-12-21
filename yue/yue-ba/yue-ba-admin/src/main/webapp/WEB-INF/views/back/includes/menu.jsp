<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page-sidebar-wrapper ">
    <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu   " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" >
            <li class="nav-item start active open">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-home"></i>
                    <span class="title">控制面板</span>
                    <span class="selected"></span>
                    <span class="arrow open"></span>
                </a>
                <%--<ul class="sub-menu">--%>
                    <%--<li class="nav-item start active open">--%>
                        <%--<a href="index.html" class="nav-link ">--%>
                            <%--<i class="icon-bar-chart"></i>--%>
                            <%--<span class="title">仪表盘</span>--%>
                            <%--<span class="selected"></span>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            </li>
            <li class="heading">
                <h3 class="uppercase">功能菜单</h3>
            </li>
            <li class="nav-item  ">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-users"></i>
                    <span class="title">用户管理</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item  ">
                        <a href="/back/user/list" class="nav-link ">
                            <span class="title">用户列表</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>