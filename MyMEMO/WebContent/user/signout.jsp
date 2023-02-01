<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<br>
<div class="container">
	<form action="signoutCheck.jsp" method="post">
		<div class="mb-3">
		<input type="text" class="form-control" name="id" placeholder="아이디" required> 
		</div>
		<div class="mb-3">
		<button type="submit" class="form-control btn btn-outline-secondary">회원탈퇴하기</button>
		</div>
	</form>
	<br><br>
	<div class="mb-3">
	    <label class="form-label">회원 탈퇴 시 회원 정보 및 활동 내역이 모두 삭제되며, 복원이 불가능하오니 유의하시기 바랍니다.</label>
	</div>
</div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>