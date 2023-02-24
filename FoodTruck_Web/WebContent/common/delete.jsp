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
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>


<%
request.setCharacterEncoding("utf-8");

sid ="1";                     // sid 나중에 받아오도록 변경해야한다.

String id = sid;

userDTO userDTO = userDAO.info(id);


id = userDTO.getId();
String name = userDTO.getName();
String mail = userDTO.getMail();
String password = userDTO.getPassword();
%>

<div class="container">
<form action="editProc.jsp" method="post">
<h2> 회원 탈퇴 </h2>

<div class="mb-3 row">
	<div class="mb-3" style="margin-top:5%">
	  <label for="id" class="form-label">회원 아이디</label>
	  <input type="text" class="form-control" id="id" name="id" value="<%=request.getParameter("id") %>" readonly>
	</div>
	<div class="mb-3">
	  <label for="name" class="form-label">회원 이름</label>
	  <input type="text" class="form-control" id="name" name="name" value="<%=request.getParameter("name") %>" >
	</div>
	<div class="mb-3">
	  <label for="mail" class="form-label">회원 메일</label>
	  <input type="email" class="form-control" id="mail" name="mail" value="<%=request.getParameter("mail") %>" >
	</div>
	<div class="mb-3">
	  <label for="password" class="form-label">비밀번호</label>
	  <input type="password" class="form-control" id="password" name="password" value="<%=request.getParameter("password") %>" >
	</div>

 
 <textarea rows="15" cols="90%" disabled>
회원 탈퇴는 모든 개인 정보와 데이터를 영구적으로 삭제하므로 신중하게 결정하셔야 합니다. 탈퇴 전에는 해당 계정에 등록된 모든 정보, 데이터, 파일 등을 백업하시는 것이 좋습니다. 탈퇴 후에는 해당 계정의 모든 정보와 데이터가 삭제되며, 이 정보는 복구할 수 없습니다.

회원 탈퇴를 선택하시면, 아래와 같은 내용들이 삭제됩니다:

등록된 모든 개인 정보 (이름, 이메일, 전화번호 등)
프로필 정보, 설정, 프로필 사진, 배경화면 등
작성한 글, 댓글, 리뷰, 게시물 등
포인트, 쿠폰, 혜택, 결제 정보 등
계정 내 모든 데이터 (채팅 기록, 알림 등)
모든 데이터 삭제 후에는 다시 복구할 수 없습니다. 탈퇴 전에 더 이상 필요하지 않은 정보를 정리하시고, 탈퇴 시점에 중요한 정보를 확인하셔서 실수가 없도록 해주시기 바랍니다.

계정 삭제 후에는 이메일 또는 문자 메시지 등으로 확인 메시지를 받으실 수 있습니다. 이메일 주소 또는 휴대전화 번호를 정확하게 입력하신 후, 계정 삭제를 진행하시기 바랍니다.

탈퇴 후에는 해당 계정으로 다시 로그인하여 서비스를 이용하실 수 없습니다. 또한, 탈퇴 전에 작성한 게시물 등은 삭제되지 않으며, 해당 게시물에 대한 저작권 및 책임은 회원 본인에게 있습니다.

위 내용을 모두 확인하셨다면, 아래 버튼을 눌러 회원 탈퇴를 진행해주시기 바랍니다."</textarea>
</div>
<div class="d-grid gap-2">
	<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
  회원 탈퇴
</button>
</div>
</form>

</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">경고</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        정말 회원 탈퇴하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary" onclick="location.href='deleteProc.jsp?id=1'" >회원 탈퇴</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>