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
<title>리뷰 목록과 리뷰 등록</title>
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

<!-- 리뷰목록 -->
<div class="container">
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">아이디</th>
        <th scope="col">내용</th>
        <th scope="col">별점</th>
        <th scope="col">작성일</th>
      </tr>
    </thead>
	<tbody id="ajaxTable">
    </tbody>
</table>
</div>

<!-- 리뷰등록 -->
<div class="container">
	<input id="id" type="hidden" value="<%=sid %>">
	<input id="fno" type="hidden" value="<%=fno %>">
	<div class="mb-3">
		<label class="form-check-label">[별점]</label>
		<div></div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="1">
		  <label>1</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="2">
		  <label>2</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="3">
		  <label>3</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="4">
		  <label>4</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="5">
		  <label>5</label>
		</div>
	</div>
	<div class="mb-3">
	<label class="form-label">[내용]</label>
	<input type="text" class="form-control" name="rcontent" id="rcontent" required> 
	</div>
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="form-control btn btn-outline-secondary" onclick="addReview()">등록하기</button>
			</div>
			<div class="col">
				<button type="submit" class="form-control btn btn-outline-secondary" onclick="location.href='searchFoodtruck.jsp'">취소하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 함수 -->
<script>
	function addReview() {
		var rates = document.getElementsByName('point');
		var rate_value;
		for(var i = 0; i < rates.length; i++){
		    if(rates[i].checked){
		        rate_value = rates[i].value;
		    }
		}
		$.ajax({
			type:"post",
			url: "reviewAdd.jsp",
			data : {fno:document.getElementById('fno').value,
					id:document.getElementById('id').value,
				    point:rate_value,
				    rcontent:document.getElementById('rcontent').value
				},
      
			dataType:"text",
			
			success:function(data) {
				var rcontent = document.getElementById('rcontent');
				rcontent.value = "";
				reviewListFunction();
			}
		});
	}

	function reviewListFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'reviewAll.jsp?fno='+document.getElementById('fno').value,
 			success:function(data){
 				var reviews = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < reviews.length; i++){
 					
 					str += "<tr><td>" + reviews[i].id + "</td>";
 					str += "<td>" + reviews[i].rcontent + "</td>";
 					str += "<td>" + reviews[i].point + "점</td>";
 					str += "<td>" + reviews[i].rregtime + "</td></tr>";
 				    
 				    
 				} $("#ajaxTable").html(str);
 			}
 		});
 	}
	
	window.onload = function() {
		reviewListFunction();
 	}
	
</script>
</body>
</html>