<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/6
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<html>
<head>
    <title>login</title>
</head>
<body>
<h1>login successfully</h1>
<hr>
<%
  String remember = request.getParameter("remember");
  if(remember!=null){
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Cookie usernameCookie = new Cookie("username",username);
    Cookie passwordCookie = new Cookie("password",password);
    usernameCookie.setMaxAge(100);
    passwordCookie.setMaxAge(100);
    response.addCookie(usernameCookie);
    response.addCookie(passwordCookie);
  }
  else {
    Cookie [] cookies = request.getCookies();
    if(cookies!=null&&cookies.length!=0){
      for(Cookie c:cookies){
        if(c.getName().equals("username")||c.getName().equals("password")){
          c.setMaxAge(0);
          response.addCookie(c);
        }
      }
    }
  }
%>
<a href="showInfo.jsp">show user info</a>
<input type="button" onclick="showInfo.jsp" value="show info">
</body>
</html>
