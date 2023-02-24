<%--
    최초작성자 : 강세빈 (qz6789.sk@gmail.com)
    최초작성일 : 2023/02/20

    버전  기록 : 0.1(시작 23/02/20)
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.orderDAO" %>
<%
    int ono = Integer.parseInt(request.getParameter("ono"));

    out.print(orderDAO.successCeoOrder(ono));
%>