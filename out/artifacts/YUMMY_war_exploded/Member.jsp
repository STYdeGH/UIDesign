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
    <!--
    <div>
        <label>会员地址：</label>
        <div id="add">
        </div>
        <div id="Naddress">
        </div>
        <label id="addr-show">
        </label>
    </div>
    <br/>

    <div class="tip am-round" id="newaddress" style="display: none;border:solid">
 -->
    <!--省份选择-->
    <!--
    <select id="prov" onchange="showCity(this)">
        <option>=请选择省份=</option>

    </select>
    -->
    <!--城市选择-->
    <!--
    <select id="city" onchange="showCountry(this)">
        <option>=请选择城市=</option>
    </select>
-->
    <!--县区选择-->
    <!--
    <select id="country" onchange="selecCountry(this)">
        <option>=请选择县区=</option>
    </select>
    <input type="text" value="" id="ANewAddress"/>
    <div>
        </div>
        <div class="tip_button">
            <button type="button" class="btn met1" onClick="showAddr()" id="button-show" >确定</button>
            <button class="am-btn am-btn-default am-round am-btn-secondary " value="取消" name="cancel" class="cancel" onclick="Cancel()">取消</button>
        </div>
    </div>
    -->
</div>

<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <div class="am-container header">
                <ul class="message-r">
                    <div class="topMessage home">
                        <div class="menu-hd"><a onclick="Logout()" target="_top" class="h">退出</a></div>
                    </div>
                    <div class="topMessage home">
                        <div class="menu-hd"><a onclick="DeleteMember()" target="_top" class="h">注销账号</a></div>
                    </div>
                </ul>
            </div>
            <!--悬浮搜索框-->
        </div>
        </div>
    </article>
</header>
<b class="line"></b>
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
                <a onclick="member()">个人中心</a>
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
