<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ include file ="/header.jsp" %>	
 
  <!-- Custom styles for this template -->
    <link href="sign-in.css" rel="stylesheet">

<%
	String id = request.getParameter("id"); 
	String password = request.getParameter("password"); 
	String mail = request.getParameter("mail");
	String name = request.getParameter("name");
	

	if(userDAO.exist(id)){
		%>
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">이미 존재하는 아이디 입니다.</h1>
		      </div>
		      <div class="modal-body">
		   다른 아이디를 사용하여 가입해주세요.
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='signup.jsp'" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
		      
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
		
	
	//디비에 넣기
	
	int result = userDAO.insert(id, password, mail, name);
	
	if(result == 1){
%>	
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원가입 성공.</h1>
		           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		   회원 가입을 축하합니다. 메인페이지로 이동합니다.
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
	
	}
	
	%>
 <%@ include file ="/footer.jsp" %>	