<%--
최초작성자 : 강세빈 (qz6789.sk@gmail.com)
최초작성일 : 2023/02/22

버전  기록 : 0.1(시작 23/02/22)
--%>
<%@ page import="jdbc.foodDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String sid = (String) session.getAttribute("id");

  out.print(foodDAO.getCeoList(sid));
%>
