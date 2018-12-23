<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <style>
        * {
            margin: 0;
        }

        .jq22-container {
            margin-top: 50px;
        }

        #div1 {
            margin: auto;
            position: relative;
        }

        .box {
            float: left;
            padding: 10px;
            border: 1px solid #ccc;
            background: #f7f7f7;
            box-shadow: 0 0 8px #ccc;
        }

        .box:hover {
            box-shadow: 0 0 10px #999;
        }

        .box img {
            width: 240px;
        }
    </style>

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


        <div class="waterfall">
            <div class="jq22-container">
                <div class="jq22-content bgcolor-3">
                    <div id="div1" style="height: 2992px;">
                        <c:forEach items="${show}" var="user">
                            <div class="box" style="opacity:0;filter:alpha(opacity=0);"><a href="/user/info?id=${user.id}"><img src="${user.picture}" alt=""></a></div>
                        </c:forEach>
                        <%--<div class="box" style="position: absolute; top: 0px; left: 130px; opacity: 1;"><a href="#"><img src="/static/upload/1.jpg" alt=""></a></div>--%>
                        <%--<div class="box" style="position: absolute; top: 0px; left: 402px; opacity: 1;"><img src="/static/upload/2.jpg" alt=""></div>--%>
                        <%--<div class="box" style="position: absolute; top: 0px; left: 674px; opacity: 1;"><img src="/static/upload/3.jpg" alt=""></div>--%>
                        <%--<div class="box" style="position: absolute; top: 0px; left: 946px; opacity: 1;"><img src="/static/upload/4.jpg" alt=""></div>--%>
                        <%--<div class="box" style="position: absolute; top: 155px; left: 946px; opacity: 1;"><img src="/static/upload/5.jpg" alt=""></div>--%>
                        <%--<div class="box" style="position: absolute; top: 276px; left: 402px; opacity: 1;"><img src="/static/upload/6.jpg" alt=""></div>--%>
                        <%--<div class="box" style="position: absolute; top: 310px; left: 946px; opacity: 1;"><img src="/static/upload/7.jpg" alt=""></div>--%>
                        <%--<div class="box" style="position: absolute; top: 365px; left: 130px; opacity: 1;"><img src="/static/upload/8.jpg" alt=""></div>--%>
                        <%--<div class="box" style="position: absolute; top: 365px; left: 674px; opacity: 1;"><img src="/static/upload/2.jpg" alt=""></div>--%>
                        <%--<div class="box" style="position: absolute; top: 416px; left: 402px; opacity: 1;"><img src="/static/upload/3.jpg" alt=""></div>--%>
                        <%--<div class="box" style="position: absolute; top: 450px; left: 946px; opacity: 1;"><img src="/static/upload/4.jpg" alt=""></div>--%>
                        <%--<div class="box" style="position: absolute; top: 581px; left: 130px; opacity: 1;"><img src="/static/upload/5.jpg" alt=""></div>--%>
                    </div>
                </div>
            </div>

        </div>


    </div>
    <!-- BEGIN FOOTER -->
    <p class="copyright-v2"> 2018 &copy; 年轻人的约会天堂
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
<%@include file="includes/chat.jsp"%>

