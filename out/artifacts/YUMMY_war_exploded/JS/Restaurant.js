var edit = 0;
var name, Name;
var chaptcha;
var phone;
var address;
var type;
var editinfo;
var number = 0, number1 = 1;
var newdiscount;

function GetOrders() {
    var thisURL = decodeURI(window.location.href);
    name = thisURL.split('~')[1];
    chaptcha = thisURL.split('~')[2];
    var url = encodeURI("RestaurantHistoryOrder.jsp?~" + name + "~" + chaptcha);
    window.location.href = url;
}

function RestaurantInfo() {

    var div = document.getElementById("resInfo");
    div.style.display = "block";
    var info1 = document.getElementById("info1");
    info1.style.fontSize = "2rem";
    info1.style.fontWeight = "bold";
    info1.style.color = "#F37B1D";
    var info2 = document.getElementById("info2");
    info2.style = null;

    var thisURL = decodeURI(window.location.href);
    name = thisURL.split('~')[1];
    chaptcha = thisURL.split('~')[2];
   /* var main = document.getElementById("main1");
    var main1 = document.getElementById("main");
    main1.innerHTML = "";
    main.innerHTML = "";
    main.innerHTML += "<div style='margin: 0px' class=\"list-group\">\n" +
        "\t\t<div class=\"list-group-item\">\n" +
        "\t\t\t<h4 class=\"list-group-item-heading\">店名</h4>\n" +
        "\t\t\t<p class=\"list-group-item-text text-muted\" id=\"name\"></p>\n" +
        "\t\t</div>\n" +
        "\n" +
        "\t\t<div class=\"list-group-item\">\n" +
        "\t\t\t<h4 class=\"list-group-item-heading\">账户余额</h4>\n" +
        "\t\t\t<p class=\"list-group-item-text text-muted\" id=\"account\"></p>\n" +
        "\t\t</div>\n" +
        "\n" +
        "\t\t<a href=\"#\" id=\"location\" onclick=\"show(this)\" class=\"list-group-item\">\n" +
        "\t\t\t<h4 class=\"list-group-item-heading\">地点</h4>\n" +
        "\t\t\t<p class=\"list-group-item-text\" id=\"llocation\"></p>\n" +
        "\t\t</a> <a href=\"#\" id=\"phone\" onclick=\"show(this)\" class=\"list-group-item\">\n" +
        "\t\t\t<h4 class=\"list-group-item-heading\">手机号</h4>\n" +
        "\t\t\t<p class=\"list-group-item-text\" id=\"pphone\"></p>\n" +
        "\t\t</a> <a href=\"#\" id=\"type\" onclick=\"show(this)\" class=\"list-group-item\">\n" +
        "\t\t\t<h4 class=\"list-group-item-heading\">类型</h4>\n" +
        "\t\t\t<p class=\"list-group-item-text\" id=\"ttype\"></p>\n" +
        "\t\t</a> <a href=\"#\" id=\"password\" onclick=\"show(this)\"\n" +
        "\t\t\tclass=\"list-group-item\">\n" +
        "\t\t\t<h4 class=\"list-group-item-heading\">修改密码</h4>\n" +
        "\t\t</a>\n" +
        "\t</div>\n" +
        "\n" +
        "\n" +
        "\n" +
        "\n" +
        "\n" +
        "\t<div class=\"modal fade\" id=\"phonemodel\" role=\"dialog\"\n" +
        "\t\taria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n" +
        "\t\t<div class=\"modal-dialog\" role=\"document\">\n" +
        "\t\t\t<div class=\"modal-content\">\n" +
        "\t\t\t\t<div class=\"modal-header\">\n" +
        "\t\t\t\t\t<h5 class=\"modal-title\" id=\"createFileTitle\">修改手机号</h5>\n" +
        "\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\"\n" +
        "\t\t\t\t\t\taria-label=\"Close\">\n" +
        "\t\t\t\t\t\t<span aria-hidden=\"true\">&times;</span>\n" +
        "\t\t\t\t\t</button>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t\t<div class=\"modal-body\">\n" +
        "\t\t\t\t\t<form>\n" +
        "\t\t\t\t\t\t<div class=\"form-group\">\n" +
        "\t\t\t\t\t\t\t<label for=\"fileName\" class=\"col-form-label\">手机号</label> <input\n" +
        "\t\t\t\t\t\t\t\ttype=\"text\" autofocus class=\"form-control\" id=\"ppphone\">\n" +
        "\t\t\t\t\t\t</div>\n" +
        "\t\t\t\t\t</form>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t\t<div class=\"modal-footer\">\n" +
        "\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" id=\"updatephone\"  onclick=\"sha('phone')\">确定</button>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t</div>\n" +
        "\t\t</div>\n" +
        "\t</div>\n" +
        "\n" +
        "\n" +
        "\n" +
        "\n" +
        "\t<div class=\"modal fade\" id=\"typemodel\" role=\"dialog\"\n" +
        "\t\taria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n" +
        "\t\t<div class=\"modal-dialog\" role=\"document\">\n" +
        "\t\t\t<div class=\"modal-content\">\n" +
        "\t\t\t\t<div class=\"modal-header\">\n" +
        "\t\t\t\t\t<h5 class=\"modal-title\" id=\"createFileTitle\">修改类型</h5>\n" +
        "\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\"\n" +
        "\t\t\t\t\t\taria-label=\"Close\">\n" +
        "\t\t\t\t\t\t<span aria-hidden=\"true\">&times;</span>\n" +
        "\t\t\t\t\t</button>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t\t<div class=\"modal-body\">\n" +
        "\t\t\t\t\t<form>\n" +
        "\t\t\t\t\t\t<div class=\"form-group\">\n" +
        "\t\t\t\t\t\t\t<label for=\"fileName\" class=\"col-form-label\">类型</label> <input\n" +
        "\t\t\t\t\t\t\t\ttype=\"text\" autofocus class=\"form-control\" id=\"tttype\">\n" +
        "\t\t\t\t\t\t</div>\n" +
        "\t\t\t\t\t</form>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t\t<div class=\"modal-footer\">\n" +
        "\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" id=\"updatetype\" onclick=\"sha('type')\">确定</button>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t</div>\n" +
        "\t\t</div>\n" +
        "\t</div>\n" +
        "\n" +
        "\n" +
        "\n" +
        "\n" +
        "\n" +
        "\t<div class=\"modal fade\" id=\"passmodel\" role=\"dialog\"\n" +
        "\t\taria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n" +
        "\t\t<div class=\"modal-dialog\" role=\"document\">\n" +
        "\t\t\t<div class=\"modal-content\">\n" +
        "\t\t\t\t<div class=\"modal-header\">\n" +
        "\t\t\t\t\t<h5 class=\"modal-title\" id=\"createFileTitle\">修改密码</h5>\n" +
        "\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\"\n" +
        "\t\t\t\t\t\taria-label=\"Close\">\n" +
        "\t\t\t\t\t\t<span aria-hidden=\"true\">&times;</span>\n" +
        "\t\t\t\t\t</button>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t\t<div class=\"modal-body\">\n" +
        "\t\t\t\t\t<form>\n" +
        "\t\t\t\t\t\t<div class=\"form-group\">\n" +
        "\t\t\t\t\t\t\t<label for=\"fileName\" class=\"col-form-label\">新密码</label> <input\n" +
        "\t\t\t\t\t\t\t\ttype=\"password\" autofocus class=\"form-control\" id=\"ppass\">\n" +
        "\t\t\t\t\t\t\t<label for=\"fileName\" class=\"col-form-label\">确认新密码</label> <input\n" +
        "\t\t\t\t\t\t\t\ttype=\"password\" autofocus class=\"form-control\" id=\"pppass\">\n" +
        "\t\t\t\t\t\t</div>\n" +
        "\t\t\t\t\t</form>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t\t<div class=\"modal-footer\">\n" +
        "\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" id=\"updatepass\"  onclick=\"sha('pass')\">确定</button>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t</div>\n" +
        "\t\t</div>\n" +
        "\t</div>\n" +
        "\n" +
        "\n" +
        "\t<div class=\"modal fade\" id=\"locationmodel\" role=\"dialog\"\n" +
        "\t\taria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n" +
        "\t\t<div class=\"modal-dialog\" role=\"document\">\n" +
        "\t\t\t<div class=\"modal-content\">\n" +
        "\t\t\t\t<div class=\"modal-header\">\n" +
        "\t\t\t\t\t<h5 class=\"modal-title\" id=\"createFileTitle\">修改地址</h5>\n" +
        "\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\"\n" +
        "\t\t\t\t\t\taria-label=\"Close\">\n" +
        "\t\t\t\t\t\t<span aria-hidden=\"true\">&times;</span>\n" +
        "\t\t\t\t\t</button>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t\t<div class=\"modal-body\">\n" +
        "\t\t\t\t\t<form>\n" +
        "\t\t\t\t\t\t<div class=\"form-group\">\n" +
        "\t\t\t\t\t\t\t<label for=\"fileName\" class=\"col-form-label\">街道</label> <input\n" +
        "\t\t\t\t\t\t\t\ttype=\"text\" autofocus class=\"form-control\" id=\"sstreet\">\n" +
        "\t\t\t\t\t\t\t<label for=\"fileName\" class=\"col-form-label\">小区/门牌号</label> <input\n" +
        "\t\t\t\t\t\t\t\ttype=\"text\" autofocus class=\"form-control\" id=\"rroom\">\n" +
        "\n" +
        "\n" +
        "\n" +
        "\t\t\t\t\t\t</div>\n" +
        "\t\t\t\t\t</form>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t\t<div class=\"modal-footer\">\n" +
        "\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" id=\"updatelocation\"  onclick=\"sha('loc')\">确定</button>\n" +
        "\t\t\t\t</div>\n" +
        "\t\t\t</div>\n" +
        "\t\t</div>\n" +
        "\t</div>";*/
    $.ajax({
        type: "POST",
        dataType: "json",
        data: {"name": name, "chaptcha": chaptcha},
        url: "GetRestaurantInfoServlet",
        success: function (result) {
            //得到该餐厅的所有基本信息
            console.log(result);
            var div1 = document.getElementById("name");
            div1.value = result.resName;
            var div2 = document.getElementById("password");
            div2.value = chaptcha;
            var div3 = document.getElementById("phone");
            div3.value = result.restype;
            var div4 = document.getElementById("email");
            div4.value = result.phone;
            var div5 = document.getElementById("account");
            div5.value = result.resAddress;
            var div6 = document.getElementById("balance");
            div6.value = 12156.3;

            /*Name = document.getElementById("name");
            // console.log(Name.length);
            //chaptcha = document.getElementById("chaptcha");
            phone = document.getElementById("pphone");
            address = document.getElementById("llocation");
            type = document.getElementById("ttype");
            //chaptcha.value = result.chaptcha;
            Name.value = result.resName;
            phone.value = result.phone;
            address.value = result.resAddress;
            type.value = result.restype;*/
            $("#name").append(result.resName);
            $("#account").append("12156.3");
            $("#ttype").append(result.restype);
            $("#pphone").append(result.phone);
            $("#llocation").append(result.resAddress);

        }
    })
}

