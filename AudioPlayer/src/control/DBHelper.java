package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Administrator on 2016/4/12.
 */
public class DBHelper {

    private static final String user = "root";
    private static final String key = "liuduowen123";
    private static final String url = "jdbc:mysql://127.0.0.1:3306/hellojdbc";
    private static Connection conn = null;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, key);
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
