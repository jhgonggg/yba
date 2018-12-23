var domain = document.domain,
    rootURL = "//" + domain,
    IMG_DOMAIN = "//catf.me",
    text = {
        "pw-str0": {
            en: "Too short",
            zh: "\u592a\u77ed",
            "zh-tr": "\u592a\u77ed",
            jp: "\u77ed\u3059\u304e\u307e\u3059"
        },
        "pw-str1": {
            en: "Poor",
            zh: "\u4e00\u822c",
            "zh-tr": "\u4e00\u822c",
            jp: "\u5f31\u3044"
        },
        "pw-str2": {
            en: "Good",
            zh: "\u597d",
            "zh-tr": "\u597d",
            jp: "\u826f\u597d"
        },
        "pw-str3": {
            en: "Strong",
            zh: "\u5f3a",
            "zh-tr": "\u5f37",
            jp: "\u5f37\u3044"
        },
        "not-email": {
            en: "It's not an email address",
            zh: "\u8fd9\u4e0d\u662f\u4e00\u4e2a\u7535\u5b50\u90ae\u7bb1\u5730\u5740",
            "zh-tr": "\u9019\u4e0d\u662f\u4e00\u500b\u96fb\u5b50\u4fe1\u7bb1\u5730\u5740",
            jp: "\u30e1\u30fc\u30eb\u30a2\u30c9\u30ec\u30b9\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"
        },
        "name-ok": {
            en: "This name is available",
            zh: "\u6b64\u7528\u6237\u540d\u53ef\u7528",
            "zh-tr": "\u6b64\u540d\u7a31\u53ef\u7528",
            jp: "\u3053\u306e\u540d\u524d\u306f\u5165\u624b\u53ef\u80fd\u3067\u3059"
        },
        "name-used": {
            en: "This name has been used.",
            zh: "\u6b64\u7528\u6237\u540d\u5df2\u7528",
            "zh-tr": "\u6b64\u540d\u7a31\u5df2\u88ab\u4f54\u7528",
            jp: "\u30e6\u30fc\u30b6\u30fc\u540d\u306f\u3082\u3046\u4f7f\u308f\u308c\u3066\u3044\u307e\u3059\u3002"
        },
        "email-used": {
            en: "This email has been used.",
            zh: "\u6b64\u7535\u5b50\u90ae\u7bb1\u5730\u5740\u5df2\u7528",
            "zh-tr": "\u6b64\u96fb\u5b50\u4fe1\u7bb1\u5730\u5740\u5df2\u88ab\u4f54\u7528",
            jp: "\u96fb\u5b50\u30e1\u30fc\u30eb\u306f\u3082\u3046\u4f7f\u308f\u308c\u3066\u3044\u307e\u3059"
        },
        "name-format": {
            en: "Please use letter, number and '_'",
            zh: "\u8bf7\u7528\u82f1\u6587\u5b57\u6bcd\u3001\u6570\u5b57\u6216\u4e0b\u5212\u7ebf",
            "zh-tr": "\u8acb\u4f7f\u7528\u82f1\u6587\u5b57\u6bcd\u3001\u6578\u5b57\u6216\u5e95\u7dda",
            jp: "\u6587\u5b57\u3068\u6570\u5b57\u3092\u4f7f\u7528\u3057\u3066\u304f\u3060\u3055\u3044"
        },
        checking: {
            en: "Checking",
            zh: "Checking",
            "zh-tr": "\u6b63\u5728\u6aa2\u67e5",
            jp: "\u30c1\u30a7\u30c3\u30af\u4e2d"
        },
        login: {
            en: "Log In",
            zh: "\u767b\u5f55",
            "zh-tr": "\u767b\u5165",
            jp: "\u30ed\u30b0\u30a4\u30f3"
        },
        cancel: {
            en: "Cancel",
            zh: "\u53d6\u6d88",
            "zh-tr": "\u53d6\u6d88",
            jp: "\u30ad\u30e3\u30f3\u30bb\u30eb"
        },
        login_fail: {
            en: "Invalid name or password",
            zh: "\u7528\u6237\u540d\u6216\u5bc6\u7801\u4e0d\u6b63\u786e",
            "zh-tr": "\u4f7f\u7528\u8005\u540d\u7a31\u6216\u5bc6\u78bc\u4e0d\u6b63\u78ba",
            jp: "\u30d1\u30b9\u30ef\u30fc\u30c9\u304c\u6b63\u3057\u304f\u3042\u308a\u307e\u305b\u3093"
        },
        close: {
            en: "Close",
            zh: "\u5173\u95ed",
            "zh-tr": "\u95dc\u9589",
            jp: "\u9589\u3058\u308b"
        },
        upgrade_browser: {
            en: "Upgrade your browser, to enjoy better interface and experience.",
            zh: "\u5347\u7ea7\u60a8\u7684\u6d4f\u89c8\u5668\u4ee5\u4eab\u53d7\u66f4\u597d\u7684\u754c\u9762\u548c\u4f53\u9a8c\u3002",
            "zh-tr": "\u5347\u7d1a\u60a8\u7684\u700f\u89bd\u5668\u4ee5\u4eab\u53d7\u66f4\u597d\u7684\u4ecb\u9762\u8207\u9ad4\u9a57\u3002",
            jp: "\u3088\u308a\u826f\u3044\u30a4\u30f3\u30bf\u30fc\u30d5\u30a7\u30fc\u30b9\u3068\u7d4c\u9a13\u3092\u697d\u3057\u3080\u305f\u3081\u306b\u3001\u30d6\u30e9\u30a6\u30b6\u3092\u30a2\u30c3\u30d7\u30b0\u30ec\u30fc\u30c9"
        },
        signup: {
            en: "Sign Up",
            zh: "\u6ce8\u518c",
            "zh-tr": "\u8a3b\u518a",
            jp: "\u30b5\u30a4\u30f3\u30a4\u30f3"
        },
        signup_loading: {
            en: "Creating account...",
            zh: "\u5e10\u53f7\u521b\u5efa\u4e2d",
            "zh-tr": "\u6b63\u5728\u5efa\u7acb\u5e33\u865f",
            jp: "\u30a2\u30ab\u30a6\u30f3\u30c8\u306e\u4f5c\u6210\u4e2d"
        }
    };
