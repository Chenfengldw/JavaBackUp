<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<title><%= application.getServerInfo() %></title>
<body>
upload file demo
<form action="doUploadFile.jsp" method="post" enctype="multipart/form-data">
  choose file<input type="file" name="upfile" size="50">
  <input type="submit" value="提交">
</form>
</body>
</html>
