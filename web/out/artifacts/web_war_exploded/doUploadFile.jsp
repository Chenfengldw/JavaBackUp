<%--
  Created by IntelliJ IDEA.
  User: ldw
  Date: 2016/4/4
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.awt.*" %>
<%@ page import="javax.swing.*" %>
<%@ page import="javax.swing.text.html.Option" %>
<%@ page import="com.sun.java.swing.plaf.windows.resources.windows" %>
<html>
<head>
    <title>upload file demo</title>
    <input type="button" value="back" onclick="window.history.go(-1)">
</head>
<body>
<%
  //define max size of file
  int MAX_SIZE = 102400*102400;

  //define file streams
  DataInputStream inStream = null;
  FileOutputStream outStream = null;

  //get client and server
  String clientAddr = request.getRemoteAddr();
  String serverName = request.getServerName();

  //get path ont the network
  String realPath = request.getSession().getServletContext().getRealPath("");
  System.out.println("real path is "+realPath);
  realPath = realPath.substring(0,realPath.lastIndexOf("\\"));

  //get local path
  String localPath = realPath+"\\upload\\";

  //get input
  String contentType = request.getContentType();

  try {
    if (contentType.indexOf("multipart/form-data") >= 0) {
      inStream = new DataInputStream(request.getInputStream());
      int dataLength = request.getContentLength();
      if (dataLength > MAX_SIZE) {
        System.out.println("<P>the file size cannot be larger than" + MAX_SIZE + "</p>");
        return;
      }

      byte dataBytes[] = new byte[dataLength];
      int byteRead = 0;
      int totalRead = 0;

      //use a loop to read data by bytes from inStream to dataBytes
      while(totalRead<dataLength){
        byteRead = inStream.read(dataBytes,totalRead,dataLength);
        totalRead += byteRead;
      }

      String file = new String(dataBytes);
      String saveFile = file.substring(file.indexOf("filename=\"") + 10);
      saveFile = saveFile.substring(0,saveFile.indexOf("\n"));
      saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
      int lastIndex = contentType.lastIndexOf("=");

      String boundary = contentType.substring(lastIndex + 1,contentType.length());

      //get file path and name
      String fileName = localPath  + saveFile;

      int pos;
      pos = file.indexOf("filename=\"");
      pos = file.indexOf("\n",pos) + 1;
      pos = file.indexOf("\n",pos) + 1;
      pos = file.indexOf("\n",pos) + 1;
      int boundaryLocation = file.indexOf(boundary,pos) - 4;

      int startPos = ((file.substring(0,pos)).getBytes()).length;

      int endPos = ((file.substring(0,boundaryLocation)).getBytes()).length;
      System.out.println(fileName);
      File checkFile = new File(fileName);
      int checkSame = 1;
      while(checkFile.exists()){
        System.out.println("<p>" + saveFile + " file already exists.</p>");
        fileName = fileName.substring(0,fileName.lastIndexOf("."))+checkSame+fileName.substring(fileName.lastIndexOf("."));
        checkFile = new File(fileName);
      }
      //check if the load path exists
      File fileDir = new File(localPath);
      if(!fileDir.exists()){
        fileDir.mkdirs();
      }
      outStream = new FileOutputStream(fileName);
      outStream.write(dataBytes,startPos,(endPos - startPos));
      outStream.close();
      System.out.println(saveFile + " file uploaded succesfully.</p>");
      Object[] options = { "OK", "CANCEL" };
      int n = JOptionPane.showOptionDialog(null,"Click Ok to go back","Succeeded!",JOptionPane.DEFAULT_OPTION,JOptionPane.WARNING_MESSAGE,null,options,options[0]);
      if(application.getAttribute("counter")==null){
        application.setAttribute("counter",1);
      }
      else{
        String num = application.getAttribute("counter").toString();
        Integer tmp = Integer.valueOf(num);

        tmp++;
        application.setAttribute("counter",tmp);
      }

    }else {
      String content = request.getContentType();
      System.out.println("<p>file type you choose is not multipart/form-data</p>");
    }
  } catch (IOException e) {
    JOptionPane.showMessageDialog(null, "alert", "alert", JOptionPane.ERROR_MESSAGE);
    e.printStackTrace();
  }


%>

Session: <%=session.getCreationTime()%>

you are NO.:<%=application.getAttribute("counter")%> visitor!
</body>
</html>
