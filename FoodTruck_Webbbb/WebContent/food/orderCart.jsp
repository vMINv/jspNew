<%  
//최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
//최초작성일 : 2023/2/16

//버전 기록 : 0.1(시작 23/02/16)
//			0.1(수정 23/02/21)
//			0.1(종료 23/02/21)
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
	int cntTotal = 0;
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
		cntTotal += cnts2;
	}
	if(cntTotal==0){
	response.sendRedirect("/food/order.jsp?fno="+fno+"&rs="+1);
	} else {
	//json to string
	String jsonString = json.toString();
	orderDAO.order(fno, id, jsonString, total);
	response.sendRedirect("/common/myOrderList.jsp");
	}
	//string to json
	//JSONParser parser = new JSONParser(); 
	//Object obj = parser.parse( jsonString ); 
	//JSONObject jsonObj = (JSONObject) obj; 
%>