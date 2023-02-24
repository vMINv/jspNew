<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
 
</head>
<body class="text-center">



<body class="bg-gradient-primary">

<%@include file="/header.jsp" %>
<link href="/css/sign-in.css" rel="stylesheet">
<%
request.setCharacterEncoding("utf-8");

	String mname = request.getParameter("name");
	String memail = request.getParameter("email");

	
	
%>
    <div class="container">
<form action="signupCheck.jsp">

 <div class="container">  
 
<main class="form-signin w-100 m-auto">
  <form action="signupCheck.jsp" method="post">
    <img class="mb-4" src="" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">회원가입</h1>

    <div class="form-floating">
      <input type="text" name="id" class="form-control" id="floatingInput" placeholder="아이디를 입력하세요">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="암호를 입력하세요">
      <label for="floatingPassword">암호</label>
    </div>
    
      <div class="form-floating">
      <input type="email"  name="mail" class="form-control" id="floatingInput" placeholder="이메일을 입력하세요">
      <label for="floatingInput">이메일</label>
    </div>
    
      <div class="form-floating">
      <input type="text"  name="name" class="form-control" id="floatingInput" placeholder="이름을 입력하세요">
      <label for="floatingInput">이름</label>
    </div>
    

	<br>
   	<input type="submit" class="mtop-20" value="회원가입">
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
  </form>
</main>
</div>
</form>
    </div>

<%@ include file ="/footer.jsp" %>	

</body>

</html>