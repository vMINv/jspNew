<%@page import="jdbc.feedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");

	String no = request.getParameter("no");
	
	out.print(feedDAO.delete(no));  


%>