function sha(kk) {
    if (kk == 'type') {
        $("#typemodel").modal("hide");
        var newtype = $("#tttype").val();
        console.log("input new type : " + newtype);
        if (newtype == null || newtype == "") {
            alert("请输入有效的类型");
        }
        else {
            document.getElementById("ttype").innerText = newtype;
        }
    }
    else if (kk == 'pass') {
        $("#passmodel").modal("hide");
        var newpass = $("#ppass").val();
        var newppass = $("#pppass").val();
        console.log("input new pass : " + newpass);
        if (newpass != newppass) {
            alert("两个密码不一致,请重填");
        }
        else if (newpass == null || newpass == "") {
            alert("请填写有效密码");
        }
        else {
            alert("密码修改成功");
        }
    } else if (kk == 'loc') {
        $('#locationmodel').modal('hide');
        var street = $("#sstreet").val();
        var room = $("#rroom").val();
        if (street == null || street == "") {
            alert("请正确填写街道");
        }
        else if (room == null || room == "") {
            alert("请正确填写小区/门牌号");
        }
        else {
            document.getElementById("llocation").innerText = street + room;
        }
    } else if (kk == 'phone') {
        $("#phonemodel").modal("hide");
        var newphone = $("#ppphone").val();
        console.log("input new phone : " + newphone);
        if (!(/^1[34578]\d{9}$/.test(newphone))) {
            alert("手机号码有误，请重填");
        }
        else {
            document.getElementById("pphone").innerText = newphone;
        }
    }
}

