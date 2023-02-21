<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
 
</head>
<body class="text-center">
<%@ include file="/header.jsp" %>
  <!-- Custom styles for this template -->
  
    <link href="/css/sign-in.css" rel="stylesheet">
<div class="container bg-warning shadow mx-auto p-5 w-50">

<main class="form-signin w-100 m-auto">
	<form action="signupCheck.jsp" method="post">
    <img class="mb-4" src="http://austiny.snu.ac.kr/image/mine.jpg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">회원가입</h1>

    <div class="form-floating">
      <input type="email" name="id" class="form-control" id="floatingInput" placeholder="이메일을 입력하세요">
      <label for="floatingInput">이메일</label>
    </div>
    <div class="form-floating">
      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="암호를 입력하세요">
      <label for="floatingPassword">암호</label>
    </div>
    <div class="form-floating">
      <input type="text" name="name" class="form-control" id="floatingInput" placeholder="이름을 입력하세요">
      <label for="floatingInput">이름</label>
    </div>

    <input type="submit" class="mtop-20" value="회원가입">
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
  </form>
</main>

</div>


<%@ include file="/footer.jsp" %>
</body>
</html>