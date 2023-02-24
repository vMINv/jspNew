<!-- 
최초작성자 : 강남욱 (redsky6301@naver.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) 
              0.5(기본작업 23/02/16) 
             
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼페이지</title>
  <!-- Custom styles for this template -->
  
 
</head>
<body class="text-center">

<%@include file="/header.jsp" %>
			<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">로그인</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                  
                        </ol>
                    </nav>
                </div>
            </div>
      
        <!— Navbar & Hero End —>


 <div class="container">  
 <main class="form-signin w-50 m-auto">
 <form action="loginCheck.jsp">

    <div class="form-floating">
      <input type="text"  name="id" class="form-control" id="floatingInput" placeholder="아이디를 입력하세요">
      <label for="floatingInput">아이디</label>
    </div>
    <br>
    <div class="form-floating">
      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="암호를 입력하세요">
      <label for="floatingPassword">암호</label>
    </div>
    
     <div class="links">
     <br>
            <a href="findid.jsp"> 아이디 찾기</a> | <a href="findpass.jsp">비밀번호 찾기</a>
	<br><br>
	 <div class="d-grid gap-2 col-5 mx-auto">
    <button type="submit" class="btn btn-lg btn-primary btn-block">로그인</button>
      </div>
    <br>
    
     <a id="custom-login-btn" href="javascript:kakaoLogin()" class="d-flex justify-content-center">
	<img src="../img/kakao_login_medium_wide.png"> 
	</a>
	
        </div>
   
  </form>
  
  
  
</main>

 	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>



<script>
	//발급 받은 키
	Kakao.init("66d56477cc3509f1797562626578e950");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			// 개발자 사이트에서 체크한 항목들과 반드시 일치해야 한다. 
			scope:'profile_nickname, account_email',
			success: function (authObj) {window.Kakao.API.request({url:'/v2/user/me',
				success:res => {const kakaoAccount = res.kakao_account;
					location.href='loginKakaoCheck.jsp?name=' + kakaoAccount.profile.nickname
							+ '&mail=' + kakaoAccount.email;}
			});
		}		
		});
	}

</script>

<%@include file="/footer.jsp" %>


</div>
</body>
</html>