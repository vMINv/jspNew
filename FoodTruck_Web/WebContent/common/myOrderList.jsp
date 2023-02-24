<!--  
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/2/16

버전 기록 : 0.1(시작 23/02/16) -데이터만 가져옴 디자인은 이후에 해야함.
		0.5(기초 디자인 작업 23/02/20)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.orderDAO" %>    
<!DOCTYPE html>
<html>
<head>

<%@ include file="/header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<%request.setCharacterEncoding("utf-8"); %>
<% orderDAO oDAO = new orderDAO(); %>
<!-- 함수 -->
<script>

	function listFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'myOrderAll.jsp',
 			success:function(data){
 				var orders = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < orders.length; i++){
 					 
 					str += "<tr><td><img src='../img/bookmark-heart-fill.svg' style='width:70px; height:40px; float:right;' class='rounded'>";
 					str += "<strong>"+orders[i].fname+"</strong>";
 					str += "<br><div class='mb-1 text-muted'>주문확인: " + (orders[i].opro == 0 ? "주문 중" : "주문 완료");

 					str += "<br>주문한 메뉴:" +orders[i].fmenu+ "222222222222" ; 
 					str += "<br>합계:" +orders[i].fprice+"";
 					str += (orders[i].opro == 0 ? "<button style='float:right' class='badge text-bg-danger' onclick='delOrder("+orders[i].ono+")'>주문 취소</button></span>" : " ");
 				    str += "</div><td></tr>";
 				} $("#ajaxTable").html(str);
 			},
 			 error : function(request, status, error) { // 결과 에러 콜백함수
 		        console.log(error)
 		    }
 		});
 	}
	
	window.onload = function() {
		listFunction();
 	}
	
	
	function delOrder(ono) {
		if (confirm("정말 주문을 취소하시겠습니까?")) {
		    location.href = "deleteMyOrder.jsp?ono=" + ono;
		  }
	}
	

	
	
</script>

<title>내 주문 목록</title>
</head>
<body>


<!-- 주문 목록 -->
<div class="container">
<table class="table table-hover">
    
	<tbody id="ajaxTable" >
	
	
    </tbody>
</table>
</div>


</body>
</html>