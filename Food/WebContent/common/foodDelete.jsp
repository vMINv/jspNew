<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/17

버전  기록 : 0.1(시작 23/02/17) 
          0.5(기본작업 23/02/17) 
          1.0(1차 완성 23/02/20)
          2.0(2차 완성 23/02/22)
 -->

<%@page import="util.FileUtil"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드 트럭 삭제</title>
</head>
<body>
<%@ include file = "/header.jsp" %> 
<%
	request.setCharacterEncoding("UTF-8"); //한글 처리
	

	String fno = request.getParameter("fno");
		
	
 	foodDAO.deletefood(fno);


%>
<%@ include file = "/footer.jsp" %> 
</body>
</html>