<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/5
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>

<%!
  final String user = "root";
  final String key = "liuduowen123";
  final String url = "jdbc:mysql://127.0.0.1:3306/hellojdbc";
  Connection conn;

  String username,password;
%>
<%
  out.println("<h1>succeeded</h1>");
%>
username:<%=request.getParameter("user")%>
<br>
password:<%=request.getParameter("password")%>
<br>
hobbies:

<%
  String [] s = request.getParameterValues("hobby");
  if(s.length==0)out.print("other");
  else{
    for(String tmp:s)out.print(tmp+"\n");
  }

%>


<%
  username = request.getParameter("user");
  password = request.getParameter("password");

  try {
    Class.forName("com.mysql.jdbc.Driver");
    conn =  DriverManager.getConnection(url, user, key);
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  } catch (SQLException e) {
    e.printStackTrace();
  }
  Statement stmt = conn.createStatement();
  //String query = "select * from user";
  String query = "Insert into user (username,password) value ("+"\""+username+"\""+","+"\""+password+"\""+");";
  System.out.print(query);
  stmt.executeUpdate(query);

%>
</body>
</html>
