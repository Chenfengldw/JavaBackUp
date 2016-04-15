package Dao;

import control.DBHelper;
import model.Song;

import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Administrator on 2016/4/12.
 */
public class SongDao {

        public ArrayList<Song> getAllSongs(){

            Connection conn = null;
            java.sql.Statement stmt = null;
            ResultSet rs = null;
            ArrayList<Song> songList = new ArrayList<Song>();


            try {
                conn = DBHelper.getConnection();
                String sql = "select * from songs;";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                while(rs.next()){
                    Song s = new Song();
                    s.setName(rs.getString("name"));
                    s.setPath(rs.getString("path"));
                    s.setId(rs.getInt("id"));
                    songList.add(s);
                }
                return songList;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }finally{
                if(rs!=null){
                    try {
                        rs.close();
                        rs=null;
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


        public Song getSongById(int id){
            Connection conn = null;
            java.sql.Statement stmt = null;
            ResultSet rs = null;
            Song s = new Song();

            try {
                conn = DBHelper.getConnection();
                String sql = "select * from songs where id = "+id+";";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                s.setId(id);
                s.setPath(rs.getString("path"));
                s.setName(rs.getString("name"));

                return s;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }finally{
                if(rs!=null){
                    try {
                        rs.close();
                        rs=null;
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
