<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript">
    function sbmOK(){
		document.fm.submit();
 }
    </script>
    <title>My JSP 'money.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
  <form action="./Settlement2.jsp" name="fm" method="post">
  <%String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");%>
         输入更改的钱数：<input type="text" name="money">
  <input type="hidden" name="name" value="<%=name%>">
  </form>
  </body>
</html>
