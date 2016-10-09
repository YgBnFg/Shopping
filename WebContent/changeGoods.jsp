<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="util.*" import="domain.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">添加物品</h2>
	<%
		Goods g=(Goods)request.getAttribute("good");
	%>
	<form action="goods.do?flag=3" method="post">
		<div align="center">
			<table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#B3D9D9">
				<tr>
					<td>商品名称：
						<input type="text" name="goodsname" value="<%=g.getGoodsname()%>" />
					</td>
				</tr>
				<tr>
					<td>价格	：<input type="text" name="price" value="<%=g.getPrice()%>" /></td>
				</tr>
				<tr>
					<td>数量：<input type="text" name="number" value="<%=g.getNumber()%>" /></td>
				</tr>
				<tr><td align="right"><input type="submit" value="提交" onClick="return check()">
						<input type="button" value="返回"
						onClick="javascript:history.go(-1)"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>