function RestaurantLogout() {
    //跳转至登录的主界面
    var url = encodeURI("index.jsp");
    window.location.href = url;
}


function show(a) {
    console.log($(a).context.id);
    if ($(a).context.id == "location") {
        $('#locationmodel').modal('show');
    }
    else if ($(a).context.id == "phone") {
        $('#phonemodel').modal('show');
    }
    else if ($(a).context.id == "type") {
        $('#typemodel').modal('show');
    }
    else if ($(a).context.id == "password") {
        $('#passmodel').modal('show');
    }
    else if ($(a).context.id == "closeAccount") {
        $('#closemodel').modal('show');
    }

}

function EditRestaurantInfo() {
    chaptcha = document.getElementById("chaptcha");
    Name = document.getElementById("resname");
    phone = document.getElementById("phone");
    address = document.getElementById("address");
    type = document.getElementById("type");
    editinfo = document.getElementById("editinfo");
    //餐厅名、联系方式、餐厅类型、餐厅地址
    //提交新的信息给经理审核
    $.ajax({
        type: "POST",
        dataType: "json",
        data: {
            "name": Name.value,
            "chaptcha": chaptcha.value,
            "phone": phone.value,
            "address": address.value,
            "type": type.value
        },
        url: "EditRestaurantInfoServlet",
        success: function (result) {
            alert(result);
            var thisURL = decodeURI(window.location.href);
            var name = thisURL.split('~')[1];
            var chaptcha = thisURL.split('~')[2];
            var url = encodeURI("Restaurant.jsp?~" + name + "~" + chaptcha);
            window.location.href = url;
        }
    })
}

