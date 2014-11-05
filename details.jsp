<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'details.jsp' starting page</title>
    
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
    Information<br>
    <table>
    	<tr>
    		<td>Name: <s:property value="name" /></td>
    	</tr>
    	<tr>
    		<td>Sex: <s:property value="sex" /></td>
    	</tr>
    	<tr>
    		<td>Age: <s:property value="age" /></td>
    	</tr>
    	<tr>
    		<td>Tel: <s:property value="tel" /></td>
    	</tr>
    </table>
    <a href="ChangeInformation.action"><b>Change Information</b></a>
    <center>
    <s:form action="returnindex.action">
	<s:submit value="Return" />
	</s:form>
	</center>
  </body>
</html>
