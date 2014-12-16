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
    <%String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
    String sql_1 = "delete from person where activityname = \"" + name+ "\"";
    String sql_2 = "delete from activity where activityname = \"" + name+"\"";
    Connection con = null;
       try {  
            Class.forName("com.mysql.jdbc.Driver");// 加载Mysql数据驱动  
            
            
            con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/aa", "root", "123456");// 创建数据连接
           	
           	
           
        } catch (Exception e) {  
            System.out.println("数据库连接失败" + e.getMessage());  
        }  
          
            Statement st = con.createStatement();
            
        out.println("Deleting...");
        st.executeUpdate(sql_1); 
        st.executeUpdate(sql_2); 
        
        out.print("删除成功");
        
         con.close();
     %><br>
     <a href="welcome2.jsp">返回</a><br>
  </body>
</html>
