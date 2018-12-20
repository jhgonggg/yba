<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0045)https://catfan.me/?tdsourcetag=s_pctim_aiomsg -->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>yueba - 社交因约吧而美好</title>
    <!--[if lt IE 9]>
    <script src="//catfan.me/vender/html5shiv.js"></script>
    <![endif]-->
    <link href="/static/assets/global.css" rel="stylesheet" type="text/css" />
    <link href="/static/assets/home.css" rel="stylesheet" type="text/css" />
    <link rel="search" type="application/opensearchdescription+xml" href="https://catfan.me/opensearch.php" title="Add Catfan search" />



    <meta name="msapplication-TileColor" content="#b53346" />
    <meta name="theme-color" content="#ffffff" />
    <script async="" src="/static/assets/analytics.js"></script>
    <script type="text/javascript" src="/static/assets/qatrix-1.1.js"></script>
    <script type="text/javascript" src="/static/assets/home.js"></script>
    <meta name="keywords" content="catfan,喵友,喵饭,猫饭,简约,图片社区,社交网络,社群網路,博客,部落格" />
    <meta property="og:title" content="Catfan - 社交因简约而美好" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="//catfan.me" />
    <meta property="og:image" content="//catfan.me/images/catfan-image-250.jpg" />
    <meta property="og:description" content="喵友是一个简单易用、清新简洁的社区。让您和好友在有爱的社区中尽情交谈吐槽，记录生活日常。" />
    <meta property="og:site_name" content="Catfan" />
    <meta property="fb:admins" content="100001162628592" />
    <meta name="apple-itunes-app" content="app-id=959824325" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <script>(function(i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] ||
            function() { (i[r].q = i[r].q || []).push(arguments)
            },
            i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
    ga('create', 'UA-15301273-1', 'catfan.me');
    ga('send', 'pageview');</script>
</head>

<body id="body" class="locale_zh">
<div id="content-main">
    <div id="content-head">
        <div class="content-background"></div>
        <div class="content-image" id="content-image-left-top"></div>
        <div class="content-image" id="content-image-left-bottom"></div>
        <div class="content-image" id="content-image-right-bottom"></div>
        <div id="content-inner-wrap">
            <a id="screen-profile">
                <div id="screen-profile-avatar"></div>
                <span id="screen-profile-nickname"></span>
                <span id="screen-profile-username"></span>
            </a>
            <a id="content-login-button" href="javascript:void(0)" onclick="login.show()">登录</a>
            <div id="logo-wrap">
                <img id="content-logo" width="100" height="100" src="/static/assets/catfan-logo-100.png" />
                <h5 id="content-slogan">社交因约吧而美好</h5></div>
            <a id="content-signup-button" href="javascript:void(0)" onclick="signup.show()">注册</a></div>
        <div id="login_wrap">
            <div id="login_box">
                <a rel="nofollow" id="login_close" href="javascript:void(0)" onclick="login.close()"></a>
                <label>用户名、手机或电子邮箱地址</label>
                <input id="login_user_name" type="text" name="loginId" class="login_input" />
                <label>密码</label>
                <input id="login_password" type="password" name="password" class="login_input" />
                <div id="login_status"></div>
                <div id="login_btn_wrap">
                    <a rel="nofollow" href="javascript:void(0)" id="login_go" onclick="login.submit()">
                        <span id="login_text">登录</span></a>
                </div>
                <a rel="nofollow" href="https://catfan.me/resetpw.php" id="forgot_pw">忘记密码？</a>
            </div>
        </div>
        <div id="signup_wrap">
            <div id="signup_box">
                <a rel="nofollow" id="signup_close" href="javascript:void(0)" onclick="signup.close()"></a>
                <h4>注册</h4>
                <div class="label-wrap">
                    <label>昵称</label>
                    <span class="signup_tips" id="nick_name_tips">一个能让别人识别到您的名字</span></div>
                <input class="signup_input" type="text" id="signup_nick_name" onkeyup="signup.check('nick_name')" onfocus="signup.focus('nick_name')" onblur="signup.blur('nick_name')" />
                <div class="label-wrap">
                    <label>用户名</label>
                    <span class="signup_tips" id="user_name_tips">唯一的用户名</span></div>
                <input type="text" class="signup_input" id="signup_user_name" onkeyup="signup.check('user_name')" onfocus="signup.focus('user_name')" onblur="signup.blur('user_name')" />
                <div id="signup_url_container">https://catfan.me/
                    <span id="signup_url_label"></span></div>
                <div class="label-wrap">
                    <label>密码</label>
                    <span class="signup_tips" id="password_tips">6 个字符以上</span></div>
                <input type="password" class="signup_input" id="signup_password" onkeyup="signup.check('password')" onfocus="signup.focus('password')" onblur="signup.blur('password')" />
                <div class="label-wrap">
                    <label>电子邮箱</label>
                    <span class="signup_tips" id="email_tips">用来联系的电子邮箱，不会公开</span></div>
                <input type="text" class="signup_input" id="signup_email" onkeyup="signup.check('email')" onfocus="signup.focus('email')" onblur="signup.blur('email')" />
                <div id="signup_tos">如您注册，您必须同意 Catfan 的
                    <a href="https://catfan.me/tos" target="_blank">服务条款</a>。</div>
                <a rel="nofollow" id="signup_submit" href="javascript:void(0)" onclick="signup.submit()">注册</a></div>
        </div>
    </div>
</div>
<div id="content-container">
    <div id="content-item-body">
        <ul id="content-item-list">
            <li>
                <a href="https://catfan.in/tomdotk/p361210">
                    <div class="content-item" style="background-image: url('https://catf.me/photos/ab69fa5dfe208c887f47124ed56b634f.jpg')"></div>
                </a>
            </li>
            <li>
                <a href="https://catfan.in/Numpkin/p361339">
                    <div class="content-item" style="background-image: url('https://catf.me/photos/a0f1436bae566aed3defdaada8e37e3a.jpg')"></div>
                </a>
            </li>
            <li>
                <a href="https://catfan.in/Numpkin/p361215">
                    <div class="content-item" style="background-image: url('https://catf.me/photos/4abf8a450c87845a9e80cda8f13eb3b4.jpg')"></div>
                </a>
            </li>
            <li>
                <a href="https://catfan.in/sosososo/p361223">
                    <div class="content-item" style="background-image: url('https://catf.me/photos/0e5c56addd48da06db81744e2406f63e.jpg')"></div>
                </a>
            </li>
            <li>
                <a href="https://catfan.in/catl/p361377">
                    <div class="content-item" style="background-image: url('https://catf.me/photos/e6721ef9e3b88710a585242c358d12ac.jpg')"></div>
                </a>
            </li>
            <li>
                <a href="https://catfan.in/catl/p361337">
                    <div class="content-item" style="background-image: url('https://catf.me/photos/9916d184147d8b0984a4443d1c13405d.jpg')"></div>
                </a>
            </li>
            <li>
                <a href="https://catfan.in/AGAM/p361375">
                    <div class="content-item" style="background-image: url('https://catf.me/photos/152408c5f9912ecac1938bd4c2e3253d.jpg')"></div>
                </a>
            </li>
            <li>
                <a href="https://catfan.in/sosososo/p361205">
                    <div class="content-item" style="background-image: url('https://catf.me/photos/395d2afacef2d4f6da1001a0d4643ebe.jpg')"></div>
                </a>
            </li>
            <li>
                <a href="https://catfan.in/tomdotk/p361350">
                    <div class="content-item" style="background-image: url('https://catf.me/photos/4d3cf026fdce92f81f8a5588bf5803b0.jpg')"></div>
                </a>
            </li>
            <li>
                <a href="https://catfan.in/manekineko/p361265">
                    <div class="content-item" style="background-image: url('https://catf.me/photos/4e756aca95e6b32ea2a3ae25e5779b16.jpg')"></div>
                </a>
            </li>
            <li>
                <a href="https://catfan.in/w2jmoe/p361330">
                    <div class="content-item" style="background-image: url('https://i.loli.net/2018/12/14/5c13bad5dd55b.jpg')"></div>
                </a>
            </li>
            <li>
                <a href="https://catfan.in/sosososo/p361261">
                    <div class="content-item" style="background-image: url('https://catf.me/photos/916594900cef05f7f3453a9c1ce88b9c.jpg')"></div>
                </a>
            </li>
        </ul>
    </div>
    <a id="explore-more" href="https://catfan.me/explore.php">探索更多</a></div>
<ul id="lang_list" class="clearfix">
    <li>
        <a rel="nofollow" onclick="languages.set('en')" href="javascript:void(0)">English</a></li>
    <li>
        <a rel="nofollow" onclick="languages.set('zh')" href="javascript:void(0)">中文简体</a></li>
    <li>
        <a rel="nofollow" onclick="languages.set('zh-tr')" href="javascript:void(0)">中文繁體</a></li>
    <li>
        <a rel="nofollow" onclick="languages.set('jp')" href="javascript:void(0)">日本語</a></li>
</ul>
<footer>
    <div id="footer_text">
        <span>Powered by Catfan. All Rights Reserved.</span>
        <a rel="nofollow" href="https://catfan.me/">首页</a>
        <a rel="nofollow" href="https://catfan.me/about">关于</a></div>
</footer>
</body>
</html>