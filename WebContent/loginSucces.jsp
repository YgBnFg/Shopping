<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="util.*" import="domain.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	Userinfo u = (Userinfo) session.getAttribute("userinfo");
%>
<title>登录成功</title>
<style type="text/css">
</style>
</head>
<body>
	<h2 align="center">登陆成功</h2>
	<div align="center">
		<span> Hello, <% if(u.getRealname()!=null) {%> <%=u.getRealname()%>。</span>
		<a href="cart.do?flag=0">购物车</a> 
		<%}else { %>
		<span> 管理员 <%=u.getName()%>。</span>
		<a href="goods.do?flag=2">添加物品</a>
		<%} %>
		<a href="goods.do?flag=0"> 所有物品</a> 
		<a href="user.do?flag=2">退出</a>
	</div>
</body>
</html>
