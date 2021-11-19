<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Connect</title>
</head>
<body>
    <% 
	Connection conn=null;
	String url="jdbc:mysql://localhost:3306/JSPBookDB";
	String db_user="root";
	String db_passwd="1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url, db_user, db_passwd);
	%>
</body>
</html>