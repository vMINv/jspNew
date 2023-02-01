<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jdbc.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<% 
//	String sid = (String) session.getAttribute("id");//header에서 이미 선언 타입 지정 X 
	sid = (String) session.getAttribute("id");
	if (sid == null){
%>		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 전용 메뉴</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        로그인을 한 회원만 사용 가능한 메뉴입니다.<br>
		        로그인 화면으로 이동합니다. 
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='/nonuser/login.jsp'" class="btn btn-primary">로그인 이동</button>

		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal1").modal("show");
			});
		</script>		
		
<%} else {
}%>
	<br>
	<div class="container">
	<table class="table table-striped">
	  <thead>
	    <tr>
	      <th scope="col">No</th>
	      <th scope="col">ID</th>
	      <th scope="col">Date</th>
	      <th scope="col">Content</th>
	    </tr>
	  </thead>
	  <tbody>
<%	ArrayList<FeedDTO> feeds = FeedDAO.getAllList();
	for (FeedDTO feed:feeds){
%>
	    <tr>
	      <th scope="row"><%=feed.getNo() %></th>
	      <td><%=feed.getId() %></td>
	      <td><%=feed.getTs() %></td>
	      <td><%=feed.getContent() %></td>
	    </tr>
<%	} %>
	  </tbody>
	</table>
	</div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>