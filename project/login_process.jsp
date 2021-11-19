<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Process</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
	ResultSet rs = null;
	PreparedStatement stmt = null;
	
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd");
	
			
	try{
		String sql="select * from member where id=?";
		stmt=conn.prepareStatement(sql);
		stmt.setString(1, id);
		rs=stmt.executeQuery();
		while(rs.next()){
			String rId=rs.getString("id");
			String rPasswd=rs.getString("passwd");
			
			
			if(id.equals(rId)&&passwd.equals(rPasswd)){
				session.setAttribute("userID", id);
				session.setAttribute("userPW", passwd);
				%>
				<script type="text/javascript">
				alert("로그인 성공 했습니다.");
				location.href="./main.jsp";
				</script>
				<%
			}
			else{
				%>
				<script type="text/javascript">
				alert("아이디 또는 비밀번호가 잘못 입력 되었습니다.");
				location.href="./login.jsp"
				</script>
				<% 
			}
		}
			%>
			<script type="text/javascript">
			alert("아이디 또는 비밀번호가 잘못 입력 되었습니다.");
			location.href="./login.jsp"
			</script>
			<%
			
		
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