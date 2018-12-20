<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8" />
    <title>约吧</title>
    <%@include file="includes/head.jsp"%>
    <link href="/static/assets/plugins/commons.css" rel="stylesheet" type="text/css"/>
    <!--wangEditor-->
    <link href="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.css" rel="stylesheet">
</head>
<body class="allyb">
    <%@include file="includes/header.jsp"%>
<!-- BEGIN CONTAINER -->

<div class="container-fluid">
    <div class="page-content page-content-popup">
       <%@include file="includes/menu.jsp"%>
        <div class="page-fixed-main-content">
            <!-- BEGIN PAGE BASE CONTENT -->
            <!--图表-->
            <div class="row">
                <div class="portlet light bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-bar-chart font-dark hide"></i>
                            <span class="caption-subject font-dark bold uppercase">约会成功人数</span>
                            <span class="caption-helper">寻找你的爱情，摧毁你的三观</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div id="site_statistics_loading" style="display: none;">
                            <img src="/static/assets/global/img/loading.gif" alt="loading"> </div>
                        <div id="site_statistics_content" class="display-none" style="display: block;">
                            <div id="site_statistics" class="chart" style="padding: 0px; position: relative;">
                                <canvas class="flot-base" width="789" height="300" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 789px; height: 300px;">
                                </canvas>
                                <div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
                                    <div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
                                        <div style="position: absolute; max-width: 69px; top: 285px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 11px; text-align: center;">
                                            02/2018</div>
                                        <div style="position: absolute; max-width: 69px; top: 285px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 102px; text-align: center;">
                                            03/2018</div>
                                        <div style="position: absolute; max-width: 69px; top: 285px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 193px; text-align: center;">
                                            04/2018</div>
                                        <div style="position: absolute; max-width: 69px; top: 285px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 285px; text-align: center;">
                                            05/2018</div>
                                        <div style="position: absolute; max-width: 69px; top: 285px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 376px; text-align: center;">
                                            06/2018</div>
                                        <div style="position: absolute; max-width: 69px; top: 285px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 467px; text-align: center;">
                                            07/2018</div>
                                        <div style="position: absolute; max-width: 69px; top: 285px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 559px; text-align: center;">
                                            08/2018</div>
                                        <div style="position: absolute; max-width: 69px; top: 285px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 650px; text-align: center;">
                                            09/2018</div>
                                        <div style="position: absolute; max-width: 69px; top: 285px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 742px; text-align: center;">
                                            10/2018</div>
                                    </div>
                                    <div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div style="position: absolute; top: 273px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 22px; text-align: right;">
                                            0</div>
                                        <div style="position: absolute; top: 220px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 1px; text-align: right;">
                                            1000</div>
                                        <div style="position: absolute; top: 166px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 1px; text-align: right;">
                                            2000</div>
                                        <div style="position: absolute; top: 113px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 1px; text-align: right;">
                                            3000</div>
                                        <div style="position: absolute; top: 59px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 1px; text-align: right;">
                                            4000</div>
                                        <div style="position: absolute; top: 6px; font: small-caps 400 11px/14px 'Open Sans', sans-serif; color: rgb(111, 123, 138); left: 1px; text-align: right;">
                                            5000</div>
                                    </div>
                                </div>
                                <canvas class="flot-overlay" width="789" height="300" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 789px; height: 300px;"></canvas></div>
                        </div>
                    </div>
                </div>
                <!-- END PORTLET-->
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
<%@include file="includes/chat.jsp"%>

<%@include file="includes/footer.jsp"%>
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
