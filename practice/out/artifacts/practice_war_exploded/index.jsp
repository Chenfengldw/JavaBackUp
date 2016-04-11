<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/5
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*" contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>
    </title>
  </head>
  <body>
  <h1>login</h1>
  <hr>
  <form action="doLogin.jsp" name="loginForm" method="post">
    <table>
      <tr>
        <td>user</td>
        <td><input type="text" name="user"></td>
      </tr>
      <tr>
        <td>password</td>
        <td><input type="password" name="password"></td>
      </tr>
      <tr>
        <td>hobby</td>
        <td>
          <input type="checkbox" name="hobby" value="reading">reading
          <input type="checkbox" name="hobby" value="music">music
          <input type="checkbox" name="hobby" value="movie">movie
          <input type="checkbox" name="hobby" value="gaming">gaming
        </td>

      </tr>
      <tr>
          <td colspan="2"><input type="submit" value="login"></td>
      </tr>
    </table>
  </form>
  </body>
</html>
