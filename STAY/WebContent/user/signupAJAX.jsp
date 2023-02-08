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
<link href="/etc/css.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<br>
<div class="container">
	<div class="mb-3">
	<input type="text" class="form-control" name="id" id="id" placeholder="이메일" required> 
	</div>
	<fieldset>
	<div class="mb-3">
	<input type="password" class="form-control" name="password" id="password" class="mtop-10" placeholder="패스워드" required>
	</div>
	<div class="mb-3">
	<input type="password" class="form-control" id="passwordCheck" class="mtop-10" placeholder="패스워드 확인" required>
	</div>
	</fieldset>
	<div class="mb-3">
	<input type="text" class="form-control" name="name" id="name" placeholder="이름" required> 
	</div>
	<div class="mb-3">
	<button type="submit" id="signin" onclick="signinFunction();" class="form-control btn btn-outline-secondary">가입신청하기</button>
	</div>
</div>

<script>
function signinFunction(){
	$.ajax({
		type:"post",
		url:"signupCheckAJAX.jsp",
		data:{id:encodeURIComponent(document.getElementById('id').value),
			  password:encodeURIComponent(document.getElementById('password').value),
			  name:encodeURIComponent(document.getElementById('name').value)
			},
		dataType:"text",
		success:function(data){/* 성공결과 */
			var id = document.getElementById('id');
			var password = document.getElementById('password');
			var passwordCheck = document.getElementById('passwordCheck');
			var name = document.getElementById('name');
			id.value = "";
			password.value = "";
			passwordCheck.value = "";
			name.value = "";
		}
	});
}


//비밀번호 일치 체크 
var password = document.getElementById("password");
var passwordCheck = document.getElementById("passwordCheck");
function validatePassword(){
  if(password.value != passwordCheck.value) { // 만일 두 인풋 필드값이 같지 않을 경우
    // setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
    passwordCheck.setCustomValidity("Passwords Don't Match"); 
  } 
  else { // 만일 두 인풋 필드값이 같을 경우
    // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
    // 따라서 빈값을 주어 submit 처리되게 한다
    passwordCheck.setCustomValidity(''); 
  }
}
password.onchange = validatePassword;
passwordCheck.onkeyup = validatePassword;
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>