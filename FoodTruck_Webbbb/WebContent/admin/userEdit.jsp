<%request.setCharacterEncoding("utf-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%
		String id = request.getParameter("id");
		userDTO user = new userDTO();
		user = userDAO.info(id);
	%>
	<div class="container-xxl py-5 bg-dark hero-header mb-5">
		<div class="container text-center my-5 pt-5 pb-4">
			<h1 class="display-3 text-white mb-3 animated slideInDown">회원 관리</h1>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb justify-content-center text-uppercase">
					<li class="breadcrumb-item"><a href="/main.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="#">Settings</a></li>
					<li class="breadcrumb-item text-white active" aria-current="page">회원 관리</li>
				</ol>
			</nav>
		</div>
	</div>
	</div>

	<div class="container-xxl py-5 px-5 wow fadeInUp" data-wow-delay="0.1s">
		<form action="edit.jsp" method="post">
		<h2> 회원 관리 </h2>

		<div class="mb-3 row">
			<div class="mb-3" style="margin-top:5%">
			  <label for="id" class="form-label">회원 아이디</label>
			  <input type="text" class="form-control" id="id" name="id" value="<%=user.getId()%>" readonly>
			</div>
			<div class="mb-3">
			  <label for="name" class="form-label">회원 이름</label>
			  <input type="text" class="form-control" id="name" name="name" value="<%=user.getName()%>" >
			</div>
			<div class="mb-3">
			  <label for="mail" class="form-label">회원 메일</label>
			  <input type="email" class="form-control" id="mail" name="mail" value="<%=user.getMail()%>" >
			</div>
			<div class="mb-3">
			  <label for="password" class="form-label">비밀번호</label>
			  <input type="password" class="form-control" id="password" name="password" value="<%=user.getPassword()%>" readonly >
			</div>

		 </div>

			<div class="d-grid gap-2">
				<button class="btn btn-primary" type="submit">회원 정보 수정</button>
				<button class="btn btn-primary" type="button" onclick="userDel();">회원 삭제</button>
			</div>
		</form>
		<hr>
	</div>
	

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">경고</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        정말 회원 탈퇴하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary" onclick="location.href='delete.jsp?id=<%=user.getId()%>'" >회원 삭제</button>
      </div>
    </div>
  </div>
</div>

<script>
	function userDel(){
		$("#exampleModal").modal("show");
		
	}
</script>	

<%@ include file="/footer.jsp" %>

</body>
</html>
      