<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "page_error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group Talk</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
<%@ include file="/header.jsp" %>
   
<% 
	sid = (String) session.getAttribute("id");
	if (!sid.equals("admin")){
%>		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">관리자 전용 메뉴</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        관리자만 사용 가능한 메뉴입니다.<br>
		        로그인 화면으로 이동합니다. 
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='/user/login.jsp'" class="btn btn-primary">로그인 이동</button>

		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal2").modal("show");
			});
		</script>		
		
<%} else {
	session.setAttribute("id", sid);
}
%>		
	
<style>
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
  display: flex;
  align-items: center;
  padding-top: 30px;
  padding-bottom: 30px;
  background-color: #f5f5f5;
    font-family: 'GangwonEdu_OTFBoldA';
}
</style>


<div class="container bg-warning shadow mx-auto p-5 w-75">

 
 <script>
 	function addItem(id) {
 		$.ajax({
 			type:"post",
 			url: "useradd.jsp",
 			data : {id:id},
          
 			dataType:"text",
 			
 			success:function(data) {
 				alert("관리자 회원등록 성공");
 				searchFunction();

 			}
 		});
 	}
 	
 	function delItem(id) {
 		$.ajax({
 			type:"post",
 			url: "/admin/tempdel.jsp",
 			data : {id:id
 				
 			},
 			dataType:"text",
 			
 			success:function(data) {
 				searchFunction();
 			}
 		});
 	}
 	
  	function searchFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'tempall.jsp',
 			success:function(data){
 				var users = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < users.length; i++){
 					

 					str += "<tr><td>" + users[i].id + "</td>";
 					str += "<td><small>&nbsp;(" + users[i].name + ")</small></td>";						
					str += "<td><div onclick='delItem(\"" + users[i].id + "\")'><span class='btn btn-danger'>Reject</span></div></td>"; 					
					str += "<td><div onclick='addItem(\"" + users[i].id + "\")'><span class='btn btn-primary'>Accept</span></div></td>";
 					str += "</tr>";
 					str += "<tr><td colspan=4 height=40><hr></td></tr>"
 				} $("#ajaxTable").html(str);
 			}
 		});
 	}
 


 	window.onload = function() {
 		searchFunction();
 	}

 
 </script>
 

<h1>가입 신청자 목록</h1>
<hr>
<div class = "input-group justify-content-center">



<table align=center width="400">
<thead>
</thead>
<tbody id="ajaxTable">

</tbody>
</table>
</div>

    <%@ include file="/footer.jsp" %>
</body>
</html>