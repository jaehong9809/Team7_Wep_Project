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
	    
	    NodeList item=doc.getElementsByTagName("item");
	    %>
	 <div style="width:70%;margin-left:15%;margin-top:10px;border-radius: 0.5em;">
	 <table border="1" style="width:100%; border:3px solid #04B4AE;border-radius: 0.5em;">
	    <% 
	    
	    out.print("<tr>");
	    out.print("<th> 번 호 </th>");
	    out.print("<th> 약 국 </th>");
	    
	    
	    out.print("</tr>");
	    
	    for(int temp=0; temp<item.getLength(); temp++)
	    {
	    	Node node=item.item(temp);
	    		
	    	Element ele=(Element)node;
	    	int num=temp+1;
	    	out.print("<tr><td align=\"center\">"+num+"</td>\n");
	    	
	    	
	    	
	    	String ygaddr=ele.getElementsByTagName("dutyAddr").item(0).getTextContent();
	    	
	    	
	    	String ygname=ele.getElementsByTagName("dutyName").item(0).getTextContent();
	    	
	    	
	    	String ygtel=ele.getElementsByTagName("dutyTel1").item(0).getTextContent();
	    	String ygmon=ele.getElementsByTagName("dutyTime1s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime1c").item(0).getTextContent();
	    	String ygtue=ele.getElementsByTagName("dutyTime2s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime2c").item(0).getTextContent();
	    	String ygwed=ele.getElementsByTagName("dutyTime3s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime3c").item(0).getTextContent();
	    	String ygthu=ele.getElementsByTagName("dutyTime4s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime4c").item(0).getTextContent();
	    	String ygfri=ele.getElementsByTagName("dutyTime5s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime5c").item(0).getTextContent();
	    	String ygsat="";
	    	String ygsun="";
	    	String yglat=ele.getElementsByTagName("wgs84Lat").item(0).getTextContent();
	    	String yglon=ele.getElementsByTagName("wgs84Lon").item(0).getTextContent();
	    	if(ele.getElementsByTagName("dutyTime6s").item(0)!=null)
	    	{
	    		if(ele.getElementsByTagName("dutyTime7s").item(0)!=null){
	    			ygsat=ele.getElementsByTagName("dutyTime6s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime6c").item(0).getTextContent();
	    			ygsun=ele.getElementsByTagName("dutyTime7s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime7c").item(0).getTextContent();
	    		}
	    		else{
	    			ygsat=ele.getElementsByTagName("dutyTime6s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime6c").item(0).getTextContent();
	    		}
	    	}
	    	else{
	    		if(ele.getElementsByTagName("dutyTime7s").item(0)!=null)
	    		{
	    			ygsun=ele.getElementsByTagName("dutyTime7s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime7c").item(0).getTextContent();
	    		}
	    	}
	    	out.print("<td>");
	    %>
	    <a href="info_good.jsp?addr=<%=ygaddr%>&name=<%=ygname%>&tel=<%=ygtel%>&mon=<%=ygmon%>&tue=<%=ygtue%>&wed=<%=ygwed%>&thu=<%=ygthu%>&fri=<%=ygfri%>&sat=<%=ygsat%>&sun=<%=ygsun%>&lat=<%=yglat%>&lon=<%=yglon%>" style="font-size:1.5em;color:red;"><%=ygname+"<br>"%></a>
	    <% 
	    	out.print(ele.getElementsByTagName("dutyAddr").item(0).getTextContent()+"<br>");
	    	out.print(ele.getElementsByTagName("dutyTel1").item(0).getTextContent()+"<br>");
	    	out.print("월 : "+ele.getElementsByTagName("dutyTime1s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime1c").item(0).getTextContent()+"<br>");
	    	out.print("화 : "+ele.getElementsByTagName("dutyTime2s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime2c").item(0).getTextContent()+"<br>");
	    	out.print("수 : "+ele.getElementsByTagName("dutyTime3s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime3c").item(0).getTextContent()+"<br>");
	    	out.print("목 : "+ele.getElementsByTagName("dutyTime4s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime4c").item(0).getTextContent()+"<br>");
	    	out.print("금 : "+ele.getElementsByTagName("dutyTime5s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime5c").item(0).getTextContent()+"<br>");
	    	if(ele.getElementsByTagName("dutyTime6s").item(0)!=null)
	    	{
	    		if(ele.getElementsByTagName("dutyTime7s").item(0)!=null){
	    			out.print("토 : "+ele.getElementsByTagName("dutyTime6s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime6c").item(0).getTextContent()+"<br>");
	    			out.print("일 : "+ele.getElementsByTagName("dutyTime7s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime7c").item(0).getTextContent()+"</td></tr>\n");
	    		}
	    		else{
	    			out.print("토 : "+ele.getElementsByTagName("dutyTime6s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime6c").item(0).getTextContent()+"</td></tr>\n");	
	    		}
	    		
	    		
	    	}
	    	else{
	    		if(ele.getElementsByTagName("dutyTime7s").item(0)!=null)
	    		{
	    			out.print("일 : "+ele.getElementsByTagName("dutyTime7s").item(0).getTextContent()+"~"+ele.getElementsByTagName("dutyTime7c").item(0).getTextContent()+"</td></tr>\n");
	    		}
	    		else out.print("</td></tr>\n");
	    	}
	    	
	    }
	}
	
	%>
	</div>
</body>
</html>