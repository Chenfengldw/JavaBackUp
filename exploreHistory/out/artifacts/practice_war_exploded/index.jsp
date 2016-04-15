<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="Dao.ItemsDao" %>
<%@ page import="model.Items" %>

<%--
  Created by IntelliJ IDEA.
  User: ldw
  Date: 2016/4/8
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>show commodity</title>
</head>
<body>
<h1>goods list</h1>
<hr>
<%
  ItemsDao itemsDao = new ItemsDao();
  System.out.println(itemsDao==null);
  ArrayList<Items> list = itemsDao.getAllItems();
  System.out.println(list==null);
  if(list!=null&&list.size()>0)
  {
    for(int i=0;i<list.size();++i)
    {
      Items item = list.get(i);
%>
<center>
  <table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
    <tr>
      <td>
        <div>
          <dl>
            <dt>
              <a href="details.jsp?id=<%=item.getId()%>"><img src="images/<%=item.getPicture()%>" width="120" height="90"></a>
            </dt>
            <dd class="dd_name">name:<%=item.getName()%></dd>
            <dd class="dd_city">place:<%=item.getCity()%></dd>
            <dd class="dd_price">price:<%=item.getPrice()%></dd>
          </dl>
        </div>
        <%
            }
          }
        %>
      </td>
    </tr>
  </table>
</center>

</body>
</html>
