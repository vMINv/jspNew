<!--  
최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
최초작성일 : 2023/2/17

버전 기록 : 0.1(시작 23/02/17)
		  0.1(수정 23/02/21)
		  0.1(종료 23/02/21)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게 상세보기</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<% 
	String fno = request.getParameter("fno");
	//String fno = "1";//임시 
	//sid = (String) session.getAttribute("id");
	sid = "min";//임시
%>
<!-- 정보 -->
<div class="container">
	<table class="table table-hover">
	    <thead>
	      <tr>
	        <th scope="row">가게명</th>
	        <th scope="row">위치</th>
	        <th scope="row">영업시간</th>
	      </tr>
	    </thead>
		<tbody id="ajaxTable1">
	    </tbody>
	</table>
	<br>
	<table class="table table-hover">
	    <thead>
	      <tr>
	        <th scope="row">메뉴</th>
	        <th scope="row">가격</th>
	      </tr>
	    </thead>
		<tbody id="ajaxTable2">
	    </tbody>
	</table>
</div>

<input id="fno" type="hidden" value="<%=fno %>">
<div class="container">
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="form-control btn btn-outline-secondary" onclick="location.href='order.jsp?fno='+<%=fno %>">포장하기</button>
			</div>
			<div class="col">
				<button type="submit" class="form-control btn btn-outline-secondary" onclick="location.href='review.jsp?fno='+<%=fno %>">리뷰쓰기</button>
			</div>
		</div>
	</div>
</div>

<!-- 함수 -->
<script>
	function storeInfoListFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'oneStoreInfoAll.jsp?fno='+document.getElementById('fno').value,
 			success:function(data){
 				var infos = JSON.parse(data.trim());
 				var str = "";
 				
 				for(var i = 0; i < infos.length; i++){
 					
 					str += "<tr><td>" + infos[i].fname + "</td>";
 					str += "<td>" + infos[i].flocation + "</td>";
 					str += "<td>" + infos[i].ftime + "</td></tr>";
 					
 				} 
 				$("#ajaxTable1").html(str);
 				
 				var infos = JSON.parse(data.trim());
 				var str = "";
 				
 				for(var i = 0; i < infos.length; i++){
 					var fmenu = infos[i].fmenu.replace("[","").replace("]","");
 					var fprice = infos[i].fprice.replace("[","").replace("]","");
 					var menu = fmenu.split(",");
 					var price = fprice.split(",");
 					var keys1 = Object.keys(menu);
 					for (var i=0; i<keys1.length; i++) {
 				    	var key = keys1[i];
 						str += "<tr><td>" + menu[key] + "</td>";
 						str += "<td>" + price[key] + "</td></tr>";
 				    }
 				}
 				$("#ajaxTable2").html(str);
 			}
 		});
 	}
	
	window.onload = function() {
		storeInfoListFunction();
 	}
	
</script>
</body>
</html>