<%--
  Created by IntelliJ IDEA.
  User: sty
  Date: 2019/6/19
  Time: 19:28
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
    <script type="text/javascript" src="JS/amazeui.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <title>优惠信息</title>
</head>
<body onload="getAllSusDis()">
<header>
    <article>
    </article>
</header>
<b class="line"></b>

<div class="center">

    <div class="col-main">
        <aside class="menu col-md-2">
            <ul>
                <li class="person">
                    <a onclick="restaurantInfo()">餐厅信息</a>
                </li>
                <li class="person">
                    <a onclick="dishes()">菜单</a>
                </li>
                <li class="person">
                    <a onclick="disself()">优惠</a>
                </li>
                <li class="person">
                    <a onclick="GetOrders()">历史订单</a>
                </li>
                <li class="person">
                    <a onclick="RestaurantLogout()">退出</a>
                </li>
            </ul>

        </aside>
        <div class="main-wrap">
            <div class="user-address">

                <div class="am-cf am-padding">
                    <div class="am-fl am-cf">
                        <strong class="am-text-danger am-text-lg" id="titlea">优惠信息</strong>
                        &nbsp
                    </div>
                </div>
                <hr/>

                <div class="am-tabs am-tabs-d2 am-margin data-am-tabs">

                    <ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
                        <li class=""><a onclick="getAllSusDis()">已上架</a></li>
                        <li class=""><a onclick="getAllFailDis()">已下架</a></li>
                    </ul>

                </div>

                <ul class="am-avg-sm-4 am-thumbnails" style="" id="allsusdis">

                </ul>

                <button id="doc-prompt-toggle" class="am-btn am-btn-large" style="display:none;position:relative;left:60px;background-color: #FAFAD2;outline: none">
                    <img src="http://ptcq8ais8.bkt.clouddn.com/tianjia.png" style="height: 80px">
                </button>

                <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt" style="width: 400px;height: 325px;position: fixed;top: 150px;left: 500px">
                    <div class="am-modal-dialog">
                        <div class="am-modal-hd" style="font-size:2rem;font-weight: bold;color: #4682B4">添加一个新的优惠</div>
                        <div class="am-modal-bd">
                            <label style="position: relative;left: -120px;top: 10px">优惠起价</label>
                            <input type="number" class="am-modal-prompt-input" id="full">
                            <label style="position: relative;left: -120px;top: 10px">优惠金额</label>
                            <input type="number" class="am-modal-prompt-input" id="dis">
                            <label style="position: relative;left: -120px;top: 10px">开始时间</label>
                            <input type="date" class="am-modal-prompt-input" id="start">
                            <label style="position: relative;left: -120px;top: 10px">结束时间</label>
                            <input type="date" class="am-modal-prompt-input" id="end">
                        </div>
                        <div class="am-modal-footer">
                            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                            <span class="am-modal-btn" data-am-modal-confirm>提交</span>
                        </div>
                    </div>
                </div>

            </div>
            <!--底部-->
        </div>
    </div>

</div>

<script>
    function restaurantInfo() {
        var thisURL = decodeURI(window.location.href);
        name = thisURL.split('~')[1];
        chaptcha = thisURL.split('~')[2];
        var url = encodeURI("Restaurant.jsp?~" + name + "~" + chaptcha);
        window.location.href = url;
    }
</script>

<script>
    function dishes() {
        var thisURL = decodeURI(window.location.href);
        name = thisURL.split('~')[1];
        chaptcha = thisURL.split('~')[2];
        var url = encodeURI("Restaurant.jsp?~" + name + "~" + chaptcha);
        window.location.href = url;
    }
</script>

<script>
    function disself() {
        var thisURL = decodeURI(window.location.href);
        name = thisURL.split('~')[1];
        chaptcha = thisURL.split('~')[2];
        var url = encodeURI("Restaurant.jsp?~" + name + "~" + chaptcha);
        window.location.href = url;
    }
</script>

