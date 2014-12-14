<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'Default.jsp' starting page</title>
    
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
    <%String Name_e=new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8"); %>
    
    <%String money = request.getParameter("money"); 
      String num = request.getParameter("num");%>
      <%out.println("The amount of money is "+ money); %><br>
      <%double p = Double.parseDouble(money);
      int q = Integer.parseInt(num); 
      double m = p/q;%>
      <%out.println("Everyone should pay" + m); %>
      
      <%Connection con = null;
      Statement st = null;
      try {  
          Class.forName("com.mysql.jdbc.Driver");  
            
          con = DriverManager.getConnection(  
                  "jdbc:mysql://localhost:3306/aa", "root", "123456"); 
            
      } catch (Exception e) {  
          System.out.println("数据库连接失败" + e.getMessage() );  
      }
      String userid[] = new String[q]; 
      
      String sql = "select * from person where activityname = \"" + Name_e + "\"";
      st = (Statement) con.createStatement();
      ResultSet rs = st.executeQuery(sql);
      
      int i = 0;
      while(rs.next()){
       		userid[i] = rs.getString("userid");
       		i++;
       }
       
       try{
			for(i = 0; i < q; i++){
				//String sql = "insert into person values(" + ID[i] + ",\"" + name + "\"," + weight[i] + ",\""+ uid + "\")";// 更新数据的sql语句
				String position = ""; 
				position = Name_e + userid[i]; 
				sql = "update person set weight = " + m + " where position = " + "\"" + position + "\"";
		        st = (Statement) con.createStatement();    //创建用于执行静态sql语句的Statement对象，st属局部变量    
		        int count = st.executeUpdate(sql);// 执行更新操作的sql语句，返回更新数据的
			}
			con.close();   //关闭数据库连接
		}catch(SQLException e){
			System.out.println("数据库加载失败" + e.getMessage());
		}
     %>
     <%String token = (String)session.getAttribute("token");
      StringBuilder builder = new StringBuilder();
      Timeline tm = new Timeline(token);
    
	  String statues = "AA模板已确定，请到此链接确认您的应缴费用!";  
	  builder.append(statues);
	  for(int j = 0; j < q ; j++){
	  	builder.append("@" + userid[j]);
	  }
	  try {
			Status status = tm.updateStatus(builder.toString());
		} catch (WeiboException e) {
			e.printStackTrace();
		}	
     %>
      
      
      <br><a href="welcome2.jsp">return</a>
  </body>
</html>
