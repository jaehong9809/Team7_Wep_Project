<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//session.invalidate();
	String name;
	String value;
	
	Enumeration en=session.getAttributeNames();
	
	while(en.hasMoreElements()){
		name=en.nextElement().toString();
		value=session.getAttribute(name).toString();
		out.println(name);
		out.println(value);
	}
	%>
</body>
</html>