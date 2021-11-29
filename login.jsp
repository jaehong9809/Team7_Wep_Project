<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body >
	<dev style="height:800px;width:100%;text-align: center;">
	<form action="login_process.jsp" method="post" style="text-align:center;border:3px solid #04B4AE;
	border-radius: 0.5em; margin-left:35%;margin-top:10%;width:30%; height:100%;">
	<h1 style="text-align:center;margin:30px;color:">Login</h1>
	<input type="text" name="id" placeholder="아이디" style="height:2em;width:50%;background-color:rgb(232, 249, 253);">
	<input type="password" name="passwd" placeholder="비밀번호" style="margin-top:10px;height:2em;width:50%;background-color:rgb(232, 249, 253);">
	<p><input type="submit" value="로그인" style="height:38px;width:100px;border:3px solid green; background-color:#04B4AE; font-size:1.5em;border-radius: 0.5em;">
	<a href="./register.jsp" style="color:black;border:3px solid green;border-radius: 0.5em;font-size:1.5em;height:50px;width:100px;background-color:#04B4AE;">회원가입</a>
	</form>
	</dev>
</body>
</html>