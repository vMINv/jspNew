<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.orderDAO" %>

<%
out.print(orderDAO.getmylist("t2"));
%>