<%@include file="includes/footer.jsp"%>
<!--wangEditor-->
<script src="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.js"></script>

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
                editor.create();

            //初始化Vue
            var vm = new Vue({
                el: '#app',
                data: {
                    unreadCount: '89',
                }
            })

            //初始化goEasy对象
            goEasy = new GoEasy({appkey: 'BC-697822f1a335419da17331bb84427a10'});

            //初始化监听接口，接受消息
            goEasy.subscribe({
                channel: sender_id,
                onMessage: function (message) {

                    $("#record").append("<div class=\"recevie\">\n" +
                        "    <div class=\"row\">\n" +
                        "        <div class=\"col-md-1\"></div>\n" +
                        "        <div class=\"col-md-11\" style=\"float: left\"><p >" + new Date() + "</p></div>\n" +
                        "    </div>\n" +
                        "    <div class=\"heard_img right\">\n" +
                        "        <img src=\"/static/images/1.jpg\">\n" +
                        "    </div>\n" +
                        "    <div style=\"width: 8px\"></div>\n" +
                        "    <div class=\"question_text clear\" style=\"max-width: 543px;\">\n" +
                        "        <p>" + message.content + "</p>\n" +
                        "        <i></i>\n" +
                        "    </div>\n" +
                        "</div>");
                }
            });


            //点击好友
            function getRecord(friendId) {
                recevier_id = friendId;
                $.ajax({
                    url: "/record/list",
                    type: "post",
                    data: {
                        "uid": sender_id,
                        "friendId": recevier_id
                    },
                    success: function (data) {
                        //返回聊天记录
                        $("#record").empty();
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].senderId == sender_id) {
                                var created = DateFormat.formatDate(new Date(data[i].created));
                                $("#record").append(" <div class=\"post in\">" + data[i].message + " </div><br/>");
                            }
                            else {
                                $("#record").append(" <div class=\"post out\">" + data[i].message + " </div><br/>");
                            }

                        }
                    }
                });


            }


            //推送消息
            function send() {
                var message = removeTAG($("#info").val());

                //清空编辑区域
                editor.txt.clear();
                goEasy.publish({
                    channel: recevier_id + "",
                    message: message,
                    onSuccess: function () {
                        $.ajax({
                            url: "/record/save",
                            type: "post",
                            data: {
                                "senderId": sender_id,
                                "recevierId": recevier_id,
                                "message": message,
                            }
                        });
                        $("#record").append("<div class=\"send\">\n" +
                            "    <div class=\"row\">\n" +
                            "        <div class=\"col-md-9\"></div>\n" +
                            "        <div class=\"col-md-3\" style=\"float: right\">\n" +
                            "            <p >17:50</p>\n" +
                            "        </div>\n" +
                            "    </div>\n" +
                            "    <div class=\"heard_img left\"><img src=\"/static/images/1.jpg\"></div>\n" +
                            "    <div style=\"width: 8px\"></div>\n" +
                            "    <div class=\"answer_text\">\n" +
                            "        <p>您可以向我提问哦</p>\n" +
                            "        <i></i>\n" +
                            "    </div>\n" +
                            "</div>");

                    }

                })
            }


            //去除富文本标签
            function removeTAG(str, len) {
                return str.replace(/<[^>]+>/g, "");
            }
        })
            //音乐播放
            audiojs.events.ready(function() {
                audiojs.createAll();
            });
    </script>

    <%--<script src="images/jquery.min(1).js"></script>--%>
    <script src="/static/assets/jquery.waterfall.js"></script>
    <script>
        var currentpage = 2;
        var respdata = null;
        $("#div1").waterfall({
            itemClass: ".box",
            minColCount: 2,
            spacingHeight: 10,
            resizeable: true,
            ajaxCallback: function(success, end) {
                if (currentpage < 10){
                    $.get("user/show",{page:currentpage},function (data) {
                        // var data = JSON.parse(data);
                        var data = data;
                        var str = "";
                        var templ = '<div class="box" style="opacity:0;filter:alpha(opacity=0);"><div class="pic"><a href="/user/info?id={{id}}"><img src="{{src}}" /></a></div></div>'

                        /*for(var i = 0; i < data.data.length; i++) {
                            str += templ.replace("{{src}}", data.data[i].src);
                        }*/
                        for(var i = 0; i < data.length; i++) {
                            str += templ.replace("{{src}}", data[i].picture).replace("{{id}}", data[i].id);
                        }
                        $(str).appendTo($("#div1"));
                        currentpage++;
                        success();
                        end();
                    });
                }

            }
        });
    </script>
</body>
</html>
