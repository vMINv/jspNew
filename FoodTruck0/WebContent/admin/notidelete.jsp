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
	String nno = request.getParameter("nno");

	if (notiDAO.delete(nno) == 1) {
%>
<script>
	alert("공지 삭제를 성공하였습니다.");
	location.href = "/common/notice.jsp?page=1";
</script>
<%
}else {
%>

<script>
	alert("공지 삭제를 실패하였습니다.");
	location.href = "/common/notice.jsp?page=1";
</script>
<%
	}

%>