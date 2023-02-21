<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
  
    
<% 
	String sid = (String) session.getAttribute("id"); 
%>

      
<nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">  

<div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/main.jsp">Group Talk </a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">피드</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="/main.jsp">피드보기</a></li>

            </ul>
          </li>
            <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">멤버</a>
            <ul class="dropdown-menu">
            <%if (sid == null) {%>
              <li><a class="dropdown-item" href="/user/login.jsp">로그인</a></li>
              <li><a class="dropdown-item" href="/user/signup.jsp">회원가입</a></li>
              <%} else {%>
              <li><a class="dropdown-item" href="/user/logout.jsp">로그아웃</a></li>
              <li><a class="dropdown-item" href="/user/signedit.jsp">정보변경</a></li>
              <li><a class="dropdown-item" href="/user/signout.jsp">회원탈퇴</a></li>
              <%};%>
            </ul>
          </li>
          
            <%if (sid != null && sid.equals("admin") ){%>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">관리</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="/ajax/userAllAJAX.jsp">회원관리</a></li>
              <li><a class="dropdown-item" href="/feedAll.jsp">메모관리</a></li>
            </ul>
          </li>
           <%};%>
          
          
        </ul>
        
        <div class="px-3 py-2 mb-3">
      <div class="container d-flex flex-wrap justify-content-center">
         <div class="text-end">
         
 		      <%if (sid == null) {%>
				<span class='text-info bg-dark'>【 로그인 하세요 】</span>
              <%} else {%>
				<span class='text-warning bg-dark'>【 <%=sid %>님 로그인하셨습니다 】</span>
			  <%};%> 
 
        </div>
      </div>
    </div>
        
        
      </div>
    </div>
  </nav>	

 