<script>
    function getAllSusDis() {
        var thisURL = decodeURI(window.location.href);
        name = thisURL.split('~')[1];
        chaptcha = thisURL.split('~')[2];

        $.ajax({
            type: "POST",
            dataType: "json",
            data: {"chaptcha": chaptcha},
            url: "GetRestaurantDiscountServlet",
            success: function (result) {
                console.log(result);
                var allsusdiv = document.getElementById("allsusdis");
                allsusdiv.innerHTML = "";
                for (var i = 0; i < result.length; i+=2) {
                    var full = result[i].Full;
                    var minus = result[i].Minus;
                    var resAndId = result[i].Result;
                    var info = [];
                    info = resAndId.split("-");
                    var id = info[1];
                    //alert(id);
                    var li = "li"+id;
                    allsusdiv.innerHTML+="<li id=\""+li+"\"style=\"margin: 10px;width: 230px;background-color: #FAFAD2\">\n" +
                        "                        <img src=\"http://ptcq8ais8.bkt.clouddn.com/youhui.png\" style=\"position:relative;top:-15px;left:-7px;height: 50px;width: 50px\">\n" +
                        "                        <strong style=\"position:relative;top:14px;font-size:4rem;color: #e8989a\">￥"+minus+"</strong>\n" +
                        "                        <small style=\"position:relative;top:15px;font-weight: bold\">满"+full+"可用</small>\n" +
                        "                        <button id=\""+id+"\" class=\"am-btn am-btn-small am-btn-danger\" style=\"position:relative;top:0px;left: 167px\" onclick=\"getOffSale(this)\">\n" +
                        "                            <i class=\"am-icon-sign-out\"></i>\n" +
                        "                            下架\n" +
                        "                        </button>\n" +
                        "\n" +
                        "                    </li>";
                }

                allsusdiv.innerHTML += "<li style=\"margin:10px;width: 230px;background-color: #FAFAD2\" id=\"adddis\">\n" +
                    "                        <button class=\"am-btn am-btn-large\" onclick=\"ADD()\" style=\"display:block;position:relative;left:60px;background-color: #FAFAD2;outline: none\">\n" +
                    "                            <img src=\"http://ptcq8ais8.bkt.clouddn.com/tianjia.png\" style=\"height: 80px\">\n" +
                    "                        </button>\n" +
                    "\n" +
                    "                    </li>";
            }
        })
    }
</script>

<script>
    function ADD() {
        //alert("add");
        var bt = document.getElementById("doc-prompt-toggle");
        bt.click();
    }
</script>

<script>
    function getAllFailDis() {
        var thisURL = decodeURI(window.location.href);
        name = thisURL.split('~')[1];
        chaptcha = thisURL.split('~')[2];

        $.ajax({
            type: "POST",
            dataType: "json",
            data: {"chaptcha": chaptcha},
            url: "CheckProcessServelt",
            success: function (result) {
                console.log(result);
                var allsusdiv = document.getElementById("allsusdis");
                allsusdiv.innerHTML = "";
                for (var i = 0; i < result.length; i++) {
                    var full = result[i].Full;
                    var minus = result[i].Minus;
                    var resAndId = result[i].Result;
                    var info = [];
                    info = resAndId.split("-");
                    var id = info[1];
                    //alert(id);
                    var li = "li"+id;
                    allsusdiv.innerHTML+="<li id=\""+li+"\" style=\"margin: 10px;width: 230px;background-color: #D3D3D3\">\n" +
                        "                        <img src=\"http://ptcq8ais8.bkt.clouddn.com/youhui.png\" style=\"position:relative;top:-15px;left:-7px;height: 50px;width: 50px\">\n" +
                        "                        <strong style=\"position:relative;top:14px;font-size:4rem;color: #e8989a\">￥"+minus+"</strong>\n" +
                        "                        <small style=\"position:relative;top:15px;font-weight: bold\">满"+full+"可用</small>\n" +
                        "                        <button id=\""+id+"\" class=\"am-btn am-btn-small am-btn-success\" style=\"position:relative;top:0px;left: 167px\" onclick=\"getOnSale(this)\">\n" +
                        "                            <i class=\"am-icon-sign-in\"></i>\n" +
                        "                            上架\n" +
                        "                        </button>\n" +
                        "\n" +
                        "                    </li>";
                }
            }
        })
    }
