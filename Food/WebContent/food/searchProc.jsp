<%  
//최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
//최초작성일 : 2023/2/20

//버전 기록 : 0.1(시작 23/02/20)
//			0.1(수정 23/02/21)
//			0.1(종료 23/02/21)
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jdbc.*"%>
<%
	String search = request.getParameter("search");

	out.print(foodDAO.search(search));
%>