<%--
  Created by IntelliJ IDEA.
  User: DMXS
  Date: 2018/12/18
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="page-header">
    <nav class="navbar" role="navigation">
        <div class="container-fluid">
            <div class="havbar-header">
                <!-- BEGIN LOGO -->
                <a id="index" class="navbar-brand" href="/main">
                    <span style="font-family: '楷体'; font-size: 40px; color: hotpink;">约</span>
                    <i class="fa fa-heart" style="color: #c93756;">

                    </i>
                    <span style="font-family: '楷体'; font-size: 40px; color: whitesmoke;">吧</span>
                </a>
                <!-- END LOGO -->
                <!-- BEGIN TOPBAR ACTIONS -->
                <div class="topbar-actions">

                    <div style="float: left;padding-top: 10px">
                        <audio src="/static/assets/mp3/fenhong.mp3" preload="auto"></audio>
                    </div>

                    <div class="btn-group-notification btn-group" id="header_notification_bar">
                        <button type="button" class="btn md-skip dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <span class="badge" style="color: gray">${sessionScope.user.username}</span>
                        </button>
                    </div>

                    <!-- END GROUP NOTIFICATION -->
                    <!-- BEGIN USER PROFILE -->
                    <div class="btn-group-img btn-group">
                        <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <img src="${sessionScope.user.picture}" alt=""> </button>
                        <ul class="dropdown-menu-v2" role="menu">


                        <li>
                                <a href="/logout">
                                    <i class="icon-key"></i>注销 </a>
                            </li>
                        </ul>
                    </div>
                    <!-- END USER PROFILE -->
                </div>
                <!-- END TOPBAR ACTIONS -->
            </div>
        </div>
        <!--/container-->
    </nav>
</header>
