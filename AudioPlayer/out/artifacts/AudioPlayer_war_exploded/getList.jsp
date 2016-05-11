<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/21
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.ObjectOutputStream" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    File file = new File("D:\\Documents\\Music");
    File [] files = file.listFiles();
    ObjectOutputStream os = new ObjectOutputStream(response.getOutputStream());
    String name;
    //ArrayList<String> nameArray = new ArrayList<String>();
    String total = "[";
    for(File f:files){
        name = f.getName();
        if(name.charAt(name.length()-1)!='3')continue;
        //nameArray.add(name);
        total+=name;
        total+=",";
    }
    total=total.substring(0,total.length()-1);
    total+="]";

    System.out.println(total);
    os.writeObject(total);
    //System.out.println(os);
    os.flush();
    os.close();


%>

</body>
</html>
