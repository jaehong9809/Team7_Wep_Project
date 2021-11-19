<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%

	request.setCharacterEncoding("utf-8");
	String id= request.getParameter("id");
	String passwd= request.getParameter("passwd");
	String name= request.getParameter("name");
	String addr= request.getParameter("addr");
	String phone= request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
	

	PreparedStatement stmt=null;
	
	try{
		String sql="insert into member(id, passwd, name, addr, phone) values(?, ?, ?, ?, ?)";
		stmt=conn.prepareStatement(sql);
		stmt.setString(1, id);
		stmt.setString(2, passwd);
		stmt.setString(3,name);
		stmt.setString(4, addr);
		stmt.setString(5, phone);
		stmt.executeUpdate();
	}
	catch(SQLException e){
		out.println("erorr");
	}
	finally{
		if(stmt != null)
			stmt.close();
		if(conn != null)
			conn.close();
	}
	%>
	<script type="text/javascript">
	alert("회원가입 완료");
	location.href="./login.jsp";
	</script>
	
</body>
</html>