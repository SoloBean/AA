<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AAmoney.jsp' starting page</title>
    
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
  <s:form action="SetAAmoney">
    <%String money = request.getParameter("money");
      session.setAttribute("money",money);%>
      
      
    <%String num_e = request.getParameter("num"); %>
    
    
    <%String Name_e=new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8"); %>
    <%session.setAttribute("name", Name_e) ;%>
    
    <%session.setAttribute("num_e", num_e) ;%>
    <%double moneyout = Double.parseDouble(money); %>
    <%int num = Integer.parseInt(num_e);%>
    <%String uid = (String)session.getAttribute("uid"); %>
    <%out.println("钱数是：  " + moneyout); %><br>
    <input type="hidden" name="num" value=<%=num %>>
    <input type="hidden" name="money" value=<%=moneyout %>>
    <input type="hidden" name="name" value=<%=Name_e %>>
    <input type="hidden" name="uid" value="<%=uid%>">
    
    <%Connection con = null;
      Statement st = null;
      try {  
          Class.forName("com.mysql.jdbc.Driver");  
            
          con = DriverManager.getConnection(  
                  "jdbc:mysql://localhost:3306/aa", "root", "123456"); 
            
      } catch (Exception e) {  
          System.out.println("数据库连接失败" + e.getMessage() );  
      } 
     String sql = "select * from person where activityname = \"" + Name_e + "\"";
     st = (Statement) con.createStatement();     
            
     ResultSet rs = st.executeQuery(sql);  
     String userid[] = new String[num];
     int i = 0;
     while (rs.next()){
    	 userid[i] = rs.getString("userid");
    	 i++;
     }
     %>
     <%for (int j = 0; j < num; j++){%>
    	名字:  <%out.println(userid[j]);%><input type="hidden" name="userid[<%=j%>]" value="<%=userid[j]%>"/>
    	权重:  <input type="text"  name="moneyperson[<%=j %>]"/>
    	<%-- <form name="form" action="locker"> 
			LOCK:<input type="radio" name="lock[<%=i %>]" value=0><br> 
			UNLOCK:<input type="radio" name="lock[<%=i %>]" value=1 checked><br> 
		</form>  --%>
    <% }%>
    <s:submit/>
   </s:form>
  </body>
</html>