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
    
    <title>My JSP 'SetAnActivity.jsp' starting page</title>
    
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
    Activity. <br>
    <s:form action="InitialiseActivity">
    <table border="8" width="200px">
    	<tr>
		    <td>Name:<s:textfield name="name" /></td>
		</tr>
		<tr>
		    <td>Date: <s:textfield name="date" /></td>
		</tr>
		<tr>
		    <td>Location: <s:textfield name="location" /></td>
		</tr>
		<tr>
		    <td>Money: <s:textfield name="money" /></td>
		</tr>
		<tr>
		    <td>Amount: <s:textfield name="num" /></td>
		</tr>
    </table>
    	<s:submit />
    </s:form>
  </body>
</html>
