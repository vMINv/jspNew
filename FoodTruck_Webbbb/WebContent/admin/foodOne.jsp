<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	String fno = request.getParameter("fno");
	
	out.print(foodDAO.getMyList(fno));
%>