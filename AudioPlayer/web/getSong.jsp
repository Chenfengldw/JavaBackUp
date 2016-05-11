<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.OutputStream" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/20
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String name = request.getParameter("name");
  String file = "D:\\Documents\\Music\\"+name;
  FileInputStream is = new FileInputStream(new File(file));
  OutputStream os = response.getOutputStream();
  byte [] buffer = new byte[50000000];
  int index = 0;
  while((index=is.read(buffer))!=-1){
      os.write(buffer,0,index);
      System.out.println(index);
  }
  os.flush();
  is.close();
  os.close();
%>
</body>
</html>
