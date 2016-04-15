<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

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
<%!  // defile java dabase classes
  public class DBHelper{
    private static final String user = "root";
    private static final String key = "liuduowen123";
    private static final String url = "jdbc:mysql://127.0.0.1:3306/hellojdbc";
    private static Connection conn;

    static{
      try {
        Class.forName("com.mysql.jdbc.Driver");
      } catch (ClassNotFoundException e) {
        e.printStackTrace();
      }

      conn = DriverManager.getConnection(url,user,key);

    }

    public static Connection getConnection(){
      return conn;
    }
  }


  public class Items {
    private int id;
    private String name;
    private String city;
    private int price;
    private int store;
    private String picture;

    public void setId(int id) {
      this.id = id;
    }

    public void setName(String name) {
      this.name = name;
    }

    public void setCity(String city) {
      this.city = city;
    }

    public void setPrice(int price) {
      this.price = price;
    }

    public void setStore(int store) {
      this.store = store;
    }

    public void setPicture(String picture) {
      this.picture = picture;
    }

    public int getId() {
      return id;
    }

    public String getName() {
      return name;
    }

    public String getCity() {
      return city;
    }

    public int getPrice() {
      return price;
    }

    public int getStore() {
      return store;
    }

    public String getPicture() {
      return picture;
    }

  }

  public class ItemsDao {

    public ArrayList<Items> getAllItems(){
      Connection conn=null;
      Statement stmt = null;
      ResultSet resultSet = null;
      ArrayList<Items> arr = new   ArrayList<Items>();
      try {
        conn = DBHelper.getConnection();
        String sql = "select * from items;";
        stmt = conn.createStatement();
        resultSet = stmt.executeQuery(sql);
        while(resultSet.next()){
            Items it = new Items();
            it.setId(resultSet.getInt("id"));
            it.setName(resultSet.getString("name"));
            it.setCity(resultSet.getString("city"));
            it.setPrice(resultSet.getInt("price"));
            it.setPicture(resultSet.getString("picture"));
            it.setStore(resultSet.getInt("store"));
            arr.add(it);
        }
        return arr;

      } catch (Exception e) {
        e.printStackTrace();
        return null;
      } finally {
        if(resultSet!=null){
          try {
            resultSet.close();
            resultSet=null;
          } catch (SQLException e) {
            e.printStackTrace();
          }

        }
        try {
          stmt.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }


      }

    }
  }


%>

<h1>goods list</h1>
<hr>
<%
  ItemsDao itemsDao = new ItemsDao();
  ArrayList<Items> list = itemsDao.getAllItems();
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
                <a href="details.jsp"><img src="images/<%=item.getPicture()%>" width="120" height="90"></a>
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
