<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
          0.5(기본작업 23/02/16) 
          1.0(1차 완성 23/02/20)
 -->
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<title>푸드 트럭 정보 수정</title>
</head>
<body>
<%@ include file = "/header.jsp" %> 
<%
	request.setCharacterEncoding("UTF-8"); //한글 처리
	
	byte[] fbu = null;			//파일 자체
	
	String fname = "";
	String fphoto = "";
	String flocation = "";	
	String ftime = "";	
	String time1 = "";
	String time2 = "";
	String time3 = "";
	String time4 = "";
	String fmenu = "";	
	String fprice = ""; 
	String flat = "";
	String flon = "";
	String fno = ""; 
	
	String path = application.getRealPath(java.io.File.separator);
	MultipartRequest multipartRequest = new MultipartRequest(request,path,1024*1024*10,"UTF-8",new DefaultFileRenamePolicy());
	
	fname 	  = multipartRequest.getParameter("fname");
	flocation = multipartRequest.getParameter("flocation");
	time1 	  = multipartRequest.getParameter("time1");
	time2 	  = multipartRequest.getParameter("time2");
	time3  	  = multipartRequest.getParameter("time3");
	time4 	  = multipartRequest.getParameter("time4");
	fmenu 	  = Arrays.toString(multipartRequest.getParameterValues("fmenu"));
	fprice 	  = Arrays.toString(multipartRequest.getParameterValues("fprice"));
	flat 	  = multipartRequest.getParameter("flat");
	flon 	  = multipartRequest.getParameter("flon");
	fno 	  = multipartRequest.getParameter("fno");
	fphoto    = multipartRequest.getOriginalFileName("fphoto");
	
	ftime = time1 + time2 + "&" + time3 + time4;
	
 	if((foodDAO.updatefood(fname, fphoto, flocation, ftime, fmenu, fprice, flat, flon, fno) == 1) ? true : false) {
		%>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">푸드 트럭 수정 성공</h1>
		        <button type="button" onclick="location.href='/main.jsp'" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        푸드 트럭 정보 수정에 성공했습니다. <br>
		    메인 페이지로 이동합니다.
		      </div>
		      <div class="modal-footer">
			        <button onclick="location.href='/main.jsp'" class="btn btn-primary">메인으로 이동</button>

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
			        <h1 class="modal-title fs-5" id="exampleModalLabel">푸드 트럭 수정 실패</h1>
			        <button type="button" onclick="location.href='foodUpdate.jsp'" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
				        푸드 트럭 정보 수정에 실패했습니다. <br> 
				        다시 시도해 주세요.
			      </div>
			      <div class="modal-footer">
			        <button onclick="location.href='foodUpdate.jsp'" class="btn btn-primary">이전 페이지로 이동</button>

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