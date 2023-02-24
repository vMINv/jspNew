<!--  
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/2/20

버전 기록 : 0.1(시작 23/02/21) -데이터만 가져옴 디자인은 이후에 해야함.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<%


out.print(reviewDAO.getMyReviewList("t2") );
%>
