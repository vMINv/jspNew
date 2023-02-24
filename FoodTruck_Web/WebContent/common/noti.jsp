<!-- 
	최초작성자 : 김형준(bright32123@mail.com)
	최초작성일 : 2023/02/15
	버전 기록   : 0.1(시작 23/02/15) 
	
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   String sid = (String) session.getAttribute("id"); 
%> 
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> 
 <body>
<%@ include file="/header.jsp" %>
<tr>
 	<div class="container 12">
      	<div class="grid_9">
      		<div class="">
      		<h3>공지사항 관리</h3>
      		<table>
      		<tr>
      		<th>이름</th><td align="left" style="padding-bottom:10px;">
      		<input type="text" name="name" id="name" size="30"></td>
      		<th>비밀번호</th><td align="left">
      		<input type="text" name="pw" id="pw" size="30"></td></tr>
      		<tr>
      		<input type="text" name="email1" id="email1">
      			<select name="email2" id="email2">
      				<option value="">선택
      				<option value="naver.com">naver.com
      				<option value="gmail.com">gmail.com
      				<option value="daum.net">daum.net
      				<option value="직접익렵">직접입력
      			</select>
      		</td></tr>
      		</table>
      		</div>
      	</div>
      </div>

</tr>
</body>

    
   
 