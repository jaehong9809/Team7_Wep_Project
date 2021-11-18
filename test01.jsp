<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.MalformedURLException" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.parsers.ParserConfigurationException" %>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="org.w3c.dom.Document"%>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="org.xml.sax.SAXException" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire"); /*URL*/
    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=em%2F6HSJvjrO6USO6D2UZOGAwohly1xbEeY%2BCMXD1T7Nwuj1RMb8Xq85qVEia0NWd9LwhDEYQgEg9vjoO%2FgT8Kg%3D%3D"); /*Service Key*/
    urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode("서울특별시", "UTF-8")); /*주소(시도)*/
    urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode("강남구", "UTF-8")); /*주소(시군구)*/
    urlBuilder.append("&" + URLEncoder.encode("QT","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*월~일요일, 공휴일: 1~8*/
    urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*기관명*/
    urlBuilder.append("&" + URLEncoder.encode("ORD","UTF-8") + "=" + URLEncoder.encode("NAME", "UTF-8")); /*순서*/
    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*목록 건수*/
    URL url = new URL(urlBuilder.toString());
    
    
    DocumentBuilderFactory dbFactory=DocumentBuilderFactory.newInstance();
    DocumentBuilder dBuilder=dbFactory.newDocumentBuilder();
    Document doc=dBuilder.parse(url.toString());
    doc.getDocumentElement().normalize();
    
    NodeList nlist=doc.getElementsByTagName("dutyName");
    NodeList addr=doc.getElementsByTagName("dutyAddr");
    out.print("파싱할 리스트 후 : "+nlist.getLength()+"<br>");
    
    for(int temp=0; temp<nlist.getLength(); temp++)
    {
    	out.println("주소 : " +addr.item(temp).getFirstChild().getTextContent()+"<br>");
    	out.print("이름 : "+nlist.item(temp).getFirstChild().getTextContent()+"<br>");
    }
    
 
	%>
</body>
</html>