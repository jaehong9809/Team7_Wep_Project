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
	<jsp:include page="header.jsp"/>
	
	<div style="width:70%;margin-left:15%;margin-top:10px;border-radius: 0.5em;">
	<table border="1" style="width:100%; border:3px solid #04B4AE;">
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
	request.setCharacterEncoding("utf-8");
	String option=request.getParameter("opt");
	String search=request.getParameter("search");
	if(option==null)
		option="";
	if(search==null)
		search="";

	ResultSet rs = null;
	PreparedStatement stmt = null;
			
	try{
		String sql;
		if(option.equals("1") && !search.equals("")){
			sql="select * from board where title like '%"+search.toLowerCase()+"%' order by num desc";
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
		}
		else if(option.equals("2") && !search.equals("	")){
			sql="select * from board where id=? order by num desc";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, search);
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
		}
		else{
			sql="select * from board order by num desc";
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
	</div>
	
	<div style="height:50px;width:70%;;margin:0 auto;margin-top:15px;">
	<form action="board.jsp" method="post">
		<select name="opt"  style="width:80px;height:30px;margin-bottom:10px;border-radius: 0.5em;">
			<option value="1">제목</option>
			<option value="2">작성자</option>
		</select>
		<input type="text" style="width:200px;height:25px;margin-bottom:10px;border-radius: 0.5em;" name="search">
		<input type="submit" style="width:80px;height:30px;margin-bottom:10px;border-radius: 0.5em;background-color:#04B4AE;" value="검색">
	</form>
	
	<form action="board_write.jsp" method="post" style="float: right;">
		<input style="width:80px;height:30px;margin-bottom:10px;border-radius: 0.5em;background-color:#04B4AE;"type="submit" value="글쓰기">
	</form>
	
	</div>
</body>
</html>