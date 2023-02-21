<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
  <!-- Custom styles for this template -->
  
    <link href="sign-in.css" rel="stylesheet">
</head>
<body class="text-center">
<%@ include file="/header.jsp" %>

  

<div class="container">

<main class="form-signin w-100 m-auto">
	<form action="signeditCheck.jsp" method="post">
    <img class="mb-4" src="http://austiny.snu.ac.kr/image/mine.jpg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">회원 정보 수정</h1>

    <div class="form-floating">
      <input type="hidden" name="id" class="form-control" id="floatingInput" value="<%=sid %>">
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

    <input type="submit" class="mtop-20" value="정보수정">
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
  </form>
</main>

</div>


<%@ include file="/footer.jsp" %>
</body>
</html>