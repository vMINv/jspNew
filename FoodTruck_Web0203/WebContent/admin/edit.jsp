
<!-- 
	최초작성자 : 김형준(bright32123@gmail.com)
	최초작성일 : 2023/02/20
	버전 기록   : 0.1(시작 23/02/20) 
	
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>    
<%request.setCharacterEncoding("utf-8"); %>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String mail = request.getParameter("mail");
String password = request.getParameter("password");



if (userDAO.edit( id, name, mail,password) == 1) {
	%>

	<script>
	  alert("회원 정보 수정이 성공하였습니다.");
	  window.location.href = "";
	</script>
	<%
}else {
	%>
	<script>
	  alert("회원 정보 수정이 성공하였습니다.");
	  //window.location.href = "리다이렉트할 페이지 URL";
	</script>
	<%
}

%>