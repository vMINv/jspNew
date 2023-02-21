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

    <link href="/css/sign-in.css" rel="stylesheet">



<br>
<div class="container bg-warning shadow mx-auto p-5 w-50">

 
<main class="form-signin w-100 m-auto">

<form action="loginCheck.jsp">
    <img class="mb-4" src="http://austiny.snu.ac.kr/image/mine.jpg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">로그인 하세요</h1>

    <div class="form-floating">
      <input type="text" name="id" class="form-control" id="floatingInput" placeholder="아이디를 입력하세요">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="암호를 입력하세요">
      <label for="floatingPassword">암호</label>
    </div>

   
<input type="submit" value="로그인">
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
  </form>

</main>
</div>

<%@ include file="/footer.jsp" %>
</form>
</body>
</html>