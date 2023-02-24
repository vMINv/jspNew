<!--  
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/2/16

버전 기록 : 0.1(시작 23/02/20) -데이터만 가져옴 디자인은 이후에 해야함.
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.orderDAO" %>
<%
orderDAO oDAO = new orderDAO();

int ono = Integer.parseInt(request.getParameter("ono"));
int result = oDAO.deleteMyOrder(ono);
if (result > 0) {
  %>
  <script>
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

