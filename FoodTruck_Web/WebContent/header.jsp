<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="jdbc.userDAO"%>
<%
String sid = (String) session.getAttribute("id");
%>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="/resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/resources/css/style.css" rel="stylesheet">

<!-- 추가 -->
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 추가 끝 -->


<div class="container-xxl bg-white p-0">
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Spinner End -->


	<!-- Navbar & Hero Start -->
	<div class="container-xxl position-relative p-0">
		<nav
			class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
			<a href="" class="navbar-brand p-0">
				<h1 class="text-primary m-0">
					<i class="fa fa-utensils me-3"></i>FoodTruck
				</h1> <!-- <img src="img/logo.png" alt="Logo"> -->
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="fa fa-bars"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto py-0 pe-4">
					<a href="/main.jsp" class="nav-item nav-link active">Home</a>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">Foodtruck</a>
						<div class="dropdown-menu m-0 dropdown-first">
							<a href="booking.html" class="dropdown-item">가게목록</a> <a
								href="booking.html" class="dropdown-item">제보하기</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">Community</a>
						<div class="dropdown-menu m-0 dropdown-first">
							<a href="/common/notice.jsp?page=1" class="dropdown-item">공지사항</a>
							<li class="dropdown-submenu">
								<div class="dropend">
									<a class="dropdown-item dropdown-toggle" href="#">문의 사항</a>
								</div>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
										href="/user/myQuestion.jsp?page=1">내 문의</a></li>
									<li><a class="dropdown-item" href="/user/questionAdd.jsp">문의하기</a></li>
								</ul>
							</li>
						</div>
					</div>

					<!-- 로그인 한 경우 -->
					<%
					if (sid != null) {
					%>
					<!-- user, ceo만 보이게 -->
					<%
					if (userDAO.perCheck(sid) != 2) {
					%>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">Mypage</a>
						<div class="dropdown-menu m-0 dropdown-first">
							<!-- per : user -->
							<%
							if (userDAO.perCheck(sid) == 0) {
							%>
							<a href="booking.html" class="dropdown-item">내주문</a> <a
								href="booking.html" class="dropdown-item">내리뷰목록</a>
							<!-- per : ceo -->
							<%
							} else {
							%>
							<a href="/ceo/ceoFoodList.jsp" class="dropdown-item">내 가게</a>
							<%
							}
							%>
						</div>
					</div>
					<%
					}
					%>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">Setting</a>
						<div class="dropdown-menu m-0 dropdown-first">
							<a href="booking.html" class="dropdown-item">프로필</a> <a
								href="booking.html" class="dropdown-item">정보수정</a> <a
								href="booking.html" class="dropdown-item">회원탈퇴</a>
							<!-- per : ceo -->
							<%
							if (userDAO.perCheck(sid) == 1) {
							%>
							<a href="booking.html" class="dropdown-item">가게등록</a> <a
								href="booking.html" class="dropdown-item">가게상세보기</a>
							<%
							} else if (userDAO.perCheck(sid) == 2) {
							%>
							<a href="booking.html" class="dropdown-item">회원관리</a>
							<li class="dropdown-submenu">
								<div class="dropend">
									<a class="dropdown-item dropdown-toggle" href="#">푸드 트럭 관리</a>
								</div>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">가게승인</a></li>
									<li><a class="dropdown-item" href="#">가게목록</a></li>
								</ul>
							</li> <a href="booking.html" class="dropdown-item">공지사항관리</a> <a
								href="booking.html" class="dropdown-item">리뷰관리</a>
							<%
							}
							%>
						</div>
					</div>
					<a href="contact.html" class="nav-item nav-link">Logout</a>
					<%
					}
					%>
					<%
					if (sid == null) {
					%>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">Login</a>
						<div class="dropdown-menu m-0 dropdown-first">
							<a href="booking.html" class="dropdown-item">Sign</a>
						</div>
					</div>
					<%
					}
					%>
				</div>
				<a href="" class="btn btn-primary py-2 px-4">Search</a>
			</div>
		</nav>