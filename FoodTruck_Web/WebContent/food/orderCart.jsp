<% 
/* 최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
최초작성일 : 2023/2/20

버전 기록 : 0.1(시작 23/02/20) */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%
	
	request.setCharacterEncoding("utf-8");

	String fno = request.getParameter("fno");
	String id = request.getParameter("id");
	int totalMenuCnt = Integer.parseInt(request.getParameter("totalMenuCnt"));
	
	JSONArray json = new JSONArray();
	int squ = 0;
	int total = 0;
	for (int i=0; i<totalMenuCnt ; i++){
	
		String menus = request.getParameter("menu"+i+"");
		String prices = request.getParameter("price"+i+"");
		String cnts = request.getParameter("cnt"+i+"");
		int prices2 = Integer.parseInt(prices);
		int cnts2 = Integer.parseInt(cnts);
		squ = prices2*cnts2;
		total += squ;
		
		JSONObject obj = new JSONObject();
		obj.put("menu", menus);
		obj.put("price", prices);
		obj.put("cnt", cnts);
		
		json.add(obj);
		
	}
	
	//json to string
	String jsonString = json.toString();
	System.out.print(total);
	orderDAO.order(fno, id, jsonString, total);
	response.sendRedirect("oneStoreInfo.jsp");

	//string to json
	//JSONParser parser = new JSONParser(); 
	//Object obj = parser.parse( jsonString ); 
	//JSONObject jsonObj = (JSONObject) obj; 
	

%>