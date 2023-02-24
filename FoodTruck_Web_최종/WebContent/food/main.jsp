<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
 
</head>
<body class="text-center">

<%@include file="/header.jsp" %>

<link href="/css/sign-in.css" rel="stylesheet">

 <div class="container">  
 
 <form action="login.jsp">
  <button type="submit" class="btn btn-secondary btn-lg">로그인</button>
  </form>
  	<br>

	 <a id="custom-login-btn" href="javascript:kakaoLogin()" class="d-flex justify-content-center">
	<img src="../img/kakao_login_medium_wide.png">
	</a>
  	<br>
  
   <form action="signup.jsp">
  <button type="submit" class="btn btn-secondary btn-lg">회원가입</button>
  </form>

  
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>



  
  
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
	
<%@ include file ="/footer.jsp" %>	
</form>
</main>
</div>
</body>
</html>