<!-- 
최초작성자 : 강남욱 (redsky6301@naver.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
              0.5(기본작업 23/02/16) 
             
 -->
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
			<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">회원가입</h1>
        				  <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                         <li class="breadcrumb-item"><a href="/main.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">LOGIN</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">회원가입</li>
                        
                  
                        </ol>
                    </nav>
                </div>
            </div>
    
        <!— Navbar & Hero End —>



 <div class="container">  
 
<main class="form-signin w-50 m-auto">
  <form action="signupCheck.jsp" method="post">
    


	  <input type="radio"  name="per" value="user" checked/>user
 	  <input type="radio"  name="per" value="ceo" />ceo
	<br>
	<br>
    <div class="form-floating">
      <input type="text" name="id" class="form-control" id="floatingInput" placeholder="아이디를 입력하세요">
      <label for="floatingInput">아이디</label>
    </div>
    <br>
    <div class="form-floating">
      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="암호를 입력하세요">
      <label for="floatingPassword">암호</label>
    </div>
    <br>
      <div class="form-floating">
      <input type="email"  name="mail" class="form-control" id="floatingInput" placeholder="이메일을 입력하세요">
      <label for="floatingInput">이메일</label>
    </div>
    <br>
      <div class="form-floating">
      <input type="text"  name="name" class="form-control" id="floatingInput" placeholder="이름을 입력하세요">
      <label for="floatingInput">이름</label>
    </div>
    

	<br>
    <button type="submit" class="btn btn-lg btn-primary btn-block">회원가입</button>
  </form>
</main>
</div>


<%@ include file ="/footer.jsp" %>	

</body>

</html>