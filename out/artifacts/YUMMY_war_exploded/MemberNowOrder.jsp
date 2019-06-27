<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019-03-11
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<link href="Style/amazeui.css" rel="stylesheet">
<link href="Style/admin.css" rel="stylesheet" type="text/css">
<link href="Style/personal.css" rel="stylesheet" type="text/css">
<link href="Style/orstyle.css" rel="stylesheet" type="text/css">
<link href="//shadow.elemecdn.com/faas/desktop/vendor.2e9f33.css" rel="stylesheet">
<link href="//shadow.elemecdn.com/faas/desktop/profile.d24b94.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="JS/MemberNowOrder.js"></script>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <title>会员当前订单</title>
</head>
<body onload="GetNowOrders()">

<header style="background-color: #68c6de;width: 1422px;height: 40px">
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
                        <button onclick="Logout()" class="am-btn am-btn-small am-btn-warning" style="outline: none;border-radius: 5px;position:relative;top:4px;left:40px;">
                            <i class="am-icon-sign-out"></i>
                            退出
                        </button>
                    </div>
                    <div class="topMessage home">
                        <!--<div class="menu-hd"><a onclick="DeleteMember()" target="_top" class="h" style="position:relative;left:30px;font-weight: bold;color: palevioletred">注销</a></div>-->
                        <button onclick="DeleteMember()" class="am-btn am-btn-small am-btn-default" style="outline: none;border-radius: 5px;position:relative;top:4px;left:55px;">
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
    <aside class="menu col-main-2">
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
                <a onclick="MemberNowOrder()" style="font-size: 1.5rem;font-weight: bold;color: #F37B1D">当前订单</a>
            </li>
            <li class="person">
                <a onclick="MemberHistoryOrders()">历史订单</a>
            </li>
        </ul>
    </aside>
    <div class="col-main-10">
        <div class="main-wrap">

            <div class="user-order">

                <!--标题 -->
                <!--<div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
                </div>
                <hr/>-->

                <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

                    <ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
                        <li class="am-active"><a>所有订单</a></li>
                    </ul>

                    <div class="am-tabs-bd">
                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                            <!--<div class="order-top" id="tt">
                                <div class="th th-amount">
                                    <td class="td-inner">订单号</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">餐厅</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">餐厅地址</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">餐厅类型</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">下单时间</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">收货地址</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">订单详情</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">优惠</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">总价</td>
                                </div>
                            </div>-->

                            <div class="order-main">
                                <div class="order-list" id="noworder">
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!--底部-->
    </div>


</div>
</body>
</html>

