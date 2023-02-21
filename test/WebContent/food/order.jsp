<!--  
최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
최초작성일 : 2023/2/15

버전 기록 : 0.1(시작 23/02/15)
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
<title>주문하기</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<% 
	String fno = request.getParameter("fno");
%>
<!-- 로그인 여부 체크 -->
<% 
if (sid == null){
%>		
<!-- Modal -->
<div class="modal fade" id="loginCheck" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5">회원 전용 메뉴</h1>
				<!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='/user/login.jsp'"></button> -->
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='searchFoodtruck.jsp'"></button>
			</div>
			<div class="modal-body">
				로그인을 한 회원만 사용 가능한 메뉴입니다.
			</div>
			<div class="modal-footer">
				<button onclick="location.href='searchFoodtruck.jsp'" class="btn btn-outline-secondary">로그인 이동</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$("#loginCheck").modal("show");
	});
</script>

<%} else {
	session.setAttribute("id", sid);
}%>

<!-- 메뉴, 담기 -->
<div class="container">
<form action='orderCart.jsp'>
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="row">메뉴</th>
        <th scope="row">가격</th>
        <th scope="row">수량(최대10개)</th>
      </tr>
    </thead>
	<tbody id="ajaxTable">
    </tbody>
</table>
<input id="fno" name="fno" type="hidden" value="<%=fno %>">
<input id="id" name="id" type="hidden" value="<%=sid %>">
<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="submit" class="form-control btn btn-outline-secondary">포장하기</button>
			</div>
			<div class="col">
				<button type="button" class="form-control btn btn-outline-secondary" onclick="location.href='searchFoodtruck.jsp'">취소하기</button>
			</div>
		</div>
	</div>
</form>
</div>

<!-- 함수 -->
<script>
	function menuListFunction() {
			
		$.ajax({
 			type:'post',
 			url:'oneStoreInfoAll.jsp?fno='+document.getElementById('fno').value,
 			success:function(data){
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
 						str += "<tr><td>" + menu[key] + "<input type='hidden' name='menu"+i+"' value='"+ menu[key] +"'></td>";
 						str += "<td>" + price[key] + "<input type='hidden' name='price"+i+"' value='"+ price[key] +"'></td>";
 						str += "<td><input type='number' name='cnt"+i+"' min='0' max='10' value='0'></td></tr>";
 				    }
 					str += "<input type='hidden' name='totalMenuCnt' value='"+keys1.length+"'>";
 				}
 				$("#ajaxTable").html(str);
 			}
 		});
	}
	
	window.onload = function() {
		menuListFunction();
		}

</script>
</body>
</html>