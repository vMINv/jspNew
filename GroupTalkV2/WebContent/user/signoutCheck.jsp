<%@page import="jdbc.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file="/header.jsp" %>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	int result = userDAO.login(id, password);

	if(result == 0) {
		userDAO.delete(id);
		session.invalidate();
		%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 탈퇴 성공</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        회원 탈퇴 되었습니다. 회원 가입 페이지로 이동합니다. 
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='signup.jsp'" class="btn btn-primary">회원 가입</button>

		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal1").modal("show");
			});
		</script>
		
		
		
<% 	
	} else {


		%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">아이디 암호 불일치 </h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        아이디와 암호를 다시 확인하고 입력하시기 바랍니다. 
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='signout.jsp'" class="btn btn-primary">다시 입력</button>

		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal2").modal("show");
			});
		</script>
		
		
		
<% 		
		
		
		
		
		
		
		
		
		
	}

%>

<%@ include file="/footer.jsp" %>


</body>
</html>