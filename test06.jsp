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
	    
	    NodeList item=doc.getElementsByTagName("item");
	    out.print("<table border=\"1\">");
	    out.print("<tr>");
	    out.print("<th> 번 호 </th>");
	    out.print("<th> 약 국 </th>");
	    out.print("</tr>");
	    for(int temp=0; temp<item.getLength(); temp++)
	    {
	    	Node node=item.item(temp);
	    		
	    	Element ele=(Element)node;
	    	if(ele.getElementsByTagName("dutyTime7c").item(0)!=null)
	    		out.print(ele.getElementsByTagName("dutyTime7c").item(0).getTextContent()+"<br>");
	    	
	    }
	    
	}
	
	%>
</body>
</html>