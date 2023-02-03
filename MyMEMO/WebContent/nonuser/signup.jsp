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
<form action="signupCheck.jsp" method="post">
	<div class="mb-3">
	<input type="email" class="form-control" name="id" placeholder="이메일" required> 
	</div>
	<fieldset>
	<div class="mb-3">
	<input type="password" class="form-control" name="password" id="password" class="mtop-10" placeholder="패스워드" required>
	</div>
	<div class="mb-3">
	<input type="password" class="form-control" id="password2" class="mtop-10" placeholder="패스워드 (확인)" required>
	</div>
	</fieldset>
	<div class="mb-3">
	<input type="text" class="form-control" name="name" placeholder="이름" required> 
	</div>
	<div class="mb-3">
	<button type="submit" class="form-control btn btn-outline-secondary">회원가입하기</button>
	</div>
</form>
<br><br>
<div class="mb-3">
    <label class="form-label">회원 가입 시 MyMEMO의 약관에 동의하신 것으로 간주합니다.</label>
	<button onclick="location.href='/user/main.jsp'" type="submit" class="form-control btn btn-outline-secondary">약관보기</button>
</div>
</div>

<script>
var password = document.getElementById("password");
var password2 = document.getElementById("password2");

function validatePassword(){
  if(password.value != password2.value) { // 만일 두 인풋 필드값이 같지 않을 경우
    // setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
    password2.setCustomValidity("Passwords Don't Match"); 
  } 
  else { // 만일 두 인풋 필드값이 같을 경우
    // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
    // 따라서 빈값을 주어 submit 처리되게 한다
    password2.setCustomValidity(''); 
  }
}

password.onchange = validatePassword;
password2.onkeyup = validatePassword;
</script>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>