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
<title>제보 수정하기</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	String ino = request.getParameter("ino");
	String ilocation = request.getParameter("ilocation");
	String icontent = request.getParameter("icontent");

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

<!-- 제보 수정하기 -->
<div class="container">
	<input id="ino" type="hidden" value="<%=ino%>"><!-- 로그인 연결 안되어있어서 DB에 있는 아이디 값으로 임시로 지정할것 -->
	<div class="mb-3">
		<label class="form-label">[위치]</label>
		<input type="text" class="form-control" name="ilocation" id="ilocation" required value="<%=ilocation%>"> 
	</div>
	<div class="mb-3">
		<label class="form-label">[내용]</label>
		<input type="text" class="form-control" name="icontent" id="icontent" required value="<%=icontent%>"> 
	</div>
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="form-control btn btn-outline-secondary" onclick="editInfo()">제보 수정하기</button>
			</div>
			<div class="col">
				<button type="submit" class="form-control btn btn-outline-secondary" onclick="location.href='info.jsp'">취소하기</button>
			</div>
		</div>
	</div>
</div>
<script>
	function editInfo() {
		
		$.ajax({
			type:"post",
			url: "infoEditProc.jsp",
			data : {ino:document.getElementById('ino').value,
					ilocation:document.getElementById('ilocation').value,
					icontent:document.getElementById('icontent').value
				},
	  
			dataType:"text",
			
			success:function(data) {
				window.location.href = 'info.jsp';
			}
		});
	}
</script>
</body>
</html>