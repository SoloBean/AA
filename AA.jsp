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
    
    <title>My JSP 'AA.jsp' starting page</title>
    
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
    Custom Page. <br>
    <s:form action="SetAA">
    <%-- <%String num_e = request.getParameter("num"); %>
    <%out.print(num_e); %> --%>
    <%-- <%String num_e = request.getParameter("num"); 
      int num =  Integer.parseInt(num_e);
      for (int i = 0; i < num; i++){%>
      ID:<input type="text" name="ID[<%= i%>]"/>
      <%session.setAttribute("ID[i]", request.getParameter("ID[i]")); %>
      Weight:<input type="text" name="weight[<%= i%>]"/><br>	  
    <% }
    %>  --%>
    <%String money = request.getParameter("money");
      session.setAttribute("money",money);%>
    <%String num_e = request.getParameter("num"); %>
    <%session.setAttribute("num_e", num_e) ;%>
    <%double moneyout = Double.parseDouble(money); %>
    Money:<input type="text" name="money"/> 
    <%int num = Integer.parseInt(num_e);%>
    <%for (int i = 0; i < num; i++){%>
    	ID:<input type="text"  name="ID[<%=i %>]"/>
    	Weight:<input type="text"  name="weight[<%=i %>]"/>
    	<%-- <form name="form" action="locker"> 
			LOCK:<input type="radio" name="lock[<%=i %>]" value=0><br> 
			UNLOCK:<input type="radio" name="lock[<%=i %>]" value=1 checked><br> 
		</form>  --%>
    <% }%>
   <s:submit/>
   </s:form>
  </body>
</html>
