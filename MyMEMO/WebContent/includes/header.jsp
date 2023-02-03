<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link href="/etc/sign-in.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<%String sid = (String) session.getAttribute("id"); %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<nav class="navbar navbar-expand-lg bg-light rounded" aria-label="Twelfth navbar example">
      <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample10" aria-controls="navbarsExample10" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">My MEMO</a>
            </li>
                <%if(sid==null){ %>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Manage</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/nonuser/login.jsp">로그인</a></li>
                <li><a class="dropdown-item" href="/nonuser/signup.jsp">회원가입</a></li>
              </ul>
            </li>
            	<%}else if(sid.equals("hyunmin04050@gmail.com")){ %>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">관리</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/ajax/userAllAJAX.jsp">회원관리</a></li>
                <li><a class="dropdown-item" href="/ajax/feedAllAJAX.jsp">메모관리</a></li>
                <li><a class="dropdown-item" href="/user/logout.jsp">로그아웃</a></li>
              </ul>
            </li>
            	<%}else{ %>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">메모</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/feed/feedadd.jsp">메모작성</a></li>
                <li><a class="dropdown-item" href="/user/main.jsp">메모보기</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">정보</a>
              <ul class="dropdown-menu">
                	<li><a class="dropdown-item" href="#">공지사항</a></li>
                	<li><a class="dropdown-item" href="#">이용약관</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false"><span class="text-primary">[ <%=sid %> 님 로그인하였습니다 ]</span></a>
              <ul class="dropdown-menu">
                	<li><a class="dropdown-item" href="/user/logout.jsp">로그아웃</a></li>
                	<li><a class="dropdown-item" href="#">정보수정</a></li>
                	<li><a class="dropdown-item" href="/user/signout.jsp">회원탈퇴</a></li>
              </ul>
            </li>
                <%} %>
          </ul>
        </div>
      </div>
    </nav>	 
