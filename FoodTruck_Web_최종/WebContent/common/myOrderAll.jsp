<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.orderDAO" %>
<%request.setCharacterEncoding("utf-8"); %>

<%
String id = (String)request.getParameter("id");

out.print(orderDAO.getmylist(id));
%>
