<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jdbc.*"%>
<%

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");

	out.print(userDAO.insertadmin(id));
%>