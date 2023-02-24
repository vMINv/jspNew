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
    <meta charset="utf-8">
   
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>아이디 찾기</title>
    
  </head>
   
  <body class="text-center">

<%@include file="/header.jsp" %>
	<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">비밀번호 찾기</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                  
                        </ol>
                    </nav>
                </div>
            </div>
       
        <!— Navbar & Hero End —>



        
		 <div class="container">  
 		<main class="form-signin w-50 m-auto">
      <form action="findpasscheck.jsp" class="form-signin" method="POST">
        <input type="text" name="id" id="id" class="form-control" placeholder="아이디" required><br>
        <input type="text" name="name" id="name" class="form-control" placeholder="이름" required><BR>
        <input type="email" name="mail" id="mail" class="form-control" placeholder="이메일" required><br>
        	<p class="check" id="checks">${checks}</p><br/>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">비밀번호 찾기</button>
      </form>
      
		</div>
        <div class="links">
        <br>
            <a href="findid.jsp">아이디 찾기</a> | <a href="login.jsp">로그인</a> | <a href="signup.jsp">회원가입</a>

		</main>
        </div>
        
	
   <%@include file="/footer.jsp" %>
  </body>
    <script type="text/javascript">

	

		$("#id").focusout(function(){
			
     if($('#id').val() == ""){
   		$('#checks').text('아이디를 입력해주세요.');
   	  	$('#checks').css('color', 'red');
   
     }else{
    	 $('#checks').hide();
     }
     });
  		
  		$("#name").focusout(function(){
	     if($('#name').val() == ""){
	   		$('#checks').text('이름을 입력해주세요.');
	   	  	$('#checks').css('color', 'red');
	     }else{
	    	 $('#checks').hide();
	     }
	     });
	     
  		$("#mail").focusout(function(){
	     if($('#mail').val() == ""){
	   		$('#checks').text('이메일을 입력해주세요');
	   	  	$('#checks').css('color', 'red');
	     }else{
	    	 $('#checks').hide();
	     }
	     });
  
  </script>
</html>