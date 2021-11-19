<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<table border="1">
	<thead align="center">
	<tr>
	<td>번호</td>
	<td width=300>제목</td>
	<td width=100>작성자</td>
	<td width=200>등록일</td>
	</tr>
	</thead>
	<tbody align="center">
	<%
	ResultSet rs = null;
	PreparedStatement stmt = null;
			
	try{
		String sql="select * from board order by date desc";
		stmt=conn.prepareStatement(sql);
		
		rs=stmt.executeQuery();
		while(rs.next()){
			
			String title=rs.getString("title");
			String id=rs.getString("id");
			String date=rs.getString("date");
			out.println("<tr><td>"+rs.getInt("num")+"</td>");
		%>
		<td width=300><a href="board_view.jsp?num=<%=rs.getInt("num")%>"><%=title %></a>
		<%
			out.println("<td width=100>"+id+"</td>");
			out.println("<td width=200>"+date+"</td></tr>");
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
	</tbody>
	</table>
	<p><a href="./board_write.jsp">글쓰기</a>
</body>
</html>