<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0065)http://www.17sucai.com/preview/1266961/2018-06-19/3007/index.html -->
<html lang="zxx"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="keywords" content="">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Meta tag Keywords -->
    <!-- css files -->
    <link rel="stylesheet" href="/static/assets/loginassets/style.css" type="text/css" media="all">
    <!-- Style-CSS -->
    <link rel="stylesheet" href="/static/assets/loginassets/fontawesome-all.css">
    <!-- Font-Awesome-Icons-CSS -->
    <!-- //css files -->
    <!-- web-fonts -->
    <link href="/static/assets/loginassets/css" rel="stylesheet">
    <%--<link href="/static/assets/loginassets/css(1)" rel="stylesheet">--%>
    <!-- //web-fonts -->

    <%--<link href="/static/assets/css/components-rounded.min.css" rel="stylesheet">--%>
    <%--<link href="/static/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />--%>


</head>

<body>
<!-- bg effect -->
<div id="bg">
    <canvas width="1349" height="555"></canvas>
    <canvas width="1349" height="555"></canvas>
    <canvas width="1349" height="555"></canvas>
</div>
<!-- //bg effect -->
<!-- title -->
<h1>约吧管理员登陆</h1>
<!-- //title -->
<!-- content -->
<div class="sub-main-w3">
    <form action="/back/login" method="post">
        <h2>登陆
            <i class="fas fa-level-down-alt"></i>
        </h2>

        <%--<div class="alert ${message == null ? 'display-hide' : message.contains('成功') ? 'alert-success' : 'alert-danger'}">--%>
            <%--<button class="close" data-close="alert"></button>--%>
            <%--<span> ${message} </span>--%>
        <%--</div>--%>

        <%--<div class="form-style-agile">--%>
            <%--<div id="msg" style="display: none" class="alert alert-danger &lt;%&ndash;${message == null ? 'display-hide' : ''}&ndash;%&gt;">--%>
                <%--<button class="close" data-close="alert"></button>--%>
                <%--1111111111--%>
            <%--</div>--%>
        <div class="form-style-agile">
            <label>
                <i class="fas fa-user"></i>
                用户名
            </label>
            <input placeholder="用户名" id="name" name="loginId" type="text" required="">
        </div>
        <div class="form-style-agile">
            <label>
                <i class="fas fa-unlock-alt"></i>
                密码
            </label>
            <input placeholder="密码" id="password" name="password" type="password" required="">
        </div>
        <!-- checkbox -->
        <div class="wthree-text">
            <ul>
                <!--<li>
                    <label class="anim">
                        <input type="checkbox" class="checkbox" required="">
                        <span>记住密码?</span>
                    </label>
                </li>-->
                <li>
                    <a href="#">忘记密码?</a>
                </li>
            </ul>
        </div>
        <!-- //checkbox -->
        <input type="submit" value="登陆" >
    </form>
</div>
<!-- //content -->

<!-- copyright -->
<div class="footer">
    <p>Copyright © 2018.Company name yueba reserved.</p>
</div>
<!-- //copyright -->

<!-- Jquery -->
<script src="/static/assets/loginassets/jquery-3.3.1.min.js"></script>
<!-- //Jquery -->

<!-- effect js -->
<script src="/static/assets/loginassets/canva_moving_effect.js"></script>
<!-- //effect js -->

<script >
    // function login() {
    //     var name=$("#name").val();
    //     var password=$("#password").val();
    //     $.post("/login",{"loginId":name,"password":password},function(data){
    //         if(data==0){
    //             alert("用户名或密码错误")
    //         }
    //         else if(data==3){
    //             location.href="/back/main";
    //         }else{
    //             alert("无权限访问")
    //         }
    //     })


   //}
</script>



</body></html>