function Dishes() {
    var div = document.getElementById("resInfo");
    div.style.display = "none";
    //得到已有的菜品显示
    //添加一个新增菜品的按钮
    //得到已有的套餐并显示
    //添加一个新增套餐的按钮
    var info2 = document.getElementById("info2");
    info2.style.fontSize = "2rem";
    info2.style.fontWeight = "bold";
    info2.style.color = "#F37B1D";
    var info1 = document.getElementById("info1");
    info1.style = null;
    var thisURL = decodeURI(window.location.href);
    name = thisURL.split('~')[1];
    chaptcha = thisURL.split('~')[2];
    var main1 = document.getElementById("main1");
    document.getElementById("titlea").innerHTML = "菜单管理";

    var main = document.getElementById("main");
    main.innerHTML =
        "\t\t\t<button onclick=\"add()\" type=\"button\" class=\"btn btn-success\">新增单品</button>\n";


    main1.innerHTML = "";
    //得到已有的优惠
    $.ajax({
        type: "POST",
        dataType: "json",
        data: {"chaptcha": chaptcha},
        url: "GetRestaurantDishServlet",
        success: function (result) {
            console.log(result)
            var main = document.getElementById("main");
            main.innerHTML +=
                "<div id=\"success\">\n" + "<br>" +
                "</div>\n" +
                "<div id=\"newdish\">\n" +
                "<div class=\"modal fade\" id=\"pmodel\" role=\"dialog\"\n" +
                "\t\taria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n" +
                "\t\t<div class=\"modal-dialog\" role=\"document\">\n" +
                "\t\t\t<div class=\"modal-content\">\n" +
                "\t\t\t\t<div class=\"modal-header\">\n" +
                "\t\t\t\t\t<h5 class=\"modal-title\" id=\"createFileTitle\">新增单品</h5>\n" +
                "\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\"\n" +
                "\t\t\t\t\t\taria-label=\"Close\">\n" +
                "\t\t\t\t\t\t<span aria-hidden=\"true\">&times;</span>\n" +
                "\t\t\t\t\t</button>\n" +
                "\t\t\t\t</div>\n" +
                "\t\t\t\t<div class=\"modal-body\">\n" +
                "\t\t\t\t\t<form>\n" +
                "\t\t\t\t\t\t<div class=\"form-group\">\n" +
                "\t\t\t\t\t\t\t<label for=\"fileName\" class=\"col-form-label\">名称</label> <input\n" +
                "\t\t\t\t\t\t\t\ttype=\"text\" autofocus class=\"form-control\" id=\"name\"> <label\n" +
                "\t\t\t\t\t\t\t\tfor=\"fileName\" class=\"col-form-label\">库存</label> <input\n" +
                "\t\t\t\t\t\t\t\ttype=\"text\" autofocus class=\"form-control\" id=\"stock\"> <label\n" +
                "\t\t\t\t\t\t\t\tfor=\"fileName\" class=\"col-form-label\">分量</label> <input\n" +
                "\t\t\t\t\t\t\t\ttype=\"text\" autofocus class=\"form-control\" id=\"num\"> <label\n" +
                "\t\t\t\t\t\t\t\tfor=\"fileName\" class=\"col-form-label\">价格</label> <input\n" +
                "\t\t\t\t\t\t\t\ttype=\"text\" autofocus class=\"form-control\" id=\"price\">\n" +
                "\n" +
                "\n" +
                "\n" +
                "\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t</form>\n" +
                "\t\t\t\t</div>\n" +
                "<div class=\"modal-footer\">\n" +
                "\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" id=\"addp\" onclick='addpp()'>确定</button>\n" +
                "\t\t\t\t</div>"
            "\t\t\t</div>\n" +
            "\t\t</div>\n" +
            "\t</div>" + "<br>" +
            "<div id='discount'>\n" +
            "</div>\n" +
            "</div>\n" +
            " <a class=\"new-abtn-type\" data-am-modal=\"{target: '#doc-modal-1', closeViaDimmer: 0}\">添加新地址</a>\n" +
            "                <!--例子-->\n" +
            "                <div class=\"am-modal am-modal-no-btn\" id=\"doc-modal-1\">\n" +
            "\n" +
            "                    <div class=\"add-dress\">\n" +
            "\n" +
            "                        <!--标题 -->\n" +
            "                        <div class=\"am-cf am-padding\">\n" +
            "                            <div class=\"am-fl am-cf\"><strong class=\"am-text-danger am-text-lg\">新增地址</strong> /\n" +
            "                                <small>Add&nbsp;address</small>\n" +
            "                            </div>\n" +
            "                        </div>\n" +
            "                        <hr/>\n" +
            "\n" +
            "                        <div class=\"am-u-md-12 am-u-lg-8\" style=\"margin-top: 20px;\">\n" +
            "                            <form class=\"am-form am-form-horizontal\" id=\"newaddress\">\n" +
            "                                <div class=\"am-form-group\">\n" +
            "                                    <div class=\"am-form-content address\">\n" +
            "                                        <select data-am-selected id=\"prov\" onchange=\"showCity(this)\">\n" +
            "                                            <option>=请选择省份=</option>\n" +
            "\n" +
            "                                        </select>\n" +
            "\n" +
            "                                        <!--城市选择-->\n" +
            "                                        <select data-am-selected id=\"city\" onchange=\"showCountry(this)\">\n" +
            "                                            <option>=请选择城市=</option>\n" +
            "                                        </select>\n" +
            "\n" +
            "                                        <!--县区选择-->\n" +
            "                                        <select data-am-selected id=\"country\" onchange=\"selecCountry(this)\">\n" +
            "                                            <option>=请选择县区=</option>\n" +
            "                                        </select>\n" +
            "                                    </div>\n" +
            "                                </div>\n" +
            "\n" +
            "                                <div class=\"am-form-group\">\n" +
            "                                    <label for=\"ANewAddress\" class=\"am-form-label\">详细地址</label>\n" +
            "                                    <div class=\"am-form-content\">\n" +
            "                                        <textarea class=\"\" rows=\"3\" id=\"ANewAddress\" placeholder=\"输入详细地址\"></textarea>\n" +
            "                                        <small>100字以内写出你的详细地址...</small>\n" +
            "                                    </div>\n" +
            "                                </div>\n" +
            "\n" +
            "                                <div class=\"am-form-group\">\n" +
            "                                    <div class=\"am-u-sm-9 am-u-sm-push-3\">\n" +
            "                                        <a class=\"am-btn am-btn-danger\" onClick=\"showAddr()\">保存</a>\n" +
            "                                    </div>\n" +
            "                                </div>\n" +
            "                            </form>\n" +
            "                        </div>\n" +
            "\n" +
            "                    </div>\n" +
            "\n" +
            "                </div>";
            var success = document.getElementById("success");
            //var doing =document.getElementById("doing");

            for (var i = 0; i < result.length; i++) {
                console.log(result[i]);
                success.innerHTML += "<div class=\"shopmenu-food ng-isolate-scope\" ng-class=\"{noimg: !food.image_path}\"\n" +
                    "                                 id=\"1721446724\" ng-repeat=\"food in category.foods\" shop-menu-item=\"\" food=\"food\"\n" +
                    "                                 shop=\"shopCache\"><!-- ngIf: food.image_path --><span class=\"col-1 ng-scope\"\n" +
                    "                                                                                      ng-if=\"food.image_path\"><a\n" +
                    "                                    href=\"javascript:\" ng-click=\"showInfo(food)\"><img\n" +
                    "                                    ng-src=\"//fuss10.elemecdn.com/6/f8/b5a4ac071e1a27e5cc5fbe5c7b517jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85\"\n" +
                    "                                    alt=\"单人套餐的图片\"\n" +
                    "                                    src=\"//fuss10.elemecdn.com/6/f8/b5a4ac071e1a27e5cc5fbe5c7b517jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85\"></a></span>\n" +
                    "                                <!-- end ngIf: food.image_path -->\n" +
                    "                                <div class=\"col-2 shopmenu-food-main\"><h3\n" +
                    "                                        class=\"shopmenu-food-name ui-ellipsis ng-binding\">" + result[i].Dishname + "</h3>\n" +
                    "                                    <p class=\"color-mute ui-ellipsis ng-binding\" tooltip='" + result[i].DishInfo + "'" +
                    "                                    <p>\n" +
                    "                                    <span class=\"color-mute ng-binding\">还剩" + result[i].DishAmount + "份</span></p>\n" +
                    "                                    <p>\n" +
                    "                                    <span class=\"color-mute ng-binding\">" + result[i].DishInfo + "</span></p>\n" +
                    "                                </div>\n" +
                    "                                <span class=\"col-3 shopmenu-food-price color-stress ng-binding\">" + result[i].DishPrice + "<small\n" +
                    "                                        class=\"ng-binding\"></small>\n" +
                    "                                    <!-- ngIf: food.min_purchase && food.min_purchase > 1 --></span> " +
                    "                                    <!-- end ngIf: !cartItem.quantity && menuFood.stock -->\n" +
                    "                                    <!-- ngIf: !menuFood.stock -->\n" +
                    "                                    <!-- ngIf: cartItem.quantity > 0 || cartItem.quantity === '' --></div>\n" +
                    "                                    <!-- end ngIf: !menuFood.hasSpec --><!-- ngIf: menuFood.hasSpec --></div></span>\n" +
                    "                            </div><!-- end ngRepeat: food in category.foods -->";

            }
            success.innerHTML += "<hr>";

        }
    })
}


