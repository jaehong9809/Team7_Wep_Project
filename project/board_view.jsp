<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%request.setCharacterEncoding("utf-8");
	String s=request.getParameter("num");
	ResultSet rs = null;
	PreparedStatement stmt = null;
			
	try{
		String sql="select * from board where num = ?";
		stmt=conn.prepareStatement(sql);
		stmt.setString(1, s);
		rs=stmt.executeQuery();
		while(rs.next()){
			
			String title=rs.getString("title");
			String id=rs.getString("id");
			String date=rs.getString("date");
			String content=rs.getString("content");
			%>
			<table border="1" width=500>
			<tr><td>제목</td><td><%=title %></td></tr>
			<tr><td>작성자</td><td><%=id %></td></tr>
			<tr><td>작성일</td><td><%=date %></td></tr>
			<tr><td>내용</td><td><%=content %></td></tr>
			</table>
			<%
		}
			
	
	}catch(SQLException e){
		out.println("error");
	}finally{
		if(rs!=null)
			rs.close();
		if(stmt!=null)
			stmt.close();
		if(conn!=null)
			conn.close();
	}
	%>
	
</body>
</html>