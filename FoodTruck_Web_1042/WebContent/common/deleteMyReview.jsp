<!--  
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/2/20

버전 기록 : 0.1(시작 23/02/21) -데이터만 가져옴 디자인은 이후에 해야함.
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<%
reviewDAO rDAO = new reviewDAO();

int rno = Integer.parseInt(request.getParameter("rno"));
out.print(rno);
int result = rDAO.deleteMyReview(rno);
if(result > 0) {

%>

<script>

alert("주문이 삭제되었습니다.");

location.href = "myOrderList.jsp";

</script>

<%

} else {

%>

<script>

alert("주문 삭제에 실패했습니다.");

history.back();

</script>

<%

}

%>
