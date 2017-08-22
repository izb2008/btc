<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
</head>
<body>
<p>
    <button id="btnId_1">ajax请求1</button>
</p>
<p>
    <button id="btnId_2">ajax请求2</button>
</p>
</body>
<script type="text/javascript">
    $("#btnId_1").click(function(){
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/btc/homelist/BTC",
            success: function(msg){
                alert( "msg : " + msg );
            },
            error:
                function(msg){
                    alert( "error : " + msg );
                }
        });
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
</html>