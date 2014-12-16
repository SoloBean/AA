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
    
    <title>My JSP 'ChangeInformation.jsp' starting page</title>
    
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
  <% String uid = (String)session.getAttribute("uid"); 
  	 String name = (String)session.getAttribute("hostname");
     String sex = (String)session.getAttribute("sex");
     int age = (Integer)session.getAttribute("age"); 
     String tel = (String)session.getAttribute("tel");
  %>
    This is my JSP page. <br>
    <s:form action="ChangeInformationResult.action">
    	<table border="8" width="200px">
    	<tr>
    		<td>ID: <%out.print(uid); %></td>
    	</tr>
    	<tr>
    		<td>Name: <%out.print(name); %></td>
    	</tr>
		<tr>
		    <td>Sex: <s:textfield name="sex"/></td>
		</tr>
		<tr>
		    <td>Age: <s:textfield name="age"/></td>
		</tr>
		<tr>
		    <td>Tel: <s:textfield name="tel"/></td>
		</tr>
    </table>
	<s:submit />
	</s:form>
  </body>
</html>
