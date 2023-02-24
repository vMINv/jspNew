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



<div class="container">
<form action="edit.jsp" method="post">
<h2> 회원 관리 </h2>

<div class="mb-3 row">
	<div class="mb-3" style="margin-top:5%">
	  <label for="id" class="form-label">회원 아이디</label>
	  <input type="text" class="form-control" id="id" name="id" value="<%=request.getParameter("id")%>" readonly>
	</div>
	<div class="mb-3">
	  <label for="name" class="form-label">회원 이름</label>
	  <input type="text" class="form-control" id="name" name="name" value="<%=request.getParameter("name")%>" >
	</div>
	<div class="mb-3">
	  <label for="mail" class="form-label">회원 메일</label>
	  <input type="email" class="form-control" id="mail" name="mail" value="<%=request.getParameter("mail")%>" >
	</div>
	<div class="mb-3">
	  <label for="password" class="form-label">비밀번호</label>
	  <input type="password" class="form-control" id="password" name="password" value="<%=request.getParameter("password")%>" readonly >
	</div>

 </div>

<div class="d-grid gap-2">
	<button class="btn btn-primary" type="submit">회원 정보 수정</button>
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
        <button type="submit" class="btn btn-primary" onclick="location.href='delete.jsp?id=1'" >회원 삭제</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>
</body>
</html>
      