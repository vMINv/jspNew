<!--  
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/2/20

버전 기록 : 0.1(시작 23/02/21) -데이터만 가져옴 디자인은 이후에 해야함.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>    
<%request.setCharacterEncoding("utf-8"); %>
<%

String point = request.getParameter("point");
String rcontent = request.getParameter("rcontent");
String rno = request.getParameter("rno");


if (reviewDAO.editMyReview(point, rcontent, rno) == 1) {
	%>

	<script>
	  alert("리뷰 수정이 성공하였습니다.");
	  window.location.href = "myReviewList.jsp";
	</script>
	<%
}else {
	%>
	<script>
	  alert("리뷰 수정이 실패하였습니다.\n이전 화면으로 이동합니다.");
	  history.back();
	</script>
	<%
}

%>