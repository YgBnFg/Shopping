<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<title>Insert title here</title>
<script language="javaScript">
	function check() {
		if (document.getElementsByName("name")[0].value == "") {
			alert("用户名不能为空！");
			return false;
		}
		if (document.getElementsByName("password")[0].value == "") {
			alert("密码不能为空！");
			return false;
		}
		//document.form.submit();
	}
</script>
</head>
<body>
	<h2 align="center">登陆</h2>
	<form action="user.do?flag=1" method="post" name="form" id="form" onsubmit="return check();">
		<table width="304" height="89" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#B3D9D9"">
			<tr>
				<td width="72" align="center">用户名：</td>
				<td colspan="2" bgcolor="#FFFFFF"><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td align="center">密码：</td>
				<td colspan="2" bgcolor="#FFFFFF"><input type="password" name="password" /></td>
			</tr>
		</table>
		<br>
		<div align="center">
			<input type="submit" value="登陆" />
			<input type="reset" name="submit"value="重置" />
			<a href="regist.jsp"> <input type="button" value="注册" /></a>
		</div>
	</form>
</body>
</html>