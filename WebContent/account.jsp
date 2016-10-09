<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="util.*" import="domain.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%List<Shoppingcart> lsc = (List<Shoppingcart>) session.getAttribute("Shoppingcart");
Userinfo u = (Userinfo) session.getAttribute("userinfo"); %>
</head>
<body>
	<h2 align="center">订单信息</h2>
	<form action="account.do?flag=1" method="post">
		<div align="center">
			<table border="1"  cellspacing="1" bordercolor="#FFFFFF" bgcolor="#B3D9D9">
				<tr>
					<td>订单号:<input type="text" name="accountcode" readonly value="<%=request.getAttribute("accountCode")%>" /></td>
				</tr>
				<tr>
					<td>用户名:<input type="text" name="username" readonly value="<%=u.getName()%>" /></td>
				</tr>
				<tr>
					<td>真实姓名:<input type="text" name="realname" readonly value="<%=u.getRealname()%>" /></td>
				</tr>
				<tr>
					<td>地址：<input type="text" name="address" /></td>
				</tr>
				<tr>
					<td>邮编:&nbsp;<input type="text"name="postcode" /></td>
				</tr>
				<tr>
					<td>电话:&nbsp;<input type="text" name="tel" readonly value="<%=u.getTel()%>" /></td>
				</tr>
				<tr><td align="right"><input type="submit" value="结账" onClick="return check()">
						<input type="button" value="返回"
						onClick="javascript:history.go(-1)"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
