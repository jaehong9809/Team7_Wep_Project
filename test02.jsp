<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.*, org.w3c.dom.*, javax.xml.xpath.*, org.xml.sax.InputSource" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container{
		background-color: #fff;
		margin :200px auto;
		padding : 20px;
	}
</style>
</head>

<body>

	<div id="map" style="width:500px;height:400px;margin:200px;background-color:#fff;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b6d82765fcafd32b7989cbb031604fd"></script>
	
	
	<script>
		var container=document.getElementById('map');
		var options={
				center:new kakao.maps.LatLng(33.450701, 126.570667),
				level: 5
				
		};
		var lon=126.570667;
		var map=new kakao.maps.Map(container, options);
		
		var markerPosition  = new kakao.maps.LatLng(33.450701, lon); 
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		marker.setMap(map);
	</script>
</body>
</html>