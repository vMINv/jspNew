<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>    
<%request.setCharacterEncoding("utf-8"); %>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String password = request.getParameter("password");
String mail = request.getParameter("mail");



if (userDAO.edit(id, password, name, mail) == 1) {
	%>

	<script>
	  alert("회원 정보 수정이 성공하였습니다.\n내 프로필로 이동합니다.");
	  window.location.href = "myInfo.jsp";
	</script>
	<%
}else {
	%>
	<script>
	  alert("회원 정보 수정이 실패하였습니다.");
	  window.location.href = "myInfo.jsp";
	</script>
	<%
}

%>