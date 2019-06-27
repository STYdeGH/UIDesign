<%--
  Created by IntelliJ IDEA.
  User: sty
  Date: 2019/6/27
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>入口界面</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <link href="Style/amazeui.css" rel="stylesheet">
    <link href="Style/common.min.css" rel="stylesheet" type="text/css">
    <link href="Style/join.min.css" rel="stylesheet" type="text/css">
    <link href="Style/other.min.css" rel="stylesheet" type="text/css">

    <style>
        a{
            color: red;
        }
    </style>
</head>

<body class="login">
<div class="topbar">
    <div class="container">
        <div class="am-g">
            <div class="am-u-md-3">
                <div class="topbar-left">
                </div>
            </div>
            <div class="am-u-md-9">
                <div class="topbar-right am-text-right am-fr">
                    <a id="log" style="font-size:18px;position: relative;left: 85px;" href="index.jsp">登录</a>
                    <a id="reg" style="font-size:18px;position: relative;left: 100px;" href="Register.jsp">注册</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="login-container" style="position: relative;top:-50px">
    <div class="login-box"  style="opacity:0.95;width: 600px">
        <div class="logo-img">
            <img src="image/logo2_03.png" alt="" />
        </div>
        <div id="info">
            <div class="am-form">
                <input type="text" id="address" minlength="3" placeholder="请输入你的收获地址" style="border-radius: 5px;width: 460px" required/>
            </div>
            <button class="am-btn am-btn-small am-btn-secondary" onclick="Search()" style="position:relative;left:475px;top:-37px;outline: none;border-radius: 5px">搜索</button>

        </div>
    </div>
</div>

<script>
    function Search() {
        var url=encodeURI("Main.jsp?~"+"0"+"~"+"visitor"+"~"+"visitor");
        window.location.href=url;
    }
</script>
</body>

</html>

