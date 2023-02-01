<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<br>
<div class="container">
<form action="loginCheck.jsp" method="post">
	<div class="mb-3">
	<input type="text" class="form-control" name="id" placeholder="아이디" required> 
	</div>
	<div class="mb-3">
	<input type="password" class="form-control" name="password" class="mtop-10" placeholder="패스워드" required>
	</div>
	<div class="mb-3">
	<button type="submit" class="form-control btn btn-outline-secondary">로그인하기</button>
	</div>
</form>
<br><br>
<div class="mb-3">
    <label class="form-label">아이디가 없으세요? 간단한 가입 절차를 통해 MyMEMO의 회원이 되실 수 있습니다.</label>
	<button onclick="location.href='/nonuser/signup.jsp'" type="submit" class="form-control btn btn-outline-secondary">회원가입하기</button>
</div>
</div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>