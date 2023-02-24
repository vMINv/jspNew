<%--
최초작성자 : 강세빈 (qz6789.sk@gmail.com)
최초작성일 : 2023/02/16

버전  기록 : 0.1(시작 23/02/16)
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jdbc.reviewDAO" %>
<%
  int fno = Integer.parseInt(request.getParameter("fno"));
  int pg = Integer.parseInt(request.getParameter("page"));

  out.print(reviewDAO.getCeoReviewList(fno, pg));
%>
