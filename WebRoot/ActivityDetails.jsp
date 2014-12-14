<%@ page language="java" import="java.sql.*,org.apache.struts2.ServletActionContext" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ActivityDetails.jsp' starting page</title>
    
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
  
  <table border="8" width="200px">
  	<tr>
  		<td>名称: <s:property value="name" /></td>
  	</tr>
  	<tr>
  		<td>日期: <s:property value="date" /></td>
  	</tr>
  	<tr>
  		<td>地点: <s:property value="location" /></td>
  	</tr>
  	<tr>
  		<td>钱: <s:property value="money" /></td>
  	</tr>
  	<tr>
  		<td>人数: <s:property value="num" /></td>
  	</tr>
  </table>
  
  <s:form action="SetAnActivity">
  <s:submit value="Edit" />
  </s:form>

  <a href="Custom.action?num=${num}&money=${money}&name=${name}">自定义模板</a><br>
  <a href="Default.jsp?num=${num}&money=${money}&name=${name}">默认</a><br>
  </body>
</html>
