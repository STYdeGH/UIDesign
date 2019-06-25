<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019-02-17
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link href="Style/amazeui.css" rel="stylesheet">
<link href="Style/personal.css" rel="stylesheet" type="text/css">
<link href="Style/orstyle.css" rel="stylesheet" type="text/css">
<link href="Style/infstyle.css" rel="stylesheet" type="text/css">
<link href="Style/addstyle.css" rel="stylesheet" type="text/css">
<link href="//shadow.elemecdn.com/faas/desktop/vendor.2e9f33.css" rel="stylesheet">
<link href="//shadow.elemecdn.com/faas/desktop/main.30bad1.css" rel="stylesheet">
<script type="text/javascript" src="JS/amazeui.js"></script>
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="JS/Main.js"></script>
<head>
    <title>点餐</title>

</head>
<body onload="GetRestaurant('Fastfood')">
<header  style="background-color: #68c6de;width: 1422px;height: 40px">
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

<!--<b class="line"></b>-->

<div class="center">
    <div class="col-main">
        <aside class="menu col-md-2">
            <ul>
                <li class="person">
                    <a id="hall" onclick="Main()" style="font-size: 1.5rem;font-weight: bold;color: #F37B1D">订餐大厅</a>
                </li>
                <li class="person">
                    <a id="personinfo" onclick="member()">个人中心</a>
                </li>
                <li class="person">
                    <a id="address" onclick="Memberaddress()">地址管理</a>
                </li>
                <li class="person">
                    <a id="orders" onclick="MemberNowOrder()">当前订单</a>
                </li>
                <li class="person">
                    <a id="hisorders" onclick="MemberHistoryOrders()">历史订单</a>
                </li>
            </ul>

        </aside>


        <div class="main-wrap col-md-10">

            <div class="user-order">

                <!--标题 -->
                <div class="am-cf am-padding" style="display: none">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg" style="font-size:1.5rem;font-weight:bold;position: relative;top: 5px;color: #68c6de">订餐大厅/</strong>
                        <small style="position: relative;top: 7px">Hall</small>
                    </div>
                </div>


                <div class="am-tabs am-tabs-d2 am-margin data-am-tabs">

                    <ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
                        <li id="Fastfood" class="am-active"><a onclick="GetRestaurant('Fastfood')">快餐便当</a></li>
                        <li id="Characteristic" class=""><a onclick="GetRestaurant('Characteristic')">特色菜系</a></li>
                        <li id="snacks" class=""><a onclick="GetRestaurant('snacks')">小吃夜宵</a></li>
                        <li id="Exotic" class=""><a onclick="GetRestaurant('Exotic')">异国料理</a></li>
                    </ul>

                </div>

                    <div class="place-rstbox clearfix">
                        <div class="clearfix" id="sellerbox"
                             data="filteredRestaurants = (rstStream.restaurants | filter: rstStream.filter | filter: otherFilter | orderBy: [ '-is_opening', rstStream.orderBy || 'index' ])"
                            >
                        </div>




                    </div>

            </div>
            <!--底部-->
        </div>


    </div>
</div>
</body>
</html>
