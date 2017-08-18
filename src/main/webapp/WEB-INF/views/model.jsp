<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/14 0014
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/mystyle.css" charset="UTF-8"/>
    <meta charset="UTF-8">
</head>
<body>
    <div>
        <a href="http://localhost:8080/btc/home/BTC">btc</a>
        <a href="http://localhost:8080/btc/home/LTC">ltc</a>
    </div>
    <div class="portDetailWrap">
        <p class="font15"><span style="font-size:24px;color:#6f50ff;">     ${name}    金额(USD)</span></p>
        <ul class="portUl font13">
            <c:forEach items="${list}" var="list"  varStatus="i">
                <li><p>${list.name} : ${list.price}</p></li>
            </c:forEach >
        </ul>
        <ul class="portUl font13">
            <c:forEach items="${listNoValue}" var="list"  varStatus="i">
                <li><p>${list.name} : ${list.price}</p></li>
            </c:forEach >
        </ul>
    </div>
</body>
</html>
