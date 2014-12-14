<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%@ page language="java" import="Action.*" %>
<%@ page import ="weibo4j.Timeline, weibo4j.model.Status, weibo4j.model.WeiboException"%>
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
    <%String activityname = (String)session.getAttribute("name"); %>
    <%double moneydouble = Double.parseDouble(money); %>
    <%int num = Integer.parseInt(num_e);
      double p = Double.parseDouble(money); %>
     <%for (int i = 0; i < num; i++){%>
    <% }%>
    <%Connection con = null;   
	   Statement st = null; 
       try {  
            Class.forName("com.mysql.jdbc.Driver");  
              
            con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/aa", "root", "123456"); 
              
        } catch (Exception e) {  
            System.out.println("数据库连接失败" + e.getMessage() );  
        } 
       String sql = "select * from person where activityname = \"" + activityname + "\"";
       st = (Statement) con.createStatement();   
       
       ResultSet rs = st.executeQuery(sql);
       
       String userid[] = new String[num];
       double weight[] = new double[num];
       double moneyout[] = new double[num];
       
       int i = 0;
       while(rs.next()){
       		userid[i] = rs.getString("userid");
       		weight[i] = rs.getDouble("weight");
       		i++;
       }%>
       <%for (int j = 0; j < num; j++) {
       		moneyout[j] = moneydouble * weight[j];%>
       		Name :<%out.println(userid[j]); %><br>
       		Money :<%out.println(moneyout[j]); %><br>
       <%} %>
    <%String token = (String)session.getAttribute("token");
      StringBuilder builder = new StringBuilder();
      Timeline tm = new Timeline(token);
    
	  String statues = "AA模板已确定，请到此链接确认您的应缴费用!";  
	  builder.append(statues);
	  for(int j = 0; j < num ; j++){
	  	builder.append("@" + userid[j]);
	  }
	  try {
			Status status = tm.updateStatus(builder.toString());
		} catch (WeiboException e) {
			e.printStackTrace();
		}	
     %>
    <s:form action="welcome">
    <s:submit value="return" />
    </s:form>
  </body>
</html>
