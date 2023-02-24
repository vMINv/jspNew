<!-- 
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 	  0.1(시작 23/02/15) 
              0.5(기본작업 23/02/16) 
              0.7(추가 디자인 23/02/18)
              1.0(1차 완성 23/02/20)
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>

<%@ include file="/header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<title>프로필</title>
</head>
<body>

<%@ page import="jdbc.userDAO" %>
<%@ page import="jdbc.*" %>
<%                   // sid 나중에 받아오도록 변경해야한다.
request.setCharacterEncoding("utf-8");

userDTO userDTO = userDAO.info("t1");


String id = userDTO.getId();
String name = userDTO.getName();
String mail = userDTO.getMail();
String password = userDTO.getPassword();
%>

<div class="container">
<h3>내 정보 보기</h3>
<form action="edit.jsp" method="post">

 <div class="mb-3 row">
	<div class="mb-3" style="margin-top:5%">
	  <label for="id" class="form-label">회원 아이디</label>
	  <input type="text" class="form-control" id="id" name="id" value="<%=id %>" readonly>
	</div>
	<div class="mb-3">
	  <label for="name" class="form-label">회원 이름</label>
	  <input type="text" class="form-control" id="name" name="name" value="<%=name %>" readonly>
	</div>
	<div class="mb-3">
	  <label for="mail" class="form-label">회원 메일</label>
	  <input type="email" class="form-control" id="mail"name="mail" value="<%=mail %>" readonly>
	</div>

	<input type="hidden" id="password" 	name="password" value="<%=password %>" ><br>
 </div>

<div class="d-grid gap-2">
  <input  class="btn btn-info"    type="submit" value="회원 정보 수정">
  <button class="btn btn-primary" type="button">리뷰보기</button>
  <button class="btn btn-primary" type="button">주문내역</button>
  <button class="btn btn-primary" type="button">문의하기</button>
  <input  class="btn btn-danger"  type="submit" value="탈퇴" formaction="delete.jsp" >
</div>

</form>
</div>
</body>
</html>