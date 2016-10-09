<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="util.*" import="domain.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">所有物品</h2>
	<div align="center">
		<table width="600" height="30">
			<%
				Userinfo u = (Userinfo) session.getAttribute("userinfo");
			%>
			<%
				if (u.getRealname() != null) {
			%>
			<tr>
				<td width="456">hello ,<%=u.getRealname()%></td>
				<td width="72" align="right"><a href="mycart.jsp"><input
						type="button" value="我的购物车" /></a></td>
				<td width="56"><a href="user.do?flag=2"><input
						type="button" value="退出" /></a></td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td align="right">
				<a href="user.do?flag=2"><input type="button" value="退出" /></a>
				<a href="goods.do?flag=2"><input type="button" value="添加物品" /></a></td>
			</tr>
			<%
				}
			%>
		</table>
		<table width="600" border="1" cellpadding="1" cellspacing="1"
			bordercolor="#FFFFFF" bgcolor="#B3D9D9">
			<tr>
				<td height="25"><div align="center">物品名称</div></td>
				<td><div align="center">价格</div></td>
				<td><div align="center">数量</div></td>
				<td><div align="center">销量</div></td>
				<%
					if (u.getRealname() != null) {
				%>
				<td><div align="center">添加</div></td>
				<%
					} else {
				%>
				<td><div align="center">修改</div></td>

				<%
					}
				%>
			</tr>
			<%
				ArrayList<Goods> l = (ArrayList<Goods>) request.getAttribute("allGoods");
				for (int i = 0; i < l.size(); i++) {
					Goods g = (Goods) l.get(i);
			%>
			<tr>
				<td height="25" bgcolor="#FFFFFF"><%=g.getGoodsname()%></td>
				<td bgcolor="#FFFFFF"><%=g.getPrice()%></td>
				<td bgcolor="#FFFFFF"><%=g.getNumber()%></td>
				<td bgcolor="#FFFFFF"><%=g.getSalesvolume()%></td>
				<%
					if (u.getRealname() != null) {
				%>
				<td bgcolor="#FFFFFF"><a
					href="cart.do?flag=1&id=<%=g.getId()%>"><input type="button"
						value="点击购买"></a></td>
				<%
					} else {
				%>
				<td bgcolor="#FFFFFF"><a
					href="goods.do?flag=1&id=<%=g.getId()%>"><input type="button"
						value="修改"></a></td>
						<td bgcolor="#FFFFFF">
				<%
					}
				%>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>