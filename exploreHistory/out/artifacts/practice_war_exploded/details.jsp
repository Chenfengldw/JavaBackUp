<%@ page import="Dao.ItemsDao" %>
<%@ page import="model.Items" %>
<%@ page import="java.util.ArrayList" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/11
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>details</title>
</head>
<body>

<%
  ItemsDao dao = new ItemsDao();
  Items item = dao.getItemById(Integer.parseInt(request.getParameter("id")));
  String cookieName = "item"+item.getId();
  String cookieValue = String.valueOf(item.getId());
  Cookie itemCookie = new Cookie(cookieName,cookieValue);
  itemCookie.setMaxAge(100);
  response.addCookie(itemCookie);
%>

<h1>details of good NO.<%=item.getId()%></h1>
<hr>
<center>
<table>
  <tr>
    <td rowspan="3"><img src="images/<%=item.getPicture()%>" width="300" height="180"></td>
    <td><B>name:<%=item.getName()%></B></td>
  </tr>
  <tr>
      <td><B>price:<%=item.getPrice()%></B></td>
  </tr>
  <tr>
    <td><B>city:<%=item.getCity()%></B></td>
  </tr>
</table>
  <table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
    <tr>
      <td>
        <%
            Cookie[] cookies = request.getCookies();
            ItemsDao hItemsDao = new ItemsDao();
            ArrayList<Items> hArr = new ArrayList<Items>();
            for(Cookie tmp:cookies) {
              if(!tmp.getName().substring(0,4).equals("item"))continue;
              Items hItem = hItemsDao.getItemById(Integer.parseInt(tmp.getValue()));
              if(hArr.contains(hItem))continue;
              hArr.add(hItem);
            }

            for(Items hItem:hArr){
        %>
        <div>
          <dl>
            <dt>
              <a href="details.jsp?id=<%=hItem.getId()%>"><img src="images/<%=hItem.getPicture()%>" width="120" height="90"></a>
            </dt>
            <dd class="dd_name">name:<%=hItem.getName()%></dd>
            <dd class="dd_city">place:<%=hItem.getCity()%></dd>
            <dd class="dd_price">price:<%=item.getPrice()%></dd>
          </dl>
        </div>
        <%

          }
        %>
      </td>
    </tr>
  </table>
</center>
</body>
</html>
