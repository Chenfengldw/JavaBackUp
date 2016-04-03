package db;

import java.sql.*;

public class HelloJDBC{

    private static final String user = "root";
    private static final String key = "liuduowen123";
    private static final String url = "jdbc:mysql://127.0.0.1:3306/hellojdbc";

    private static Connection conn;
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn =  DriverManager.getConnection(url, user, key);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static Connection getConnection(){
            return conn;
    }

}