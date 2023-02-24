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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   
    <meta name="viewport" content="width=device-width, initial-scale=1">

 
   
    <title>아이디 찾기</title>
  </head>

 <body class="text-center">

<%@include file="/header.jsp" %>
			<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">아이디 찾기</h1>
                          <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                         <li class="breadcrumb-item"><a href="/main.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">LOGIN</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">아이디 찾기</li>
                  
                        </ol>
                    </nav>
                </div>
            </div>
       
        <!— Navbar & Hero End —>



        
		 <div class="container">  
 		<main class="form-signin w-50 m-auto">
      <form action="findidcheck.jsp" class="form-signin" method="POST">
  		
        <input type="text" name="name" id="name" class="form-control" placeholder="이름" required autofocus><BR>
        <input type="email" name="mail" id="mail" class="form-control" placeholder="이메일" required><br>
        	<p class="check" id="check2">${check2}</p>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">아 이 디 찾 기</button>
      
      </form>
        
		</div>
        <div class="links">
        <br>
            <a href="findpass.jsp">비밀번호 찾기</a> | <a href="login.jsp">로그인</a> | <a href="signup.jsp">회원가입</a>

        </div>
	</main>
	
	
  <%@include file="/footer.jsp" %>
  </body>
  <script type="text/javascript">
		
  		
  
  		$("#name").focusout(function(){
  			
	     if($('#name').val() == ""){
	   		$('#check2').text('이름을 입력해주세요.');
	   	  	$('#check2').css('color', 'red');
	   
	     }else{
	    	 $('#check2').hide();
	     }
	     });
	     
  		$("#mail").focusout(function(){
	     if($('#mail').val() == ""){
	   		$('#check2').text('이메일을 입력해주세요');
	   	  	$('#check2').css('color', 'red');
	     }else{
	    	 $('#check2').hide();
	     }
	     });
  
  </script>
</html>