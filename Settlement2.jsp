<%@ page language="java" import="java.sql.*,org.apache.struts2.ServletActionContext" pageEncoding="utf-8"%>
<%@ page language="java" import="Action.*" %>
<%@ page import ="weibo4j.Timeline, weibo4j.model.Status, weibo4j.model.WeiboException"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Settlement2.jsp' starting page</title>
    
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
    <%
	String money = request.getParameter("money");
	double moneyout = Double.parseDouble(money);
	
	String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
	
	
	Connection con = null;
    Statement st = null;
    try {  
        Class.forName("com.mysql.jdbc.Driver");  
            
        con = DriverManager.getConnection(  
                  "jdbc:mysql://localhost:3306/aa", "root", "123456"); 
            
    } catch (Exception e) {  
        System.out.println("数据库连接失败" + e.getMessage() );  
    } 
    String sql = "update activity set money = " + moneyout + " where activityname = " + "\"" + name + "\"";
    st = (Statement) con.createStatement();    //创建用于执行静态sql语句的Statement对象，st属局部变量    
	int count = st.executeUpdate(sql);// 执行更新操作的sql语句，返回更新数据的个
	
	sql = "select * from activity where activityname = \"" + name + "\"";
    st = (Statement) con.createStatement();
    int num = 0;
    
    ResultSet rs = st.executeQuery(sql);
    while (rs.next()) {
				num = rs.getInt("amount");
				out.print(" num is  " + num);
	}
    
      sql = "select * from person where activityname = \"" + name + "\"";
       st = (Statement) con.createStatement();   
       
      rs = st.executeQuery(sql);
       
       String userid[] = new String[num];
       double weight[] = new double[num];
       double moneychange[] = new double[num];
       
       int i = 0;
       while(rs.next()){
       		userid[i] = rs.getString("userid");
       		weight[i] = rs.getDouble("weight");
       		i++;
       }%>
      <%for (int j = 0; j < num; j++) {
       		moneychange[j] = moneyout * weight[j];
       		%>
       		Name :<%out.println(userid[j]); %><br>
       		Money :<%out.println(Integer.parseInt(new java.text.DecimalFormat("0").format(moneychange[j]))); %><br>
       <%} 
       con.close();
       
       String token = (String)session.getAttribute("token");
       StringBuilder builder = new StringBuilder();
      Timeline tm = new Timeline(token);
    
	  String statues = "AA模板已确定，钱数以更改为： " + moneyout;  
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
     <a href="welcome2.jsp">返回</a><br>
  </body>
</html>
