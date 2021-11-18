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
	<%
		out.print("<div id='map' style='width:500px;height:400px;'></div>");
		out.print("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=3b6d82765fcafd32b7989cbb031604fd\"></script>");
		out.print("<script>");
		out.print("var container=document.getElementById('map');");
		out.print("var options={");
		out.print("center:new kakao.maps.LatLng(33.450701, 126.570667),");
		out.print("level: 5");
		out.print("};");
		out.print("var lon=126.570667;");
		out.print("var map=new kakao.maps.Map(container, options);");
		out.print("var markerPosition  = new kakao.maps.LatLng(33.450701, lon); ");
		out.print("var marker = new kakao.maps.Marker({");
		out.print("  position: markerPosition");
		out.print("});");
		out.print("marker.setMap(map);");
		out.print("</script>");
	%>
	
</body>
</html>