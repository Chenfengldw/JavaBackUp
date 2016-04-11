<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/8
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
<%!
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
      PreparedStatement stmt = null;
      ResultSet set = null;

      try {
        conn = DBHelper.getConnection();
        String sql = "select * from items;";
        stmt = conn.prepareStatement(sql);
        set = stmt.executeQuery();
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
      }

    }
  }


%>

<%



%>
  </body>
</html>
