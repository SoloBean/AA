<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'welcome2.jsp' starting page</title>
    
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
    <ul class="list-group">
				<li class="list-group-item"><a href="details.action"><b>个人信息</b>
				</a>
				</li>
				<li class="list-group-item"><a href="SetAnActivity.action"><b>创建活动</b>
				</a>
				</li>
	</ul>
	<!-- history of activities -->
	<h4>由我创建:</h4>
	<% 
	   Connection con = null;   
	   Statement st = null; 
       try {  
            Class.forName("com.mysql.jdbc.Driver");  
              
            con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/aa", "root", "123456"); 
              
        } catch (Exception e) {  
            System.out.println("数据库连接失败" + e.getMessage() );  
        } 
       String uid = (String)session.getAttribute("uid");
       String sql = "select activityname from activity where uid = " + uid;
       st = (Statement) con.createStatement();     
              
       ResultSet rs = st.executeQuery(sql);   
       int i = 0;  
       String []name = new String[50];
       while (rs.next()) {
       	  name[i] = rs.getString("activityname");
       	  i++; 
       } 
       con.close();
    %>
    <% for (int j = 0; j <i; j++){%>
    	<a href="history.jsp?name=<%=name[j]%>"><%=name[j] %></a><br>
    <%} %>
  </body>
</html>
