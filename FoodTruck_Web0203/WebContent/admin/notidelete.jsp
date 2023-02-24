
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
 <head>
 <style>
 table{border-style : ridge;}
 td{border-style : ridge;}
 </style>
 </head>
 <body>
<%--  <%@ include file="/header.jsp" %> --%>
<tr>
<br><br><br>
 	<div class="container 12">
      	<div class="grid_9">
      		<h1>공지사항 등록</h1>
      		<br><br><br>
      		<table>
      		<h2>제목</h2>
      		<input type="text" name="ntitle" id="ntitle"  style="width:500px; height:50px;"></td>
      		<h2>내용</h2>
      		<input type="text" name="ncontent" id="ncontent" style="width:500px; height:500px;"></td>
      		</tr>
      		</table>
      		<input type="submit" class = "btn-btn-primary puu-right" value="등록" onClick="if(!confirm('등록하시겠습니까?')){return false;}"/>
      		<input type="submit" value="취소" onClick="if(!confirm('취소하시겠습니까?')){return false;}"/>
      		
      		</div>
      	</div>
      </div>
</body>
      