<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javaScript">
function check() {
	var psw=document.getElementsByName("password")[0].value;
	var psw1=document.getElementsByName("password1")[0].value
	if (document.getElementsByName("name")[0].value == "") {
		alert("username can not be empty!");
		return false;
	}
	if (document.getElementsByName("password")[0].value == "") {
		alert("password can not be empty!");
		return false;
	}
	if (document.getElementsByName("realname")[0].value == "") {
		alert("realname can not be empty!");
		return false;
	}
	if (document.getElementsByName("tel")[0].value == "") {
		alert("tel can not be empty!");
		return false;
	}
	if(psw != psw1) {
		alert("pw and confirm pw is not consistent");
		return false;
	}
	return true;
}
</script>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center"> 欢迎</h2>
<div align="center">
	<form action="user.do?flag=0" method="post" onsubmit="return check();">
		<table width="304" height="89" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#B3D9D9">
		<tr>
			<td>用户名:</td>
			<td colspan="2" bgcolor="#FFFFFF"> <input type="text" name="name" /></td>
		 </tr>
		 <tr>
			<td>密码:</td>
			<td colspan="2" bgcolor="#FFFFFF"><input type="password" name="password" /> </td>
		 </tr>
		 <tr>
			<td>重复密码:</td>
			<td colspan="2" bgcolor="#FFFFFF"> <input type="password" name="password1" /></td>
		 </tr>
		 <tr>
			<td> 真实姓名:</td>
			<td colspan="2" bgcolor="#FFFFFF"><input type="text" name="realname" /> </td>
		 </tr>
		 <tr>
			<td> 性别：</td>
			<td colspan="2" bgcolor="#FFFFFF">
			&nbsp;&nbsp;&nbsp;男<input type="radio" name="sex" value="man" checked="checked">
          	女<input type="radio" name="sex" value="women"> 
          	</td>
		 </tr>
		 <tr>
			<td> 电话：</td>
			<td colspan="2" bgcolor="#FFFFFF"><input type="text" name="tel" /> </td>
		 </tr>
		</table>
		<input type="submit" value="提交" />
			<input type="reset" name="submit"value="重置" />
	</form>
</div>
</body>
</html>