function add() {
    $('#pmodel').modal('show');
}

function addpp() {
    $('#pmodel').modal('hide');
    var name = $("#name").val();
    var stock = $("#stock").val();
    var num = $("#num").val();
    var price = $("#price").val();
    if (name == null || name == "") {
        alert("请正确填写商品名称");
    }
    else if (stock == null || stock == "" || !(/(^[0-9]*[1-9][0-9]*$)/.test(stock))) {
        alert("请正确填写库存");
    }
    else if (num == null || num == "") {
        alert("请正确填写分量");
    }
    else if (price == null || price == "" || (!(/(^[0-9]*[1-9][0-9]*$)/.test(price)) && !(/(^([1-9]+(\.\d+)?|0\.\d+)$)/.test(price)))) {
        alert("请正确填写价格");
    }
    else {

        var thisURL = decodeURI(window.location.href);
        chaptcha = thisURL.split('~')[2];
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "AddDishServlet",
            traditional: true,
            data: {
                "name": name,
                "price": price,
                "DishAmount": stock,
                "Dishinfo": num,
                "chaptcha": chaptcha,
                "startTime": '2019-06-01',
                "endTime": '2019-08-01'
            },
            success: function (result) {
                if (!result) {
                    alert("添加新菜品成功");
                    var thisURL = decodeURI(window.location.href);
                    name = thisURL.split('~')[1];
                    chaptcha = thisURL.split('~')[2];
                   // var url = encodeURI("Restaurant.jsp?~" + name + "~" + chaptcha);
                   // window.location.href = url;
                    Dishes();
                } else {
                    alert("添加新菜品失败");
                }
            }
        })
    }
}

