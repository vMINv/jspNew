<!-- 
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 	  0.1(시작 23/02/15) 
              0.5(기본작업 23/02/16) 
              1.0(1차 완성 23/02/22)
 -->
<%request.setCharacterEncoding("utf-8"); %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/header.jsp" %>
<%
sid = (String) session.getAttribute("id");

userDTO uDTO = userDAO.info(sid);

String id = sid;
String name = uDTO.getName();
String mail = uDTO.getMail();
String password = uDTO.getPassword();%>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>

<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">정보 수정</h1>
              <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">HOME</a></li>
                            <li class="breadcrumb-item"><a href="#">SETTING</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">정보 수정</li>
                        </ol>
                    </nav>
                </div>
            </div>

<div class="container">
<form action="editProc.jsp" method="post">

<!-- 유저 정보 표시 구역 -->  

<div class="mb-3 row">
	<div class="mb-3" style="margin-top:5%">
	  <label for="id" class="form-label">회원 아이디</label>
	  <input type="text" class="form-control" id="id" name="id" value="<%=request.getParameter("id")%>" readonly>
	</div>
	<div class="mb-3">
	  <label for="name" class="form-label">회원 이름</label>
	  <input type="text" class="form-control" id="name" name="name" value="<%=request.getParameter("name")%>" >
	</div>
	<div class="mb-3">
	  <label for="mail" class="form-label">회원 메일</label>
	  <input type="email" class="form-control" id="mail" name="mail" value="<%=request.getParameter("mail")%>" >
	</div>
	<div class="mb-3">
	  <label for="password" class="form-label">비밀번호</label>
	  <input type="password" class="form-control" id="password" name="password" value="<%=request.getParameter("password")%>" >
	</div>

 </div>

<div class="d-grid gap-2">
	<button class="btn btn-primary" type="submit">회원 정보 수정</button>
	<button class="btn btn-secondary" type="button" onclick="goBack()">뒤로가기</button>
</div>
</form>
<hr>





</div>

</body>


<script>
function goBack() {
  window.history.back();
}
</script>
<%@ include file="/footer.jsp"%>
</html>