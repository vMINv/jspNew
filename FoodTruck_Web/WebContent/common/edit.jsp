<!-- 
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 	  0.1(시작 23/02/15) 
              0.5(기본작업 23/02/16) 
              0.7(추가 디자인 23/02/18)
              1.0(1차 완성 23/02/20)
 -->
<%request.setCharacterEncoding("utf-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>



<div class="container">
<form action="editProc.jsp" method="post">
<h2> 회원 정보 수정 </h2>

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
</div>
</form>
<hr>





</div>

</body>
</html>