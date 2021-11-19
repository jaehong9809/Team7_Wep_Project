<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<jsp:useBean id="now" class="java.util.Date"/>
	<%
	request.setCharacterEncoding("utf-8");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String id=(String)session.getAttribute("userID");
	String passwd=(String)session.getAttribute("userPW");
	String date = now.toLocaleString();
	
	ResultSet rs = null;
	PreparedStatement stmt = null;
	
	int num=0;
	String sql="select max(num) from board";
	stmt=conn.prepareStatement(sql);
	rs=stmt.executeQuery();
	if(rs.next()){
		num=rs.getInt("max(num)")+1;
	}
	
	try{
		sql="insert into board(title, content, id, passwd, date, num) values(?, ?, ?, ?, ?, ?)";
		stmt=conn.prepareStatement(sql);
		stmt.setString(1, title);
		stmt.setString(2, content);
		stmt.setString(3, id);
		stmt.setString(4, passwd);
		stmt.setString(5, date);
		stmt.setInt(6, num);
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
	alert("등록완료");
	location.href="./board.jsp";
	</script>
</body>
</html>