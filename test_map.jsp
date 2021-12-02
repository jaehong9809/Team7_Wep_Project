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
<script type="text/javascript">
	function checkForm(){
		var str=document.ad.addr2.value;
		for(var i=0; i<str.length; i++){
			var ch=str.charAt(i);
			if(ch==' '){
				alert("띄어쓰기를 쓰지마시오\n예)\n 안양시 동안구 (X)\n 안양시동안구(O)");
				return;
			}
		}
		
		
	}
</script>
<body >
	<jsp:include page="header.jsp"></jsp:include>
	<div style="height:40%; width:100%; marin:0 auto">
	
	<div style="height:140px;width:70%;border:3px solid #04B4AE;margin:0 auto;margin-top:15px;">
	<form name="ad" method="post" style="height:100%;" >
	
		<div style="height:100%; width:350px;float:left;margin-left:20px;margin-top:15px;">
			<input type="text" style="width:300px;height:40px;margin-bottom:10px;border-radius: 0.5em;" placeholder="주소(시도)" name="addr1">
			<input type="text" style="width:300px;height:40px;border-radius: 0.5em;" placeholder="주소(시군구)" name="addr2">
		</div>
		
	
		<input style="height:100px;width:100px;margin-top:15px;background-color:#04B4AE;border-radius: 0.5em;" type="submit" value="찾기" onclick="checkForm()">
		
	</form>
	</div>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		int isok=1;
		if(addr1!=null&&addr2!=null){
			if(addr2.indexOf(" ")!=-1){
				isok=0;	
			}	
		}
		if(addr1!=null&&addr2!=null&&isok==1)
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
	    	NodeList name=doc.getElementsByTagName("dutyName");
	    %>
	    <div id='map' style='width:70%;height:800px;margin-left:15%;margin-top:10px;border: 3px solid #04B4AE;'></div>
	    <%
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
				out.print("  position: markerPosition ,");
				out.print(" title : '"+name.item(i).getFirstChild().getTextContent()+"'");
				out.print("});");
			}
			out.print("marker.setMap(map)");
			out.print("</script>");	    
		}
	%>
</body>
</html>