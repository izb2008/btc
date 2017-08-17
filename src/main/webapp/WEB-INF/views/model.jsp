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
    <meta charset="UTF-8">
    <%--<style>--%>
        <%--.portDetailWrap>p{--%>
            <%--width: 9.2rem;--%>
            <%--height: 1.6rem;--%>
            <%--font-weight: bold;--%>
            <%--box-sizing: border-box;--%>
            <%--padding: 0 0.4rem;--%>
            <%--display: -webkit-box;--%>
            <%--display: flex;--%>
            <%--display: -webkit-flex;--%>
            <%---webkit-box-pack: justify;--%>
            <%--justify-content: space-between;--%>
            <%---webkit-justify-content: space-between;--%>
            <%---webkit-box-align: center;--%>
            <%--align-items: center;--%>
            <%---webkit-align-items: center;--%>
            <%--background: #dde2e9;--%>
            <%--color: #535860;--%>
        <%--}--%>
        <%--.portUl>li{--%>
            <%--width: 9.2rem;--%>
            <%--height: 1.6rem;--%>
            <%--color: #828b97;--%>
            <%--box-sizing: border-box;--%>
            <%--padding: 0 0.4rem;--%>
            <%--display: -webkit-box;--%>
            <%--display: flex;--%>
            <%--display: -webkit-flex;--%>
            <%---webkit-box-pack: justify;--%>
            <%--justify-content: space-between;--%>
            <%---webkit-justify-content: space-between;--%>
            <%---webkit-box-align: center;--%>
            <%--align-items: center;--%>
            <%---webkit-align-items: center;--%>
        <%--}--%>
        <%--.portUl>li:nth-of-type(even){--%>
            <%--background: #dde2e9;--%>
        <%--}--%>
    <%--</style>--%>
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
