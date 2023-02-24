<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/21

버전  기록 : 0.1(시작 23/02/21) 
          0.5(기본작업 23/02/21) 
          1.0(1차 완성 23/02/21)
 -->

<%@page import="util.FileUtil"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드 트럭 승인 성공</title>
</head>
<body>
<%@ include file = "/header.jsp" %> 
<%
	request.setCharacterEncoding("UTF-8"); //한글 처리
	

	String fno = request.getParameter("fno");
		
	
 	if((foodDAO.insertadmin(fno) == 1) ? true : false) {
		%>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">푸드 트럭 승인 성공</h1>
		        <button type="button" onclick="location.href='foodProcess.jsp'" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        푸드 트럭 승인에 성공했습니다. <br>
		        푸드 트럭 승인 관리 페이지로 이동합니다.
		      </div>
		      <div class="modal-footer">
			        <button onclick="location.href='foodProcess.jsp'" class="btn btn-primary">메인으로 이동</button>

		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal1").modal("show");
			});
		</script>	
	<% 		
		
 	} else {
			%>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">푸드 트럭 승인 실패</h1>
			        <button type="button" onclick="location.href='foodProcess.jsp'" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
				        푸드 트럭 승인에 실패했습니다. <br> 
				        다시 시도해 주세요.
			      </div>
			      <div class="modal-footer">
			        <button onclick="location.href='foodProcess.jsp'" class="btn btn-primary">이전 페이지로 이동</button>

			      </div>
			    </div>
			  </div>
			</div>

			<script>
				$(function() {
					$("#exampleModal2").modal("show");
				});
			</script>	
			
	<% 		
 	}

	%>

<%@ include file = "/footer.jsp" %> 
</body>
</html>