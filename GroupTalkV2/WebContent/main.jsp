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
	if (sid == null){
%>		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<div class="container bg-warning shadow mx-auto p-5 w-75">

 
 <script>
 	function addItem() {
 		$.ajax({
 			type:"post",
 			url: "/feed/feedadd.jsp",
 			data : {id:document.getElementById('id').value,
 				    content:$("#summernote").summernote("code")
 				},
          
 			dataType:"text",
 			
 			success:function(data) {
 				var summernote = document.getElementById('summernote');
 				summernote.value="";
 				searchFunction();
 				$("#summernote").summernote("reset");

 			}
 		});
 	}
 	
 	function delItem(no) {
 		$.ajax({
 			type:"post",
 			url: "/feed/feeddel.jsp",
 			data : {no:no
 				
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
 			url:'/feed/feedall.jsp',
 			success:function(data){
 				var feeds = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < feeds.length; i++){
 					

 					str += "<tr><td>" + feeds[i].id + "</td>";
 					str += "<td><small>&nbsp;(" + feeds[i].ts + ")</small></td></tr>";		
 					str += "<tr><td colspan=2>" + feeds[i].content + "</td></tr>";
 					str += "<tr><td conspan=2>";
 					
 					if (<%=sid%> == feeds[i].id) {
					str += "<div onclick='delItem(\"" + feeds[i].no + "\")'><span class='text-danger bg-dark'>Delete</span></div>";
 					}
 					
 					str += "</td></tr>";
 					str += "<tr><td colspan=2 height=40><hr></td></tr>"
 				} $("#ajaxTable").html(str);
 			}
 		});
 	}
 


 	window.onload = function() {
 		searchFunction();
 	}

 
 </script>
 

<h1>Group Talk</h1>
<hr>
<div class = "input-group justify-content-center">
<input id="id" type="hidden" value="<%=sid%>">
<textarea name="content" id="summernote" class="mtop-10"></textarea>

<button type="button" class="btn btn-primary" onclick="addItem()">추가</button>
</div>
<hr>
<table align=center>
<thead>
</thead>
<tbody id="ajaxTable">

</tbody>
</table>
</div>
  <script>
  $('#summernote').summernote({
	  tabsize: 2,
        height: 60,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['help']]
        ]
      });
    </script>
    <%@ include file="/footer.jsp" %>
</body>
</html>