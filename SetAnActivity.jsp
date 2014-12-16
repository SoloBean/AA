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
	
	

  <style type="text/css">
table.imagetable {
	font-family: verdana, arial, sans-serif;
	font-size: 18px;
	color: #333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.imagetable th {
	background: #b5cfd2 url('cell-blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
	font-family: "Microsoft YaHei UI";
}
table.imagetable td {
	background: #dcddc0 url('cell-grey.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
	text-align: center;
	font-family: "Microsoft YaHei UI";
}
  .activity {
	font-size: 24px;
}
  body,td,th {
	color: #000;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
}
  body {
	background-color: #9FC;
}
  </style>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <div align="center">
  <body style="width: 428px; font-family: 'Microsoft YaHei UI';">
    <div align="center"><span class="activity">Activity. </span><br>
    </div>
   <div align="center">
  <s:form action="InitialiseActivity">
    	
         <div align="center">
           <table width="265" align="center" class="imagetable" style="height: 410px; ">
             <tr>
               <th width="257"><div align="center"><em>名称: 
               <input name="name" type="text">
               </em></div></th>
  		    </tr>
                    
             <tr>
               <td><div align="center"><em>时间:	 
               <input name="date" type="text">
               </em></div></td>
		    </tr>
             <tr>
               <th><div align="center"><em>地点:	 
               <input name="location" type="text">
               </em></div></th>
		    </tr>
             <tr>
               <td><div align="center"><em>钱:	 
               <input name="money" type="text">
               </em></div></td>
		    </tr>
             <tr>
               <th><div align="center"><em>人数:	 
               <input name="num" type="text">
               </em></div></th>
		    </tr>
                     </table>
    </div>
    <p align="center">
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
	 out.println(name[j]);%><input type="radio" name="userid[<%=j%>]" value="<%=name[j]%>" />
    邀请	       				
    <input type="radio" name="userid[<%=j%>]" value="<%="0"%>" checked/>不邀请 <br>
      <%} %> 
      <input type="hidden" name="count" value="<%=i%>"/>
    </p>
         
         <div align="center">
           <s:submit />
      </div>
    </s:form>
    </div>
  </body>
  </div>
<ml>
