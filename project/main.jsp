<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
	<%
	String id=(String)session.getAttribute("userID");
	out.println(id+"님 환영합니다.");
	%>
	<form action="logout.jsp" method="post">
	<input type="submit" value="로그아웃">
	</form>
	<a href="./search.jsp">
	<img src="images/yak.png" width="200" height="200"/>
	</a>
	<a href="./map.jsp">지도</a>
	<a href="./board.jsp">게시판</a>
</body>
</html>