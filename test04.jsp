<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.*, org.w3c.dom.*, javax.xml.xpath.*, org.xml.sax.InputSource" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="LoginForm" action="test04_process.jsp" method="post">
		<o> 시도 : <input type="text" name="addr1">
		<p> 시군구 : <input type="text" name="addr2">
		<p> <input type="submit" value="정보 찾기">
	</form>
	<form name="LoginForm" action="test04_map.jsp" method="post">
		<o> 시도 : <input type="text" name="addr1">
		<p> 시군구 : <input type="text" name="addr2">
		<p> <input type="submit" value="지도 찾기">
	</form>
</body>
</html>