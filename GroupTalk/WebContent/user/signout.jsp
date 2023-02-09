<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>



    

    <!-- Custom styles for this template -->
    <link href="/css/sign-in.css" rel="stylesheet">
    

</head>
<body class="text-center">


<%@ include file="/header.jsp" %>

<% 
	sid = (String) session.getAttribute("id");
	if (sid == null){
%>		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 전용 메뉴</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        로그인을 한 회원만 사용 가능한 메뉴입니다.<br>
		        로그인 화면으로 이동합니다. 
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
		
<%} else {
	session.setAttribute("id", sid);
}
%>		

<br>

<main class="form-signin w-100 m-auto">

<form action="signoutCheck.jsp">
    <img class="mb-4" src="http://austiny.snu.ac.kr/image/mine.jpg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">회원 탈퇴</h1>

    <div class="form-floating">
      <input type="text" name="id" class="form-control" id="floatingInput" placeholder="아이디를 입력하세요">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="암호를 입력하세요">
      <label for="floatingPassword">암호</label>
    </div>

   
<input type="submit" value="탈퇴">
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
  </form>

</main>


<%@ include file="/footer.jsp" %>
</form>
</body>
</html>