</script>
<script>
    $(function() {
        $('#doc-prompt-toggle').on('click', function() {
            $('#my-prompt').modal({
                relatedTarget: this,
                onConfirm: function(e) {
                    //alert('你输入的是：' + e.data || '');
                    var thisURL = decodeURI(window.location.href);
                    name = thisURL.split('~')[1];
                    chaptcha = thisURL.split('~')[2];
                    var full = document.getElementById("full").value;
                    var minus = document.getElementById("dis").value;
                    var starttime = document.getElementById("start").value;
                    var endtime = document.getElementById("end").value;

                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "AddDiscountServlet",
                        traditional: true,
                        data: {
                            "FullPrice": full,
                            "MinusPrice": minus,
                            "chaptcha": chaptcha,
                            "StartTime": starttime,
                            "EndTime": endtime
                        },
                        success: function (result) {
                            console.log(result);
                            if (result[0] == "fail") {
                                var thisURL = decodeURI(window.location.href);
                                name = thisURL.split('~')[1];
                                chaptcha = thisURL.split('~')[2];
                                var url = encodeURI("MarketDiscount.jsp?~" + name + "~" + chaptcha);
                                window.location.href = url;
                            } else {
                                if (result[0].substr(0,7) == "success") {
                                    //alert("添加成功");
                                    var div = document.getElementById("adddis");
                                    div.parentNode.removeChild(div);
                                    var id = result[0].substring(8);

                                    var allsusdiv = document.getElementById("allsusdis");
                                    allsusdiv.innerHTML += "<li style=\"margin: 10px;width: 230px;background-color: #FAFAD2\">\n" +
                                        "                        <img src=\"http://ptcq8ais8.bkt.clouddn.com/youhui.png\" style=\"position:relative;top:-15px;left:-7px;height: 50px;width: 50px\">\n" +
                                        "                        <strong style=\"position:relative;top:14px;font-size:4rem;color: #e8989a\">￥"+minus+"</strong>\n" +
                                        "                        <small style=\"position:relative;top:15px;font-weight: bold\">满"+full+"可用</small>\n" +
                                        "                        <button id=\""+id+"\"class=\"am-btn am-btn-small am-btn-danger\" style=\"position:relative;top:0px;left: 167px\">\n" +
                                        "                            <i class=\"am-icon-sign-out\"></i>\n" +
                                        "                            下架\n" +
                                        "                        </button>\n" +
                                        "\n" +
                                        "                    </li>\n" +
                                        "                    <li style=\"margin: 10px;width: 230px;background-color: #FAFAD2\" id=\"adddis\">\n" +
                                        "                        <button onclick=\"ADD()\" class=\"am-btn am-btn-large\" style=\"display:block;position:relative;left:60px;background-color: #FAFAD2;outline: none\">\n" +
                                        "                            <img src=\"http://ptcq8ais8.bkt.clouddn.com/tianjia.png\" style=\"height: 80px\">\n" +
                                        "                        </button>\n" +
                                        "\n" +
                                        "                    </li>";
                                } else {
                                    alert("已存在满" + result[0] + "的优惠");
                                }
                            }
                            //返回一个String数组：如果已有一样的申请返回该申请的full和minus(String类型);如果成功String[0]=="Success";失败=="Fail";
                        }
                    });
                },
                onCancel: function(e) {
                    //alert('不想说!');
                }
            });
        });
    });
</script>

<script>
    function getOffSale(obj) {
        var thisURL = decodeURI(window.location.href);
        name = thisURL.split('~')[1];
        chaptcha = thisURL.split('~')[2];

        var id = obj.id;
        //alert(id);
        $.ajax({
            type: "POST",
            dataType: "json",
            data: {"id": id,"type":"off"},
            url: "CheckDishServlet",
            success: function (result) {
                console.log(result);
                var li = "li"+id;
                var div = document.getElementById(li);
                div.parentNode.removeChild(div);
            }
        })
    }
</script>

<script>
    function getOnSale(obj) {
        var thisURL = decodeURI(window.location.href);
        name = thisURL.split('~')[1];
        chaptcha = thisURL.split('~')[2];

        var id = obj.id;
        //alert(id);
        $.ajax({
            type: "POST",
            dataType: "json",
            data: {"id": id,"type":"on"},
            url: "CheckDishServlet",
            success: function (result) {
                console.log(result);
                var li = "li"+id;
                var div = document.getElementById(li);
                div.parentNode.removeChild(div);
            }
        })
    }
</script>
</body>
</html>
