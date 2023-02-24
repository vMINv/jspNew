<!--  
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/2/20

버전 기록 : 0.1(시작 23/02/21) -데이터만 가져옴 디자인은 이후에 해야함.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
</head>
<body>
<%@ include file="/header.jsp"%>
<% 
	int rno = Integer.parseInt(request.getParameter("rno"));
	
	reviewDTO rDTO = reviewDAO.getMyReview(rno);
	String id =sid= request.getParameter("id");
	
	%>
<div class="container-xxl py-5 bg-dark hero-header mb-5">
        <div class="container text-center my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">리뷰 수정</h1>
           
        </div>
    </div>

<!-- 리뷰등록 -->
<form action="editMyReviewProc.jsp" method="get">
<div class="container">
	
	<div class="mb-3">
		<label class="form-check-label" for="inlineCheckbox1" >[별점]</label>
		<div></div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="1">
		  <label>1</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="2">
		  <label>2</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="3">
		  <label>3</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="4">
		  <label>4</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="5">
		  <label>5</label>
		</div>
	</div>
	<div class="mb-3">
	<label for="exampleInputEmail1" class="form-label">[내용]</label>
	<input type="text" class="form-control" name="rcontent" id="rcontent" required placeholder="수정할 내용을 적어주세요"> 
	</div>
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="submit" class="form-control btn btn-outline-secondary">등록하기</button>
			</div>
			<div class="col">
				<button type="reset" class="form-control btn btn-outline-secondary">취소하기</button>
			</div>
		</div>
	</div>
</div>
<input type="hidden" value="<%=rno %>" name="rno" >
</form>

</body>
<%@ include file="/footer.jsp"%>

</html>