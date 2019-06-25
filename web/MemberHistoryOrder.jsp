<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019-03-11
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="Style/amazeui.css" rel="stylesheet">
<link href="Style/admin.css" rel="stylesheet" type="text/css">
<link href="Style/personal.css" rel="stylesheet" type="text/css">
<link href="Style/orstyle.css" rel="stylesheet" type="text/css">
<link href="//shadow.elemecdn.com/faas/desktop/vendor.2e9f33.css" rel="stylesheet">
<link href="//shadow.elemecdn.com/faas/desktop/profile.d24b94.css" rel="stylesheet" type="text/css">
<link href="Style/bootstrap.min.css" type="text/css">
<style>
    .am-table am-table-striped am-table-hover am-table-centered tr td{
        text-overflow: ellipsis;
        -moz-text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        text-align: left;
    }
</style>
<script type="text/javascript" src="https://echarts.baidu.com/build/dist/echarts-all.js"></script>
<script type="text/javascript" src="JS/macarons.js"></script>
<script type="text/javascript" src="JS/jquery.min.js"></script>
<script type="text/javascript" src="JS/bootstrap.min.js"></script>
<script type="text/javascript" src="JS/MemberHistoryOrders.js"></script>
<html>
<head>
    <title>会员历史订单</title>
</head>
<body>

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

<%--
会员按照价格查看订单，会员按照点餐次数查看，会员按照订餐时间查看，会员按照餐厅类型查看
--%>
<div class="center">
    <aside class="menu  col-main-2">
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
                <a onclick="MemberHistoryOrders()" style="font-size: 1.5rem;font-weight: bold;color: #F37B1D">历史订单</a>
            </li>
        </ul>
    </aside>
    <div class="col-main-10">
        <div class="main-wrap">

            <div class="user-order">

                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
                </div>
                <hr/>

                <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

                    <ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
                        <li class="am-g" id="ppp"><a onclick="GetOrdersByPrice()">按价格排序</a></li>
                        <li class="am-g" id="rrr"><a onclick="GetOrdersByRes()">按点餐次数</a></li>
                        <li class="am-g" id="ttt"><a onclick="GetOrdersByOrderTime()">按点餐时间排序</a></li>
                    </ul>

                    <div class="am-tabs-bd" id="statistic" style="display:none">
                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                            <div class="order-top" id="tt">
                            </div>

                            <div class="order-main">
                                <div class="order-list" id="Price">
                                </div>

                            </div>

                        </div>
                    </div>

                    <div id="marketsByOrderSum" style="display:none;position:relative;top: 20px;width:100%;height:450px;background-color: white">
                        <div class="am-g">
                            <div class="am-u-sm-6" id="pie" style="height:430px">

                            </div>
                            <div class="am-u-sm-6" id="top" style="position: relative;top: 30px;height:430px">
                                <!--<table class="am-table am-table-striped am-table-hover">
                                    <strong style="font-weight:bold;font-size: 1.5rem;color:rosybrown">餐厅点餐次数TOP5</strong>
                                    <thead>
                                    <tr style="font-weight:bold">
                                        <th>餐厅名称</th>
                                        <th>餐厅类型</th>
                                        <th>餐厅地址</th>
                                        <th>点餐次数</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>麦当劳</td>
                                        <td>快餐便当</td>
                                        <td>江苏省-南京市-鼓楼区-广州路100号</td>
                                        <td>23</td>
                                    </tr>
                                    <tr>
                                        <td>麦当劳</td>
                                        <td>快餐便当</td>
                                        <td>广州路100号</td>
                                        <td>23</td>
                                    </tr>
                                    <tr>
                                        <td>麦当劳</td>
                                        <td>快餐便当</td>
                                        <td>广州路100号</td>
                                        <td>23</td>
                                    </tr>
                                    <tr>
                                        <td>麦当劳</td>
                                        <td>快餐便当</td>
                                        <td>广州路100号</td>
                                        <td>23</td>
                                    </tr>
                                    <tr>
                                        <td>麦当劳</td>
                                        <td>快餐便当</td>
                                        <td>广州路100号</td>
                                        <td>23</td>
                                    </tr>
                                    </tbody>
                                </table>-->
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
