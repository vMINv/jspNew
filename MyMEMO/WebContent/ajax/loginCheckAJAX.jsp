<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//디비에 넣기
	int result = UserDAO.login(id, password);
	
	if(result== 1);//디비에 회원 정보가 전혀 없는 경우 
	if(result== 2);//아이디 일치, 비밀번호 불일치  
	if(result== 0);//로그인 성공
%>
