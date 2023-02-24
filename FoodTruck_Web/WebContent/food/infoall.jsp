<%  
//최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
//최초작성일 : 2023/2/15

//버전 기록 : 0.1(시작 23/02/16)
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%
	out.print(infoDAO.getinfolist());
%>