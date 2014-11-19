<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="Action.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Settlement.jsp' starting page</title>
    
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
    <%String money = (String)session.getAttribute("money"); %>
    <%String num_e = (String)session.getAttribute("num_e"); %>
    <%int num = Integer.parseInt(num_e);
      double p = Double.parseDouble(money); %>
      <%out.println(num); %>
     <%for (int i = 0; i < num; i++){%>
    <% }%>
    <s:iterator value="ID" status="status">
    ID=<s:property value="ID[#status.index]" />
    money=<s:property value="moneyout[#status.index]"/>
    <br>
    </s:iterator>
  </body>
</html>