function Discount() {
    //显示已有的优惠
    //新增优惠

    var thisURL = decodeURI(window.location.href);
    var name = thisURL.split('~')[1];
    var chaptcha = thisURL.split('~')[2];
    var url = encodeURI("MarketDiscount.jsp?~" + name + "~" + chaptcha);
    window.location.href = url;
   /* main1.innerHTML = "";
    //得到已有的优惠
    $.ajax({
        type: "POST",
        dataType: "json",
        data: {"chaptcha": chaptcha},
        url: "GetRestaurantDiscountServlet",
        success: function (result) {
            console.log(result);
            var main = document.getElementById("main");
            main.innerHTML = "<div id=\"success\">\n" +
                "    已有优惠：\n" +
                "</div>\n" +
                "<a>新增优惠</a>\n" +
                "<div id=\"newdiscount\">\n" +
                "<div id='" + number + "'>\n" +
                "    满：\n" +
                "    <input id=\"FullPrice\" type=\"text\"/>\n" +
                "    减：\n" +
                "    <input id=\"MinusPrice\" type=\"text\"/>\n" +
                "  <br><br>  开始时间：\n" +
                "    <input id=\"startTime\" type=\"date\" value=\"2019-06-01\"/>\n" +
                " <br><br>   截止时间：\n" +
                "    <input id=\"endTime\" type=\"date\" value=\"2019-06-01\"/>\n" +
                "</div>\n" +
                "<div id='discount'>\n" +
                "</div>\n" +
                "</div>\n" +
                "<button onclick=\"AddDiscount()\">添加</button>";
            var success = document.getElementById("success");
            //var doing =document.getElementById("doing");
            for (var i = 0; i < result.length; i++) {
                console.log(result[i]);
                success.innerHTML +=
                    "<div>  \n" +
                    " 满：\n" +
                    result[i].Full +
                    "    减：\n" +
                    result[i].Minus +
                    "<div>  \n" +
                    " 开始时间：\n" +
                    result[i].StartTime.split(" ")[0] +
                    "    截止时间：\n" +
                    result[i].EndTime.split(" ")[0] +
                    "</div>  \n" +
                    "<button onclick='deleteDiscount(" + result[i].Full + "," + chaptcha + "," + result[i].Minus + ")'>删除</button>";
            }
        }
    })*/
}

