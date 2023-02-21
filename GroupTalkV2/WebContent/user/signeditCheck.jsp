<%@page import="smtp.SendMail"%>
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


    <!-- Custom styles for this template -->
    <link href="gt.css" rel="stylesheet">
    
 
   
<%

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id"); // 이메일
String password = request.getParameter("password");
String name = request.getParameter("name");

	if((userDAO.edit(id, password, name) == 1) ? true : false) {
		// 윗줄에서 DB에 성공적으로 회원 등록처리를 마치고 메일을 발송하자
		
		SendMail.sending(id, name);  //가입자에게 웰컴 메일 발송
		
		%>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">정보 수정 성공</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        정보 수정 성공
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='/main.jsp'" class="btn btn-primary">메인 이동</button>

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
	} else {
%>		
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">정보 수정 실패</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        정보 수정 실패
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='/user/signedit.jsp'" class="btn btn-primary">다시 시도하세요</button>

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