<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/6
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>login</title>
  </head>
  <body>
  <h1>user login</h1>
  <hr>

  <form name="login" action="doLogin.jsp" method="post">
    <table>
      <tr>
        <td>username</td>
        <td><input type="text" name="username" value=""></td>
      </tr>
      <tr>
        <td>password</td>
        <td><input type="password" name="password" value=""></td>
      </tr>
      <tr>
        <td colspan="2"><input type="checkbox" name="remember" checked="checked">remember me for 1 hour</td>
      </tr>
      <tr>
        <td align="center"><input type="submit" value="login"></td>
        <td align="center"><input type="button" value="cancel" onclick="window.history.go(-1)"></td>
      </tr>
    </table>
  </form>
  </body>
</html>
