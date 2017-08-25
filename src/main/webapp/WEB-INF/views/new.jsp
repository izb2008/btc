<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.8.1.js"></script>
    <script type="text/javascript">
        $("#btnId_1").click(function(){
            alert("123");
            <%--$.ajax({--%>
                <%--type: "GET",--%>
                <%--url: "http://127.0.0.1:8080/btc/homelist/BTC",--%>
<%--//            contentType:"application/json;charset=utf-8",--%>
                <%--dataType:"json",--%>
                <%--success: function(data){--%>
                    <%--alert( "msg : " + data.list );--%>
                    <%--var array = new Array();--%>

<%--//2、通过c标签循环sinList 并生成添加到array的字符串--%>
                    <%--<c:forEach items="${data.list}" var="a">--%>
                    <%--array.push(${a}); //生成如 array.push(123)的字符串 这样前台拿到后就是js--%>
                    <%--</c:forEach>--%>
                <%--},--%>
                <%--error:--%>
                        <%--function(XMLHttpRequest, textStatus, errorThrown) {--%>
                            <%--alert(XMLHttpRequest.status);--%>
                            <%--alert(XMLHttpRequest.readyState);--%>
                            <%--alert(textStatus);--%>
                        <%--}--%>
            <%--});--%>
        });

        $("#btnId_2").click(function(){
            $.ajax({
                url: "http://127.0.0.1:8080/springMVC_demo_ano/user/login",
                type:"POST",
                cache:false,
                headers:{
                    'Content-Type':'application/json',
                    'Accept':'application/json'
                },
                dataType:"json",
                data: JSON.stringify({
                    'account' : "aaa",
                    'password' : "bbb"
                }),
                error: function(){},
                success: function(data){
                    alert("data="+data.msg);
                }
            });
        });

    </script>
</head>
<body>
<p>
    <button id="btnId_1">ajax请求1</button>
</p>
<p>
    <button id="btnId_2">ajax请求2</button>
</p>
<table id="travel" summary="Travel times to work by main mode (Autumn 2006) - Source: London Travel Report 2007 http://www.tfl.gov.uk/assets/downloads/corporate/London-Travel-Report-2007-final.pdf">

    <caption>Travel patterns in London - Travel times to work by main mode (Autumn 2006) - Minutes</caption>

    <thead>
    <tr>
        <th scope="col" rowspan="2">${name}</th>
        <%--<th scope="col" colspan="6">Area of workplace</th>--%>
    </tr>

    <tr>
        <th scope="col">金额（CNY）</th>
        <th scope="col">相差百分比</th>
        <th scope="col">差额</th>
        <%--<th scope="col">All London</th>--%>
        <%--<th scope="col">Rest of Great Britain</th>--%>
        <%--<th scope="col">Great Britain</th>--%>
    </tr>
    </thead>

    <%--<tfoot>--%>
    <%--<tr>--%>
    <%--<th scope="row">All modes</th>--%>
    <%--<td>55</td>--%>
    <%--<td>39</td>--%>
    <%--<td>27</td>--%>
    <%--<td>39</td>--%>
    <%--<td>20</td>--%>
    <%--<td>23</td>--%>
    <%--</tr>--%>
    <%--</tfoot>--%>

    <tbody>
    <c:forEach items="${list}" var="list"  varStatus="i">
        <%--<li><p>${list.name} : ${list.price}</p></li>--%>
        <tr>
            <th scope="row">${list.name}</th>
            <td>${list.price}</td>
            <td>${list.percent}</td>
            <td>${list.difference}</td>
        </tr>
    </c:forEach >

    </tbody>

</table>
</body>

</html>