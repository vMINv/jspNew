<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/header.jsp" %>
<% 
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	int result = userDAO.login(id, password);
	
	if(result == 1) {
%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">존재하지 않는 아이디입니다.</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        다시 확인 후 로그인 해 주세요
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='signup.jsp'" class="btn btn-primary">회원 가입 이동</button>

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
		
	}else if (result == 2) {
		%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">암호가 일치하지 않습니다. </h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        암호를 다시 확인하고 로그인해 주세요
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='login.jsp'" class="btn btn-primary">로그인 이동</button>

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
		
	}else {
		session.setAttribute("id", id);
		%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인 성공</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        방문을 환영합니다.
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='/main.jsp'" class="btn btn-primary">메인 이동</button>

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
		
	}
	
	
	
	
%>

<%@ include file="/footer.jsp" %>
