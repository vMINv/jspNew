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

<link href="/css/sign-in.css" rel="stylesheet">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="" style="color:;"><img src=""/></h2>
		</div>
        
		<div class="card-body">
      <form action="findid.jsp" class="form-signin" method="POST">
  		 <p class="text2"> ${findid2}</p>
        <input type="text" name="name" id="name" class="form-control" placeholder="이름" required autofocus><BR>
        <input type="email" name="mail" id="mail" class="form-control" placeholder="이메일" required><br>
        	<p class="check" id="check">${check}</p><br/>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">아 이 디 찾 기</button>
      
      </form>
        
		</div>
        <div class="links">
            <a href="findpass.jsp">비밀번호 찾기</a> | <a href="login.jsp">로그인</a> | <a href="signup.jsp">회원가입</a>

        </div>
	</div>
   
  </body>
  <script type="text/javascript">
		
  		
  
  		$("#name").focusout(function(){
  			
	     if($('#name').val() == ""){
	   		$('#check').text('이름을 입력해주세요.');
	   	  	$('#check').css('color', 'red');
	   
	     }else{
	    	 $('#check').hide();
	     }
	     });
	     
  		$("#email").focusout(function(){
	     if($('#email').val() == ""){
	   		$('#check').text('이메일을 입력해주세요');
	   	  	$('#check').css('color', 'red');
	     }else{
	    	 $('#check').hide();
	     }
	     });
  
  </script>
</html>