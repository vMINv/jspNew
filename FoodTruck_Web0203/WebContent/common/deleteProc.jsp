<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>    
<%request.setCharacterEncoding("utf-8"); %>
<%
String id = request.getParameter("id");

if (userDAO.delete(id) == 1) {
	%>
	<script>
	  alert("회원 탈퇴를 성공하였습니다.");
	  window.location.href = "/main.jsp";
	</script>
	<%
	session.invalidate();
}else {
	%>
	
	<script>
	  alert("회원 탈퇴를 실패하였습니다.");
	  //window.location.href = "리다이렉트할 페이지 URL";
	</script>
	<%
	 response.sendRedirect("/main.jsp"); // 처리 후 보낼 장소.
	//out.print("fail");
}

%>