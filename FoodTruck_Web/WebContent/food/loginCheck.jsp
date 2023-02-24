<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>
<%

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	int result = userDAO.login(id,password);
	
	if(result == 1) {
		%>	
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인 실패</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		  아이디가 존재하지않습니다. 회원가입페이지로 이동합니다.
		      </div>
		      <div class="modal-footer">
		      <button onclick="location.href='signup.jsp'" class="btn btn-secondary" data-bs-dismiss="modal">회원가입</button>
		      
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal").modal("show");
			});
		</script>
<% 
	
	}else if (result == 2){
		%>
				<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인 실패</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		 비밀번호가 틀렸습니다. 로그인페이지로 이동합니다.
		      </div>
		      <div class="modal-footer">
		      <button onclick="location.href='login.jsp'" class="btn btn-secondary" data-bs-dismiss="modal">로그인페이지</button>
		      
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
	}else{
		session.setAttribute("id", id);
		%>
				<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인 성공</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		  로그인에 성공하였습니다. 메인페이지로 이동합니다.
		      </div>
		      <div class="modal-footer">
		      <button onclick="location.href='foodtruckmain.jsp'" class="btn btn-secondary" data-bs-dismiss="modal">메인페이지</button>
		      
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

<%@include file="/footer.jsp" %>