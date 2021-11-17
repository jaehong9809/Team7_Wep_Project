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
		<form method="post">
		<p> 주소(시도)  :<input type="text" name="addr1">
		<p> 주소(시군구) :<input type="text" name="addr2">
		<p> <input type="submit" value="찾기"> 
	</form>

	<%
		request.setCharacterEncoding("utf-8");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		if(addr1!=null&&addr2!=null)
		{
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire"); /*URL*/
		    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=em%2F6HSJvjrO6USO6D2UZOGAwohly1xbEeY%2BCMXD1T7Nwuj1RMb8Xq85qVEia0NWd9LwhDEYQgEg9vjoO%2FgT8Kg%3D%3D"); /*Service Key*/
		    urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(addr1, "UTF-8")); /*주소(시도)*/
	 	   	urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(addr2, "UTF-8")); /*주소(시군구)*/
	 	   	urlBuilder.append("&" + URLEncoder.encode("QT","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*월~일요일, 공휴일: 1~8*/
	 	   	urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*기관명*/
	  	  	urlBuilder.append("&" + URLEncoder.encode("ORD","UTF-8") + "=" + URLEncoder.encode("NAME", "UTF-8")); /*순서*/
	 	   	urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	 	   	urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("30", "UTF-8")); /*목록 건수*/

	    	DocumentBuilderFactory dbFactory=DocumentBuilderFactory.newInstance();
	    	DocumentBuilder dBuilder=dbFactory.newDocumentBuilder();
	    	Document doc=dBuilder.parse(urlBuilder.toString());
	    	doc.getDocumentElement().normalize();	
	    	
	    	NodeList Lat=doc.getElementsByTagName("wgs84Lat");
	    	NodeList Lon=doc.getElementsByTagName("wgs84Lon");
	    	out.print("<div id='map' style='width:1000px;height:800px;'></div>");
			out.print("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=3b6d82765fcafd32b7989cbb031604fd\"></script>");
			out.print("<script>");
			out.print("var container=document.getElementById('map');");
			out.print("var options={");
			out.print("center:new kakao.maps.LatLng("+Double.valueOf(Lat.item(0).getFirstChild().getTextContent())+","+Double.valueOf(Lon.item(0).getFirstChild().getTextContent())+ "),");
			out.print("level: 5");
			out.print("};");
			out.print("var map=new kakao.maps.Map(container, options);");
			
			for(int i=0;i<Lat.getLength(); i++)
			{
				out.print("var markerPosition  = new kakao.maps.LatLng("+Double.valueOf(Lat.item(i).getFirstChild().getTextContent())+","+Double.valueOf(Lon.item(i).getFirstChild().getTextContent())+"); ");
				out.print("var marker = new kakao.maps.Marker({");
				out.print("	map:map,");
				out.print("  position: markerPosition");
				out.print("});");
			}
			out.print("marker.setMap(map)");
			out.print("</script>");	    
		}
	%>
</body>
</html>