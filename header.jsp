<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더내용</title>
</head>
<body>
<%
	String id=(String)session.getAttribute("userID");
%>
<div style="height:60px;width:100%;">
<div style="background-color:white; margin:5px; border:3px solid #04B4AE; height:60px;width:70%;border-radius: 1em;margin:0 auto;">
	<div style="float : left;margin:5px;margin-left:20px;">
	<a href="./main.jsp" height="5" width="10">
		<img src="yakgookimage.png" alt="약국 클릭" height="50" width="50">	
	</a>
	</div >
	<div style="float :left;margin:5px;margin-left:20px">
		<h4 style="color:#04B4AE">${userID }님 환영합니다.</h4>
	</div>
	<div style="float :right;margin-right:30px;margin-top:20px;">
		<form action="logout.jsp" method="post">
			<input style="background-color:white;color:#04B4AE;width:80px;height:50;border:3px solid #04B4AE;border-radius: 1em;"type="submit" value="로그아웃">
		</form>
	</div>
</div>

</div>
</body>
</html>