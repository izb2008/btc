<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--<%--%>
    <%--//页面每隔30秒自动刷新一遍--%>
    <%--response.setHeader("refresh","3000");--%>
<%--%>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <script type="text/javascript" src="<%=basePath%>js/jquery-1.8.1.js"></script>
        <script type="text/javascript" src="<%=basePath%>js/style-table.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/css-table.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf8">
        <%--<meta http-equiv="refresh" content="8">--%>
    <title>Insert title here</title>
    <script type="text/javascript">
        function ajaxTest(){
            alert("213");
            $.ajax({
                data:"name="+$("#name").val(),
                type:"GET",
                dataType: 'json',
                url:"<%=basePath%>homelist/BTC",
                error:function(data){
                    alert("出错了！！:"+data.list);
                },
                success:function(data){
                    alert("success:"+data.list[0].price);
                    $("#result").html(data.list[0].price) ;
                }
            });
        }

//        window.onload = function() {
//            onloadBTC();
//            onloadLTC();
//            onloadETH();
//        }

        $(document).ready(function() {
            onloadBTC();
            onloadLTC();
            onloadETH();
            setInterval("onloadBTC()", 6000);
            setInterval("onloadLTC()", 6000);
            setInterval("onloadETH()", 6000);
        })

        var btctime = new Date().getTime();
        var ltctime = new Date().getTime();
        var ethtime = new Date().getTime();
            function onloadBTC() {
                $.ajax({
                    type: "GET",
                    dataType: 'json',
                    url: "<%=basePath%>homelist/BTC",
                    error: function (data) {
                        alert("出错了！！:" + data.list);
                    },
                    success: function (data) {
                        var array = data.list;
                        var arrayNoValue = data.listNoValue;
                        var arrayname = data.name;
                        console.log(data);
                        var htm = "";
                        htm += "<table id=\"travel\">\n" +
                            "    \n" +
                            "    <thead>    \n" +
                            "    \t<tr>\n" +
                            "            <th scope=\"col\" rowspan=\"2\">" + data.name + "</th>\n" +
                            "        </tr>\n" +
                            "        \n" +
                            "        <tr>\n" +
                            "            <th scope=\"col\">金额（CNY）</th>\n" +
                            "            <th scope=\"col\">相差百分比</th>\n" +
                            "            <th scope=\"col\">差额</th>\n" +
                            "        </tr>        \n" +
                            "    </thead>\n" +
                            "    <tbody>";
                        for (var i = 0; i < array.length; i++) {

                            //console.log(item[i].name);

                            htm += '<tr><th scope="row">' + array[i].name + '</th><td>'
                                + array[i].price + '</td><td>'
                                + array[i].percent + '</td><td>'
                                + array[i].difference + '</td></tr>';
                        }
                        for (var i = 0; i < arrayNoValue.length; i++) {

                            //console.log(item[i].name);

                            htm += '<tr><th scope="row">' + arrayNoValue[i].name + '</th><td>'
                                + arrayNoValue[i].price + '</td><td>'
                                + arrayNoValue[i].percent + '</td><td>'
                                + arrayNoValue[i].difference + '</td></tr>';
                        }
                        htm += '</tbody></table>';
                        if (array.length == 5) {
                            document.getElementById('btc').innerHTML = htm;
                            document.getElementById('btctime').innerHTML = parseInt((new Date().getTime() - btctime) / 1000);
                            btctime = new Date().getTime();
                        }
                    }
                });
            }



            function onloadLTC() {
                $.ajax({
                    type: "GET",
                    dataType: 'json',
                    url: "<%=basePath%>homelist/LTC",
                    error: function (data) {
                        alert("出错了！！:" + data.list);
                    },
                    success: function (data) {
                        var array = data.list;
                        var arrayNoValue = data.listNoValue;
                        var arrayname = data.name;
                        console.log(data);
                        var htm = "";
                        htm += "<table id=\"travel\">\n" +
                            "    \n" +
                            "    <thead>    \n" +
                            "    \t<tr>\n" +
                            "            <th scope=\"col\" rowspan=\"2\">" + data.name + "</th>\n" +
                            "        </tr>\n" +
                            "        \n" +
                            "        <tr>\n" +
                            "            <th scope=\"col\">金额（CNY）</th>\n" +
                            "            <th scope=\"col\">相差百分比</th>\n" +
                            "            <th scope=\"col\">差额</th>\n" +
                            "        </tr>        \n" +
                            "    </thead>\n" +
                            "    <tbody>";
                        for (var i = 0; i < array.length; i++) {

                            //console.log(item[i].name);

                            htm += '<tr><th scope="row">' + array[i].name + '</th><td>'
                                + array[i].price + '</td><td>'
                                + array[i].percent + '</td><td>'
                                + array[i].difference + '</td></tr>';
                        }
                        for (var i = 0; i < arrayNoValue.length; i++) {

                            //console.log(item[i].name);

                            htm += '<tr><th scope="row">' + arrayNoValue[i].name + '</th><td>'
                                + arrayNoValue[i].price + '</td><td>'
                                + arrayNoValue[i].percent + '</td><td>'
                                + arrayNoValue[i].difference + '</td></tr>';
                        }
                        htm += '</tbody></table>';
                        if (array.length == 4) {
                            document.getElementById('ltc').innerHTML = htm;
                            document.getElementById('ltctime').innerHTML = parseInt((new Date().getTime() - ltctime) / 1000);
                            ltctime = new Date().getTime();
                        }
                    }
                });
            }


            function onloadETH() {
            $.ajax({
                type:"GET",
                dataType: 'json',
                url:"<%=basePath%>homelist/ETH",
                error:function(data){
                    alert("出错了！！:"+data.list);
                },
                success:function(data){
                    var array = data.list;
                    var arrayNoValue = data.listNoValue;
                    var arrayname = data.name;
                    console.log(data);
                    var htm = "";
                    htm += "<table id=\"travel\">\n" +
                        "    \n" +
                        "    <thead>    \n" +
                        "    \t<tr>\n" +
                        "            <th scope=\"col\" rowspan=\"2\">" + data.name + "</th>\n" +
                        "        </tr>\n" +
                        "        \n" +
                        "        <tr>\n" +
                        "            <th scope=\"col\">金额（CNY）</th>\n" +
                        "            <th scope=\"col\">相差百分比</th>\n" +
                        "            <th scope=\"col\">差额</th>\n" +
                        "        </tr>        \n" +
                        "    </thead>\n" +
                        "    <tbody>";
                    for(var i=0;i<array.length;i++){

                        //console.log(item[i].name);

                        htm += '<tr><th scope="row">' + array[i].name + '</th><td>'
                            + array[i].price + '</td><td>'
                            + array[i].percent + '</td><td>'
                            + array[i].difference + '</td></tr>';
                    }
                    for(var i=0;i<arrayNoValue.length;i++){

                        //console.log(item[i].name);

                        htm += '<tr><th scope="row">' + arrayNoValue[i].name + '</th><td>'
                            + arrayNoValue[i].price + '</td><td>'
                            + arrayNoValue[i].percent + '</td><td>'
                            + arrayNoValue[i].difference + '</td></tr>';
                    }
                    htm += '</tbody></table>';
                    if (array.length == 4) {
                        document.getElementById('eth').innerHTML = htm;
                        document.getElementById('ethtime').innerHTML = parseInt((new Date().getTime() - ethtime) / 1000);
                        ethtime = new Date().getTime();
                    }
                }
            });
        }
    </script>
</head>
<body>
<h1 align="center">量化交易</h1>
<div id="btc"></div>
<div>距离上次更新<span id="btctime"></span>s</div>
<br/>
<br/>
<div id="ltc"></div>
<div>距离上次更新<span id="ltctime"></span>s</div>
<br/>
<br/>
<div id="eth"></div>
<div>距离上次更新<span id="ethtime"></span>s</div>
</body>
</html>