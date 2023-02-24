<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인 체크</title>
</head>
<body>
성공 !!
<%
	String name = request.getParameter("name");
	String mail = request.getParameter("mail");
	
	
	session.setAttribute("sid", mail);
	
	String sid = (String)session.getAttribute("sid");
	
%>

	[ <%= sid%> ] 님 로그인 성공하였습니다.


</body>
</html>