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
    <%String uid = (String)session.getAttribute("uid"); 
      Connection con = null;
      Statement st = null;
      try {  
            Class.forName("com.mysql.jdbc.Driver");  
              
            con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/aa", "root", "123456"); 
              
        } catch (Exception e) {  
            System.out.println("数据库连接失败" + e.getMessage() );  
        } 
       String sql = "select * from user where uid = " + uid;
       st = (Statement) con.createStatement();     
       String name = null;
       String sex = null;
       int age = 0; 
       String tel = null;
       ResultSet rs = st.executeQuery(sql);    
       while (rs.next()) {
       	  name = rs.getString("name");
       	  sex = rs.getString("sex");
       	  age = rs.getInt("age");
       	  tel = rs.getString("tel");
       } 
       con.close();
       
       session.setAttribute("hostname",name);
       session.setAttribute("sex",sex);
       session.setAttribute("age",age);
       session.setAttribute("tel",tel);
       
       
       %>
    <table>
    	<tr>
    		<td>ID: <%out.print(uid); %></td>
    	</tr>
    	<tr>
    		<td>Name: <%out.print(name); %></td>
    	</tr>
    	<tr>
    		<td>Sex: <%out.print(sex); %></td>
    	</tr>
    	<tr>
    		<td>Age: <%out.print(age); %></td>
    	</tr>
    	<tr>
    		<td>Tel: <%out.print(tel); %></td>
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
