<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%@ include file ="/header.jsp" %>	



   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<%
	sid = (String) session.getAttribute("id");
	if(sid == null){
		%>
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 전용 메뉴</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		  로그인을 한 회원만 사용가능한 메뉴입니다.<br> 
		  로그인 화면으로 이동합니다.
		      </div>
		      <div class="modal-footer">
		      <button onclick="location.href='/user/login.jsp'" class="btn btn-secondary" data-bs-dismiss="modal">로그인 화면으로</button>
		      
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal").modal("show");
			});
		</script>
		
	<%	}else{
	session.setAttribute("id", sid);
	}
	%>
	
	<h3>테스트</h3>
	
	
<%@ include file ="/footer.jsp" %>		
	
</body>
</html>