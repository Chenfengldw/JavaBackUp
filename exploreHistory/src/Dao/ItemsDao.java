package Dao;

import model.Items;
import util.DBHelper;
import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Administrator on 2016/4/11.
 */
public class ItemsDao {
    public ArrayList<Items> getAllItems(){
        Connection conn=null;
        Statement stmt = null;
        ResultSet resultSet = null;
        ArrayList<Items> arr = new ArrayList<Items>();
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


    public Items getItemById(int id){
        Connection conn=null;
        Statement stmt = null;
        ResultSet resultSet = null;
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from items where id = "+id+";";
            stmt = conn.createStatement();
            resultSet = stmt.executeQuery(sql);
            if(resultSet.next()){
                Items it = new Items();
                it.setId(resultSet.getInt("id"));
                it.setName(resultSet.getString("name"));
                it.setCity(resultSet.getString("city"));
                it.setPrice(resultSet.getInt("price"));
                it.setPicture(resultSet.getString("picture"));
                it.setStore(resultSet.getInt("store"));
                return it;
            }else {
                return null;
            }
        }catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
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
