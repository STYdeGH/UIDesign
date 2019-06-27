<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019-02-17
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="Style/admin.css" rel="stylesheet" type="text/css">
    <link href="Style/amazeui.css" rel="stylesheet" type="text/css">
    <link href="Style/personal.css" rel="stylesheet" type="text/css">
    <link href="Style/infstyle.css" rel="stylesheet" type="text/css">
    <link href="Style/addstyle.css" rel="stylesheet" type="text/css">
    <!--<link href="Style/dlstyle.css" rel="stylesheet" type="text/css">

    <link href="Style/addstyle.css" rel="stylesheet" type="text/css">-->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="//shadow.elemecdn.com/faas/desktop/vendor.2e9f33.css" rel="stylesheet">

    <link href="//shadow.elemecdn.com/faas/desktop/main.30bad1.css" rel="stylesheet">

    <script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="JS/Restaurant.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <title>餐厅信息</title>
</head>
<body onload="RestaurantInfo()">
<header  style="background-color: #68c6de;width: 1422px;height: 40px">
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <div class="am-container header">

                <ul class="message-r">
                    <div class="topMessage home">
                        <p id="logoP" style="font-family:Times New Roman,Monospace,sans-serif;font-size:3rem;position:relative;left:-1020px;top:3px;color: white;font-weight: bolder">YUMMY</p>
                    </div>
                    <!--<div class="topMessage home">
                        <div class="menu-hd"><a onclick="Logout()" target="_top" class="h" style="position:relative;left:20px;font-weight:bold;color: palevioletred">退出</a></div>
                        <button onclick="Logout()" class="am-btn am-btn-small am-btn-warning" style="outline: none;border-radius: 5px;position:relative;top:6px;left:40px;">
                            <i class="am-icon-sign-out"></i>
                            退出
                        </button>
                    </div>-->
                    <div class="topMessage home">
                        <!--<div class="menu-hd"><a onclick="DeleteMember()" target="_top" class="h" style="position:relative;left:30px;font-weight: bold;color: palevioletred">注销</a></div>-->
                        <button onclick="RestaurantLogout()" class="am-btn am-btn-small am-btn-warning" style="outline: none;border-radius: 5px;position:relative;top:6px;left:55px;">
                            <i class="am-icon-sign-out"></i>
                            退出
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
        <aside class="menu col-md-2">
            <ul>
                <li class="person">
                    <a id="info1" onclick="RestaurantInfo()" style="font-size: 2rem;font-weight: bold;color: #F37B1D">餐厅信息</a>
                </li>
                <li class="person">
                    <a id="info2" onclick="Dishes()">我的菜单</a>
                </li>
                <li class="person">
                    <a onclick="Discount()">优惠信息</a>
                </li>
                <li class="person">
                    <a onclick="GetOrders()">历史订单</a>
                </li>
                <li class="person" style="display: none">
                    <a onclick="RestaurantLogout()">退出</a>
                </li>
            </ul>

        </aside>
        <div class="main-wrap">
            <div class="user-address">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf">
                        <strong class="am-text-danger am-text-lg" id="titlea">基本信息</strong>
                        &nbsp
                    </div>
                </div>
                <hr/>

                <div class="info-main" id="resInfo" style="display: none">
                    <div class="am-form am-form-horizontal">
                        <div id="userlogo" style="position: relative;left: 100px;top:40px;width: 160px;height: 205px">
                            <img src="image/logo2_03.png" style="width: 90%;height: 90%;margin: 2px">
                        </div>
                        <div class="am-form-group" style="display:none;">
                            <label for="id" class="am-form-label">ID：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="id"/>
                            </div>
                        </div>
                        <div class="am-form-group" style="position: relative;left: 310px;top:-210px">
                            <label for="name" class="am-form-label" style="font-size: 1.7rem;position: relative;top: -3px;color: grey">餐厅名称：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="name" style="border-radius: 5px;width: 200px"/>
                            </div>
                        </div>
                        <div class="am-form-group" style="position: relative;left: 310px;top:-210px">
                            <label for="password" class="am-form-label" style="font-size: 1.7rem;position: relative;top: -3px;color: grey">餐厅编号：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="password" style="border-radius: 5px;width: 200px"/>
                            </div>
                        </div>
                        <div class="am-form-group" style="position: relative;left: 310px;top:-210px">
                            <label for="phone" class="am-form-label" class="am-form-label" style="font-size: 1.7rem;position: relative;top: -3px;color: grey">餐厅类型：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="phone" style="border-radius: 5px;width: 200px"/>
                            </div>
                        </div>
                        <div class="am-form-group" style="position: relative;left: 310px;top:-210px">
                            <label for="email" class="am-form-label" style="font-size: 1.7rem;position: relative;top: -3px;color: grey">联系电话：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="email" style="border-radius: 5px;width: 200px"/>
                            </div>
                        </div>
                        <div class="am-form-group" style="position: relative;left: 120px;top:-210px">
                            <label for="account" class="am-form-label" style="font-size: 1.7rem;position: relative;top: -3px;color: grey">餐厅地点：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="account" style="border-radius: 5px;width: 389px"/>
                            </div>
                        </div>
                        <div class="am-form-group" style="position: relative;left: 120px;top:-210px">
                            <label for="balance" class="am-form-label" style="font-size: 1.7rem;position: relative;top: -3px;color: grey">账户余额：</label>
                            <div class="am-form-content">
                                <input type="text" readonly="readonly" id="balance" style="border-radius: 5px;width: 389px"/>
                            </div>
                        </div>
                    </div>
                </div>

               <div id='adddish' class="info-main"></div>

                <div id='main1' class="info-main">
                    <button class="am-btn am-btn-danger" onclick="EditRestaurantInfo()" id="editinfo" style="display: none">保存</button>
                </div>
                <div style='padding-left: 2%;padding-right: 2%;' ng-show="!loading" class="shopmenu-main grid"
                     ng-class="{grid: displayType === 'grid', list: displayType === 'list'}"
                     style="margin-top: 0px;">
                    <!-- ngIf: filterData === 'default' && !searchEnv -->
                    <div class="col-2 shopmenu-food-main">
                        <div ng-if="filterData === 'default' &amp;&amp; !searchEnv" class="ng-scope">
                            <!-- ngRepeat: category in categorys -->
                            <div id='main' class="shopmenu-list clearfix ng-scope"
                                 ng-repeat="category in categorys">

                            </div>

                        </div>
                    </div>
                </div>
                <div id="clean"></div>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $(".new-option-r").click(function () {
                            $(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
                        });

                        var $ww = $(window).width();
                        if ($ww > 640) {
                            $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
                        }

                    })
                </script>

                <div class="clear"></div>

            </div>
            <!--底部-->
        </div>
    </div>

</div>
</body>
</html>