/*
function NewDiscount(){
    number++;
    newdiscount=document.getElementById("discount");
    newdiscount.innerHTML +="<div id='"+number+"'>\n"+
        "    满：\n" +
        "    <input id=\"FullPrice\" type=\"text\"/>\n" +
        "    减：\n" +
        "    <input id=\"MinusPrice\" type=\"text\"/>\n" +
        "<button onclick='DeleteDiscount("+number+")'>删除</button>"+
        "</div>\n" ;
}
*/
function DeleteDiscount(Num) {
    Num = Num + "";
    var deletediscount = document.getElementById(Num);
    deletediscount.innerHTML = "";
}

function AddDiscount() {
    var thisURL = decodeURI(window.location.href);
    name = thisURL.split('~')[1];
    chaptcha = thisURL.split('~')[2];
    //var FullPrice=new Array();
    //var MinusPrice=new Array();
    var full, minus, starttime, endtime;
    newdiscount = document.getElementById("newdiscount");
    //alert(newdiscount.childNodes[1].childElementCount);
    if (newdiscount.childNodes[1].childElementCount != 0) {
        console.log(newdiscount.childNodes[1].children[0].value);
        full = newdiscount.childNodes[1].children[0].value;
        minus = newdiscount.childNodes[1].children[1].value;
        starttime = newdiscount.childNodes[1].children[4].value;
        endtime = newdiscount.childNodes[1].children[7].value;
        console.log(starttime);
        console.log(endtime);
        //alert(FullPrice);
        //alert(FullPrice);
        //FullPrice.push(full);
        //MinusPrice.push(minus);
    }

    //alert(FullPrice);
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
            //alert(result);
            if (result[0] == "fail") {
                var thisURL = decodeURI(window.location.href);
                name = thisURL.split('~')[1];
                chaptcha = thisURL.split('~')[2];
                var url = encodeURI("Restaurant.jsp?~" + name + "~" + chaptcha);
                window.location.href = url;
            } else {
                if (result[0] == "success") {
                    alert("添加失败");
                } else {
                    alert("已存在满" + result[0] + "的优惠");
                }
            }
            //返回一个String数组：如果已有一样的申请返回该申请的full和minus(String类型);如果成功String[0]=="Success";失败=="Fail";
        }
    });
}

