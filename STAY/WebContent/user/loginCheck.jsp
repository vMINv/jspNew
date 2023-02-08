<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link href="/etc/sign-in.css" rel="stylesheet">
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//디비에 넣기
	int result = UserDAO.login(id, password);
	
	if(result==1){//아이디 불일치%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인 실패</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       아이디가 존재하지 않습니다. 다시 시도해주세요.
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='/nonuser/login.jsp'" class="btn btn-primary">로그인</button>
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal1").modal("show");
			});
		</script>
<%	} else if (result==2){//비밀번호 불일치%>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인 실패</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	       비밀번호가 일치하지 않습니다. 다시 시도해주세요.
	      </div>
	      <div class="modal-footer">
	        <button onclick="location.href='login.jsp'" class="btn btn-primary">로그인</button>
	      </div>
	    </div>
	  </div>
	</div>

	<script>
		$(function() {
			$("#exampleModal2").modal("show");
		});
	</script>
<%	} else {//로그인 성공
	session.setAttribute("id", id); %>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인 성공</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	       환영합니다. 메인페이지로 이동합니다.
	      </div>
	      <div class="modal-footer">
	        <button onclick="location.href='main.jsp'" class="btn btn-primary">메인페이지</button>
	      </div>
	    </div>
	  </div>
	</div>

	<script>
		$(function() {
			$("#exampleModal3").modal("show");
		});
	</script>
<%	}
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>