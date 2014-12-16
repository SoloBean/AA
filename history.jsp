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
    
    <%String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8"); %>
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
      int money = 0;
      int amount = 0;
      while(rs.next()){
      	 String date = rs.getString("date");
      	 out.println("时间是" + date);
      	 String location = rs.getString("location");
      	 out.println("地点是" + location);
      	 money = rs.getInt("money");
      	 out.println("钱数是" + money);
      	 amount = rs.getInt("amount");
      	 out.println("人数是" + amount);
      }%> 
      <br>
    <%sql = "select * from person where activityname = \"" + name + "\"";
		String userid[] = new String[amount];
		double weight[] = new double[amount];
      st = (Statement) con.createStatement();     
      rs = st.executeQuery(sql); 
      int i = 0;
     
      double moneyperson = 0;
      while (rs.next()){ 
         userid[i] = rs.getString("userid");
         weight[i] = rs.getDouble("weight");
      	 out.println(userid[i] + "         ");
      	 moneyperson = money*weight[i];
      	 out.println("付款: " + Integer.parseInt(new java.text.DecimalFormat("0").format(moneyperson)) + "   "); 
      	 i++;
      }
      con.close();%>  
      <br>
  <a href="welcome2.jsp">返回</a><br>
  <a href="money.jsp?name=<%=name%>">编辑</a><br>
  <a href="Delete.jsp?name=<%=name%>">删除</a>
  </body>
</html>
