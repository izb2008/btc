<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    //页面每隔30秒自动刷新一遍
    response.setHeader("refresh","30000000");
%>
<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>A Beautiful Table</title>
<link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>css/css-table.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/style-table.js"></script>
</head>

<body>
<div>
    <a href="<%=basePath%>home/BTC">btc</a>
    <a href="<%=basePath%>home/LTC">ltc</a>
    <a href="<%=basePath%>home/ETH">eth</a>
</div>
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

    <c:forEach items="${listNoValue}" var="list"  varStatus="i">
        <tr>
            <th scope="row">${list.name}</th>
            <td>${list.price}</td>
            <td>${list.percent}</td>
            <td>${list.difference}</td>
        </tr>
    </c:forEach >

    </tbody>

</table>

<p>Source: Labour Force Survey</p>

</body>
</html>