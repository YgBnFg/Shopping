<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="util.*" import="domain.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<%
	List<Shoppingcart> lsc = (List<Shoppingcart>) session.getAttribute("Shoppingcart");
Userinfo u = (Userinfo) session.getAttribute("userinfo");
%>
<body>
	<h2 align="center">我的购物车</h2>
	<div align="center">
		<table>
			<tr>
				<td width="550"><%=u.getRealname()%>， <%
					if (lsc.size() == 0) {
				%>
					你的购物车为空.
				<td><a href="goods.do?flag=0"><input type="button"
						value="点击购买" /></a></td>
				<td><a href="user.do?flag=2"><input type="button"
						value="退出" /></a></td>
				<%
					} else {
				%>
				你的物品列表:
				</td>
				<td><a href="user.do?flag=2"><input type="button"
						value="退出" /></a></td>
			</tr>
		</table>
	</div>
	<form action="cart.do?flag=3" method="post">
		<div align="center">
			<table width="600" border="1" cellpadding="1" cellspacing="1"
				bordercolor="#FFFFFF" bgcolor="#B3D9D9">
				<tr>
					<td height="25">商品名称</td>
					<td>价格</td>
					<td>数量</td>
					<td>共计</td>
				</tr>
				<%
					for (int i = 0; i < lsc.size(); i++) {
							Shoppingcart sc = lsc.get(i);
				%>
				<tr>
					<td height="25" bgcolor="#FFFFFF"><%=sc.getGoodsName()%></td>
					<td bgcolor="#FFFFFF"><%=sc.getPrice()%></td>
					<td bgcolor="#FFFFFF"><input type="text"
						value="<%=sc.getNumber()%>" name="num" />
					</td>
					<td bgcolor="#FFFFFF"><%=sc.getNumber() * sc.getPrice()%></td>
					<td bgcolor="#FFFFFF"><a
						href="cart.do?flag=4&id=<%=sc.getId()%>">删除</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="600" bgcolor="#B3D9D9">
				<tr>
					<td width="102"><input type="submit" value="修改数量"
						name="submit" /></td>
					<td width="189">
						<%
							float allCost = 0;
								for (Shoppingcart sc : lsc) {
									allCost += sc.getNumber() * sc.getPrice();
								}
						%> 共计：<%=allCost%>
					</td>
					<td width="108"><a href="cart.do?flag=2"> <input
							type="button" value="清空购物车" /></a></td>
					<td width="50"><a href="account.do?flag=0"><input
							type="button" value="支付" /></a></td>
					<td width="132"><a href="goods.do?flag=0"><input
							type="button" value="继续购买" /></a></td>
				</tr>
			</table>
		</div>
	</form>
	<%} %>
</body>
</html>