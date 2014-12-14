<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import=" weibo4j.*, weibo4j.model.WeiboException, weibo4j.util.BareBonesBrowserLaunch" %>
<%@ page import="java.lang.String, weibo4j.model.User, weibo4j.Friendships, weibo4j.model.UserWapper" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SetAnActivity.jsp' starting page</title>
    
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
    Activity. <br>
    <s:form action="InitialiseActivity">
    <table border="8" width="400px">
    	<tr>
		    <td>活动名称:<s:textfield name="name" /></td>
		</tr>
		<tr>
		    <td>时间: <s:textfield name="date" /></td>
		</tr>
		<tr>
		    <td>地点: <s:textfield name="location" /></td>
		</tr>
		<tr>
		    <td>钱: <s:textfield name="money" /></td>
		</tr>
		<tr>
		    <td>人数: <s:textfield name="num" /></td>
		</tr>
    </table>
    <%String uid = (String)session.getAttribute("uid"); %>
    <input type="hidden" name="uid" value="<%=uid%>"/>
    <%String token = (String)session.getAttribute("token"); 
      Friendships fm = new Friendships(token);
     
     String userid[] = new String[50];
     String name[] = new String[50];
     
     for(int k = 0; k < 50 ; k++){
	 	userid[k] = "";
	 	name[k] = "";
	 }     
     int i = 0;
     for(User s : fm.getFriendsChainFollowers("5377677980").getUsers()){
			userid[i] = s.toString().substring(0, s.toString().lastIndexOf("="));
			name[i] = s.toString().substring(s.toString().lastIndexOf("=")+1, s.toString().length());
			//out.println(userid[i]);
			//=out.println(name[i]);
			i++;
	 }
	 for(int j = 0; j < i; j++) {
	 out.println(name[j]);%><input type="radio" name="userid[<%=j%>]" value="<%=name[j]%>" />邀请
	                        <input type="radio" name="userid[<%=j%>]" value="<%="0"%>" checked/>不邀请 <br>
	 <%} %> 
	 <input type="hidden" name="count" value="<%=i%>"/>
    	<s:submit />
    </s:form>
  </body>
</html>
