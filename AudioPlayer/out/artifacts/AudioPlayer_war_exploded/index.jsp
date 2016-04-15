<%--
  Created by IntelliJ IDEA.
  User: ldw
  Date: 2016/4/12
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="Dao.SongDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Song" %>
<html>
  <head>
    <title>audio player</title>
  </head>
  <body>
  <center>
    <audio controls="controls">
      <source src="D:\Documents\Music\Kalafina - to the beginning.mp3" type="audio/mpeg">
    </audio>
  </center>

    <div class="left-container">
      <ul id="list">
      <%
        SongDao songDao = new SongDao();
        ArrayList<Song> songList = songDao.getAllSongs();
        if(songList!=null&&songList.size()>0){
          for(Song s:songList){
      %>
        <li><B><font size="20"><%=s.getName()%></font></B></li>
      <%
          }
        }
      %>
      </ul>
    </div>
  <script type="text/javascript">
    function $(s){
      return document.querySelectorAll(s);
    }

    var list = $("#list li");

    document.write(list.length);
    for(var i=0;i<list.length;++i){
      list[i].onclick = function(){
        for(var j=0;j<list.length;++j){
          list[j].className="";
        }
        this.className="selected";
      }
    }
  </script>
  </body>
</html>