function AddDish() {
    var name = document.getElementById("DishName").value;
    if (name == null || name == "") {
        alert("请填写菜名");
    }
    var price = document.getElementById("DishPrice").value;
    if (price == null || price == "") {
        alert("请填写菜价");
    }
    var DishAmount = document.getElementById("DishAmount").value;
    if (DishAmount == null || DishAmount == "") {
        alert("请填写数量");
    }
    var Dishinfo = document.getElementById("Dishinfo").value;
    if (Dishinfo == null || Dishinfo == "") {
        alert("请填写菜品的详细信息");
    }
    var startTime = document.getElementById("startTime").value;
    if (startTime == null || startTime == "") {
        alert("请填写开始时间");
    }
    var endTime = document.getElementById("endTime").value;
    if (endTime == null || endTime == "") {
        alert("请填写截止时间");
    }
    var thisURL = decodeURI(window.location.href);
    chaptcha = thisURL.split('~')[2];
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "AddDishServlet",
        traditional: true,
        data: {
            "name": name,
            "price": price,
            "DishAmount": DishAmount,
            "Dishinfo": Dishinfo,
            "chaptcha": chaptcha,
            "startTime": startTime,
            "endTime": endTime,
        },
        success: function (result) {
            if (!result) {
                alert("添加新菜品成功");
                var thisURL = decodeURI(window.location.href);
                name = thisURL.split('~')[1];
                chaptcha = thisURL.split('~')[2];
                var url = encodeURI("Restaurant.jsp?~" + name + "~" + chaptcha);
                window.location.href = url;
            } else {
                alert("添加新菜品失败");
            }
        }
    })

}

//添加一个删除已有优惠的方法，需要参数
function deleteDiscount(full, chaptcha, minus) {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "DeleteDiscountServlet",
        traditional: true,
        data: {
            "full": full,
            "minus": minus,
            "chaptcha": chaptcha
        },
        success: function (result) {
            //alert(result);
            if (!result) {
                alert("删除成功");
                var thisURL = decodeURI(window.location.href);
                var name = thisURL.split('~')[1];
                var chaptcha = thisURL.split('~')[2];
                var url = encodeURI("Restaurant.jsp?~" + name + "~" + chaptcha);
                window.location.href = url;
            } else {
                alert("删除失败");
            }
        }
    })
}
