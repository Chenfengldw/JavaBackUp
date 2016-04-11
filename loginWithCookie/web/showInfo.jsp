<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/6
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user info</title>
</head>
<body>
<h1>user info</h1>
<hr>
<%!
  String username="";
  String password="";
%>

<%
  Cookie [] cookies = request.getCookies();
  if(cookies!=null&&cookies.length!=0){
    for(Cookie c:cookies){
      if(c.getName().equals("username"))username=c.getValue();
      if(c.getName().equals("password"))password=c.getValue();
    }
  }
%>
username:<%=username%>
password:<%=password%>
</body>
</html>
