<%--
    최초작성자 : 강세빈 (qz6789.sk@gmail.com)
    최초작성일 : 2023/02/17

    버전  기록 : 0.1(시작 23/02/17)
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.questionDAO" %>
<%
    String sid = (String) session.getAttribute("id");
    int pg = Integer.parseInt(request.getParameter("page"));

    out.print(questionDAO.getMyQuestList(sid, pg));
%>