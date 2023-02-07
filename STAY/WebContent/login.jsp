<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	<button onclick="location.href='signup.jsp'" type="submit" class="form-control btn btn-outline-secondary">회원가입하기</button>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>