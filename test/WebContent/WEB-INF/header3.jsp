<%@page import="jdbc.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- 테마 -->
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <title>Chain App Dev - App Landing Page HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--

TemplateMo 570 Chain App Dev

https://templatemo.com/tm-570-chain-app-dev

-->

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="assets/css/animated.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    
<style>
	.dropdown-submenu {
		position: relative;
	}

	.dropdown-submenu>.dropdown-menu {
		top: 0;
		left: 100%;
		margin‑top: ‑6px;
		margin‑left: ‑1px;
		‑webkit‑border‑radius: 0 6px 6px 6px;
		‑moz‑border‑radius: 0 6px 6px;
		border‑radius: 0 6px 6px 6px;
	}

	.dropdown-submenu:hover>.dropdown-menu {
		display: block;
	}

	.dropdown-submenu>a:after {
		display: block;
		content: " ";
		float: right;
		width: 0;
		height: 0;
		border‑color: transparent;
		border‑style: solid;
		border‑width: 5px 0 5px 5px;
		border‑left‑color: #ccc;
		margin‑top: 5px;
		margin‑right: ‑10px;
	}

	.dropdown-submenu:hover>a:after {
		border‑left‑color: #fff;
	}

	.dropdown-submenu.pull‑left>.dropdown-menu {
		left: ‑100%;
		margin‑left: 10px;
		‑webkit‑border‑radius: 6px 0 6px 6px;
		‑moz‑border‑radius: 6px 0 6px 6px;
		border‑radius: 6px 0 6px 6px;
	}
</style>

<% 
	//String sid = (String) session.getAttribute("id");
	String sid = "admin";
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">푸드트럭 !</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown"
			aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<!-- 푸드트럭 -->
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="foodTruckLogin" role="button" data-bs-toggle="dropdown"
						aria-expanded="false">
						<center><i class="fa-sharp fa-solid fa-truck fa-2x" style="color:white">&nbsp;</i></center>
						푸드트럭
					</a>
					<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="foodTruckLogin">
						<li><a class="dropdown-item" href="/food/searchFoodtruck.jsp">검색</a></li>
						<li><a class="dropdown-item" href="#">가게 목록</a></li>
						<li><a class="dropdown-item" href="/food/info.jsp">제보하기</a></li>
					</ul>
				</li>

				<!-- 커뮤니티 -->
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="communityLogin" role="button" data-bs-toggle="dropdown"
						aria-expanded="false">
						<center><i class="fa-solid fa-bullhorn fa-2x" style="color:white">&nbsp;</i></center>
						커뮤니티
					</a>
					<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="communityLogin">
						<li><a class="dropdown-item" href="#">공지 사항</a></li>
						<li><a class="dropdown-item" href="#">문의 사항</a></li>
					</ul>
				</li>

				<!-- 로그인 한 경우 -->
				<%if (sid != null) {%>

				<!-- 마이페이지 -->
				<!-- user, ceo만 보이게 -->
				<%if (userDAO.perCheck(sid)!=2) {%>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="myPage" role="button" data-bs-toggle="dropdown"
						aria-expanded="false">
						<center><i class="fa-regular fa-user fa-2x" style="color:white">&nbsp;</i></center>
						마이 페이지
					</a>
					<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="myPage">
						<!-- per : user -->
						<%if (userDAO.perCheck(sid)==0) {%>
						<li><a class="dropdown-item" href="#">내 주문</a></li>
						<li><a class="dropdown-item" href="#">내 리뷰 목록</a></li>
						<!-- per : ceo -->
						<%} else {%>
						<li><a class="dropdown-item" href="#">주문 내역</a></li>
						<li><a class="dropdown-item" href="#">내 가게 리뷰 목록</a></li>
						<%} %>
					</ul>
				</li>
				<%} %>

				<!-- 설정 -->
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="config" role="button" data-bs-toggle="dropdown"
						aria-expanded="false">
						<center><i class="fa-solid fa-user-gear fa-2x" style="color:white;">&nbsp;</i></center>
						설정
					</a>
					<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="config">
						<li><a class="dropdown-item" href="#">프로필</a></li>
						<li><a class="dropdown-item" href="#">정보 수정</a></li>
						<li><a class="dropdown-item" href="#">회원 탈퇴</a></li>

						<!-- per : ceo -->
						<%if (userDAO.perCheck(sid)==1) {%>
						<li><a class="dropdown-item" href="/ceo/foodAdd.jsp">가게 등록</a></li>
						<li><a class="dropdown-item" href="#">가게 상세 보기</a></li>
						<%} else if (userDAO.perCheck(sid)==2) {%>
						<!-- 관리 메뉴들은 어떻게 타고 들어갈지 정해야 함(ex 푸드트럭 관리 -> 가게 승인과 가게 목록 어떻게 할지) -->
						<li><a class="dropdown-item" href="#">회원 관리</a></li>
						<li class="dropdown-submenu">
							<div class="dropend">
								<a class="dropdown-item dropdown-toggle" href="#">푸드 트럭 관리</a>
							</div>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="#">가게 승인</a></li>
								<li><a class="dropdown-item" href="/admin/foodList.jsp">가게 목록</a></li>
							</ul>
						</li>
						<li><a class="dropdown-item" href="#">공지 사항 관리</a></li>
						<li><a class="dropdown-item" href="#">리뷰 관리</a></li>
						<%} %>
					</ul>
				</li>

				<!-- 로그아웃 -->
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="logout" role="button">
						<center><i class="fa-solid fa-right-from-bracket fa-2x" style="color:white"></i></center>
						로그아웃
					</a>
				</li>
				<%};%>

				<!-- 로그인 안 한 경우 -->
				<%if (sid == null) {%>
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="login" role="button" aria-expanded="false">
						<center><i class="fa-solid fa-right-to-bracket fa-2x" style="color:white"></i></center>
						로그인
					</a>
				</li>

				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="join" role="button" aria-expanded="false">
						<center><i class="fa-solid fa-user-plus fa-2x" style="color:white"></i></center>
						회원가입
					</a>
				</li>
				<%};%>

			</ul>
		</div>
	</div>
</nav>