(function() {
    var a = $cookie.get("lang"),
        b;
    for(b in text) text[b] = text[b][a]
})();
$ready(function() {
    ($browser.msie6 || $browser.msie7 || $browser.msie8) && $append(document.body, '<div id="old_browser"><a href="//' + domain + '/upgradebrowser.php">' + text.upgrade_browser + '</a><span id="close_old_browser">[<a href="javascript:void(0)" onclick="$hide($(\'old_browser\'), 500);">' + text.close + "</a>]</span></div>");
    if(null != $cookie.get("auth_token")) {
        var a = $cookie.get("user_id"),
            b = $cookie.get("avatar_id");
        $hide($id("content-login-button content-signup-button"));
        $show($("screen-profile"));
        $css.set($("screen-profile-avatar"), "backgroundImage", "url(" + IMG_DOMAIN + "/avatar/" + b + "_" + a + "_n.jpg)");
        /*$text($("screen-profile-nickname"), $cookie.get("nickname"));*/
        $text($("screen-profile-username"), "@" + $cookie.get("user_name"));
        $("screen-profile").href = rootURL + "/" + $cookie.get("user_name")
    }
});
var languages = {
        set: function(a) {
            $cookie.set("lang", a, 720);
            location.reload()
        }
    },
    login = {
        show: function() {
            $hide($id("content-inner-wrap"));
            $className.add($id("login_wrap"), "displayed")
        },
        close: function() {
            $show($id("content-inner-wrap"));
            $className.remove($id("login_wrap"), "displayed")
        },
        submit: function() {
            $className.add($("login_go"), "loading");
            $ajax(rootURL + ":8080/login", {
                data: {
                    loginId: $("login_user_name").value,
                    password: $("login_password").value
                },
                success: function(a) {
                    a == "1" ? (window.location.href="/main") : a != "3" ? ($text($("login_status"), text.login_fail), $show($("login_status"))) : ($text($("login_status"), "管理员请登录后台"), $show($("login_status")));
                    $className.remove($("login_go"), "loading")
                }
            })
        }
    },
    signup = {
        focus: function(a) {
            !$className.has($(a + "_tips"), "on") && 1 != $data.get($("signup_" + a), "checked") && $show($(a + "_tips"), 500)
        },
        blur: function(a) {
            $className.has($(a + "_tips"), "on") || $hide($(a + "_tips"), 500)
        },
        show: function() {
            $hide($id("content-inner-wrap"));
            $className.add($id("signup_wrap"), "displayed")
        },
        close: function() {
            $show($id("content-inner-wrap"));
            $className.remove($id("signup_wrap"), "displayed")
        },
        check_suc: function(a) {
            $("signup_" + a).style.backgroundImage = "url(/static/assets/images/ok.png)";
            $data.set($("signup_" + a), "checked", "true");
            $className.remove($(a + "_tips"), "on");
            $className.remove($(a + "_tips"), "error on")
        },
        check_fail: function(a) {
            $("signup_" + a).style.backgroundImage = "url(/static/assets/images/error.png)";
            $data.set($("signup_" + a), "checked", "false");
            $className.add($(a + "_tips"), "error on")
        },
        check: function(a) {
            var b = $("signup_" + a),
                d = $(a + "_tips"),
                c = b.value,
                e = /[^A-Za-z0-9_]{1}/,
                f = /\w+@[0-9a-zA-Z_]+?\.[a-zA-Z]{2,6}/;
            "user_name" === a && ($text($("signup_url_label"), c), "" === c && ($("signup_url_label").innerHTML = ""));
            /*"nick_name" === a && (0 != c.length ? signup.check_suc(a) : signup.check_fail(a));*/
            "user_name" === a && (0 == c.length ? signup.check_fail(a) : /*!e.test(c) && 3 < c.length ?*/ ($text(d, "检测中"), $style.set(b, "backgroundImage", "")  ,$ajax(rootURL + ":8080/user/check", {
                data: {
                    type: "user_name",
                    user_name: c
                },
                success: function(b) {
                    b==1 ? ($text(d, text["name-ok"]), signup.check_suc(a)) : ($text(d, "此用户名已用"), signup.check_fail(a))
                }
            }))/* : ($text(d, text["name-format"]), signup.check_fail(a))*/);
            "password" === a && (0 == c.length ? signup.check_fail(a) : 5 >= c.length ? ($text(d, text["pw-str0"]), signup.check_fail(a)) : ($text(d, 10 >= c.length ? text["pw-str1"] : 15 >= c.length ? text["pw-str2"] : text["pw-str3"]), signup.check_suc(a)));
            "email" === a && (0 == c.length ? signup.check_fail(a) : f.test(c) ? ($text(d, text.checking + "...") ,$ajax(rootURL + ":8080/user/check", {
                data: {
                    type: "email",
                    email: c
                },
                success: function(b) {
                    b==1 ? ($text(d, ""), signup.check_suc(a), $hide(d, 500)) : ($text(d, text["email-used"]), signup.check_fail(a))
                }
            })) : ($text(d, text["not-email"]), signup.check_fail(a)))
        },
        submit: function() {
            var a = $("signup_submit");
            // signup.check("nick_name");
            signup.check("user_name");
            signup.check("password");
            signup.check("email");
            /*$data.get($("signup_nick_name"), "checked") &&*/ $data.get($("signup_user_name"), "checked") && $data.get($("signup_password"), "checked") && $data.get($("signup_email"), "checked") && ($className.add(a, "loading"), $text(a, text.signup_loading), $ajax(rootURL + ":8080/user/register", {
                data: {
                    // nick_name: $("signup_nick_name").value,
                    username: $("signup_user_name").value,
                    password: $("signup_password").value,
                    email: $("signup_email").value,
                    gender: $("gender").value,
                },
                success: function(b) {
                    $className.remove(a, "loading");
                    $text(a, text.signup);
                    b && (/*$cookie.set({
                        user_id: b.user_id,
                        user_name: b.user_name,
                        avatar_id: b.avatar_id,
                        /!*nickname: b.nickname,*!/
                        auth_token: b.auth_token,
                        "new": "Y"
                    }, 360), $cookie.set("is_registered", "true", .04),*/ location.href = rootURL + ":8080/login")
                }
            }))
        }
    };