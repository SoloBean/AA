<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'history.jsp' starting page</title>
    
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
    This is my JSP page. <br>
    <%String name= request.getParameter("name"); %>
    <%Connection con = null;   
	  Statement st = null; 
      try {  
          Class.forName("com.mysql.jdbc.Driver");  
              
          con = DriverManager.getConnection(  
                  "jdbc:mysql://localhost:3306/aa", "root", "123456"); 
              
      } catch (Exception e) {  
          System.out.println("数据库连接失败" + e.getMessage() );  
      }  %>
    <%String sql = "select * from activity where activityname = \"" + name + "\""; 
      st = (Statement) con.createStatement();     
              
      ResultSet rs = st.executeQuery(sql); 
      while(rs.next()){
      	 String date = rs.getString("date");
      	 String location = rs.getString("location");
      	 int money = rs.getInt("money");
      	 int amount = rs.getInt("amount");
      }%> 
    <%sql = "select * from person where activityname = \"" + name + "\"";
      int UID[] = new int[4];
      int i = 0;
      while (rs.next()){
      	 UID[i] = rs.getInt("userid");
      }%>  
  </body>
</html>
