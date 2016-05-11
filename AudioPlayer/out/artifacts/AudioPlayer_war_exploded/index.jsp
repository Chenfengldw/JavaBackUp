<%--
  Created by IntelliJ IDEA.
  User: ldw
  Date: 2016/4/12
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="listener.ZJPFileListener" %>
<%@ page import="monitor.ZJPFileMonitor" %>
<%@ page import="static java.lang.Thread.sleep" %>
<%@ page import="java.io.File" %>
<html>
  <head>
    <title>audio player</title>
  </head>
    <body>
  <center>
    <audio controls="controls" id="audio">
    </audio>
  </center>
    <div class="left-container">
      <ul id="list">
      <%

        ZJPFileMonitor m = new ZJPFileMonitor(5000);
        m.monitor("D:\\Documents\\Music",new ZJPFileListener());
        m.start();

        File file = new File("D:\\Documents\\Music");
        File [] files = file.listFiles();
        for(File f:files)
        {
          String name = f.getName();
          if(name.charAt(name.length()-1)!='3')continue;
      %>
        <li><%=f.getName()%></li>
      <%
        }
      %>
      </ul>
    </div>

  <center><input type="button" value="check new songs" width="30" height="20" onclick="createRequest()" align="center"></center>
  <script type="text/javascript">

    function $(s){
      return document.querySelectorAll(s);
    }

    var list = $("#list li");

    var xhr = new XMLHttpRequest();


    function createRequest(){
      xhr.onreadystatechange = callback;
      var url = "getList.jsp";
      xhr.open("POST", url, true);
      xhr.send();

    }

    function callback(){
      if(xhr.readyState==4){
        var nameArray = xhr.responseText.substring(xhr.responseText.indexOf('[')+1,xhr.responseText.length-1).split(",");
        console.log(nameArray);
        for(var j = 0;j<nameArray.length;++j)
        {
            var newNode = document.createElement("li");
            newNode.innerHTML = nameArray[j];
            document.getElementById("list").appendChild(newNode);
            list = $("#list li");
            onclickFunc();
        }
      }

    }

    function onclickFunc(){
      for(var i=0;i<list.length;++i){
        list[i].onclick = function(){
          var audio = document.getElementById("audio");
          //audio.pause();
          for(var j=0;j<list.length;++j){
            list[j].style.color = "#000";
          }
          this.style.color = "#f00";
          audio.src="getSong.jsp?name="+this.innerHTML;
          console.log(audio.src);

        }
      }
    }

    onclickFunc();



  </script>
  </body>
</html>
