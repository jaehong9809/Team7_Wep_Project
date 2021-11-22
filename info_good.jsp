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
		request.setCharacterEncoding("utf-8");
		String addr=request.getParameter("addr");
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		String mon=request.getParameter("mon");
		String tue=request.getParameter("tue");
		String wed=request.getParameter("wed");
		String thu=request.getParameter("thu");
		String fri=request.getParameter("fri");
		String sat=request.getParameter("sat");
		String sun=request.getParameter("sun");
		String lat=request.getParameter("lat");
		String lon=request.getParameter("lon");
		Double la=Double.parseDouble(lat);
		
		Double lo=Double.parseDouble(lon);
		out.print(la+"<br>"+lo);
	%>
	<table border="2" >
	<tr align="center">
		<p><td colspan="2"><%=name %></td></p>
	</tr>
	<tr align="center">
		<th>제목</th>
		<th>내용</th>
	</tr>
	<tr align="center" >
		<td>전화번호</td>
		<td><%=tel %></td>
	</tr>
	<tr align="center" >
		<td>주소</td>
		<td><%=addr %></td>
	</tr>
	<tr align="center" >
		<td>영업시간</td>
		<td><%
		out.print("월 : "+mon+"<br>");
		out.print("화 : "+tue+"<br>");
		out.print("수 : "+wed+"<br>");
		out.print("목 : "+thu+"<br>");
		out.print("금 : "+fri+"<br>");
		if(sat.equals(""))
    	{
    		if(sun.equals("")){
    		}
    		else{
    			out.print("일 : "+sun+"<br>");
    		}
    	}
    	else{
    		if(sun.equals(""))
    		{
    			out.print("토 : "+sat+"<br>");
    		}
    		else{
    			out.print("토 : "+sat+"<br>");		
    			out.print("일 : "+sun+"<br>");
    		}
    	}
		%></td>
	</tr>
	</table>
	<div id="map" style="width:500px;height:400px;margin:200px;background-color:#fff;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b6d82765fcafd32b7989cbb031604fd"></script>
	
	
	<script>
		var container=document.getElementById('map');
		var options={
				center:new kakao.maps.LatLng(<%=la%>, <%=lo%>),
				level: 5
				
		};
		var lon=126.570667;
		var map=new kakao.maps.Map(container, options);
		
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = 'hi',
		    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
	</script>
	
</body>
</html>