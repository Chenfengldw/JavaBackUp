package dao;

import db.HelloJDBC;
import model.language;
import java.sql.*;
import java.util.*;


/**
 * Created by Administrator on 2016/4/2.
 */
public class dao {
    public void add(String name){

    }

    public void delete(){

    }

    public void modify(){

    }

    public List<language> find() throws Exception{

        Connection conn = HelloJDBC.getConnection();
        Statement stmt = conn.createStatement();

        String query = "Select * from try";
        ResultSet rs = stmt.executeQuery(query);

        List<language> list = new ArrayList<language>();
        while(rs.next()){
            language l  = new language();
            l.setName(rs.getString("b"));
            l.setId(rs.getInt("a"));
            list.add(l);
        }

        return list;


    }
}
