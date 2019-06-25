<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019-02-17
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!--
<script src="JS/amazeui.js"></script>
-->
<link href="Style/admin.css" rel="stylesheet" type="text/css">
<link href="Style/amazeui.css" rel="stylesheet" type="text/css">
<link href="Style/personal.css" rel="stylesheet" type="text/css">
<link href="Style/infstyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="JS/Member.js"></script>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <title>会员个人中心</title>
</head>
<body onload="memberinfo()">
<%--
会员信息：用户ID、用户密码、电话、姓名、送餐地点（可多个）、邮箱
历史订单（list）、当前订单、账号、账号余额、会员级别
--%>

<!--头 -->
<header style="background-color: #68c6de;width: 1403px;height: 40px">
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <div class="am-container header">

                <ul class="message-r">
                    <div class="topMessage home">
                        <p id="logoP" style="font-family:Times New Roman,Monospace,sans-serif;font-size:2rem;position:relative;left:-950px;top:3px;color: white;font-weight: bolder">YUMMY</p>
                    </div>
                    <div class="topMessage home">
                        <!--<div class="menu-hd"><a onclick="Logout()" target="_top" class="h" style="position:relative;left:20px;font-weight:bold;color: palevioletred">退出</a></div>-->
                        <button onclick="Logout()" class="am-btn am-btn-small am-btn-warning" style="outline: none;border-radius: 5px;position:relative;top:6px;left:40px;">
                            <i class="am-icon-sign-out"></i>
                            退出
                        </button>
                    </div>
                    <div class="topMessage home">
                        <!--<div class="menu-hd"><a onclick="DeleteMember()" target="_top" class="h" style="position:relative;left:30px;font-weight: bold;color: palevioletred">注销</a></div>-->
                        <button onclick="DeleteMember()" class="am-btn am-btn-small am-btn-default" style="outline: none;border-radius: 5px;position:relative;top:6px;left:55px;">
                            <i class="am-icon-frown-o"></i>
                            注销
                        </button>
                    </div>
                </ul>
            </div>
            <!--悬浮搜索框-->
        </div>
        </div>
    </article>

</header>

<div class="center">
    <div class="col-main">
        <div class="main-wrap">
            <div class="user-info">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf">
                        <strong class="am-text-danger am-text-lg">基本信息</strong>
                        &nbsp
                        <button class="am-btn am-btn-danger" onclick="Edit()" id="save">保存</button></div>
                </div>
                <hr/>
                <div class="info-main">
                    <div class="am-form am-form-horizontal">
                        <div class="am-form-group">
                            <label for="id" class="am-form-label">ID：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="id"/>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="name" class="am-form-label">昵称：</label>
                            <div class="am-form-content">
                                <input type="text" id="name"/>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="password" class="am-form-label">密码：</label>
                            <div class="am-form-content">
                                <input type="password" id="password"/>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="phone" class="am-form-label">电话：</label>
                            <div class="am-form-content">
                                <input type="text" id="phone"/>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="email" class="am-form-label">邮箱：</label>
                            <div class="am-form-content">
                                <input type="text" id="email"/>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="account" class="am-form-label">支付账号：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="account"/>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="balance" class="am-form-label">支付余额：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="balance"/>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="credit" class="am-form-label">会员积分：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="credit"/>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="level" class="am-form-label">会员级别：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="level"/>
                            </div>
                        </div>
                    </div>
                <div class="clear"></div>
                <!--例子-->
                <div class="am-modal am-modal-no-btn" id="doc-modal-1">
                    <div class="add-dress">

                        <!--标题 -->
                        <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                            <form class="am-form am-form-horizontal">

                            </form>
                        </div>

                    </div>

                </div>

            </div>

            <script type="text/javascript">
                $(document).ready(function() {
                    $(".new-option-r").click(function() {
                        $(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
                    });

                    var $ww = $(window).width();
                    if($ww>640) {
                        $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
                    }

                })
            </script>

            <div class="clear"></div>

        </div>
        <!--底部-->
    </div>
</div>

    <aside class="menu">
        <ul>
            <li class="person">
                <a onclick="Main()">订餐大厅</a>
            </li>
            <li class="person">
                <a onclick="member()" style="font-size: 1.5rem;font-weight: bold;color: #F37B1D">个人中心</a>
            </li>
            <li class="person">
                <a onclick="Memberaddress()">地址管理</a>
            </li>
            <li class="person">
                <a onclick="MemberNowOrder()">当前订单</a>
            </li>
            <li class="person">
                <a onclick="MemberHistoryOrders()">历史订单</a>
            </li>
        </ul>

    </aside>
</div>
</body>
</html>
