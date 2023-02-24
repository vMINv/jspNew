<%@ page import="jdbc.notiDAO" %>
<%@ page import="jdbc.notiDTO" %>
<!-- 
	최초작성자 : 김형준(bright32123@mail.com)
	최초작성일 : 2023/02/15
	버전 기록   : 0.1(시작 23/02/15) 
	
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>공지 수정/삭제</title>
 </head>
 <body>
    <%@ include file="/header.jsp" %> 
	 <%
		 int nno = Integer.parseInt(request.getParameter("nno"));
		 notiDTO noti = new notiDTO();
		 noti = notiDAO.info(nno);
	 %>
	 <div class="container-xxl py-5 bg-dark hero-header mb-5">
		 <div class="container text-center my-5 pt-5 pb-4">
			 <h1 class="display-3 text-white mb-3 animated slideInDown">공지사항</h1>
			 <nav aria-label="breadcrumb">
				 <ol class="breadcrumb justify-content-center text-uppercase">
					 <li class="breadcrumb-item"><a href="/main.jsp">Home</a></li>
					 <li class="breadcrumb-item"><a href="#">Community</a></li>
					 <li class="breadcrumb-item text-white active" aria-current="page">공지사항</li>
				 </ol>
			 </nav>
		 </div>
	 </div>
	 </div>
	 <div class="container-xxl py-5 px-5 wow fadeInUp" data-wow-delay="0.1s">
		 <div class="container">
			 <form id="requestForm" action="notiEdit.jsp" method="post">
				 <h3 class="text-center fw-bold">공지사항 수정/삭제</h3>
				 <hr>
				 <div class="row mb-3">
					 <strong  class="col-sm-2 col-form-label">
						 <label for="title">제목</label>
					 </strong>
					 <div class="col-sm-10">
						 <input type="text" id="title" name="ntitle" class="form-control" value="<%=noti.getNtitle()%>">
					 </div>
				 </div>
				 <div class="row mb-3">
					 <strong  class="col-sm-2 col-form-label">
						 <label for="summernote">공지 내용</label>
					 </strong>
					 <div class="col-sm-10">
						 <textarea id="summernote" name="ncontent" class="form-control"><%= noti.getNcontent() %></textarea>
					 </div>
				 </div>
				 <hr>
				 <div class="d-grid gap-2">
					 <input type="hidden" name="nno" value="<%=nno%>">
					 <button type="submit" class="btn btn-primary">등록</button>
					 <button type="button" class="btn btn-primary" onclick="location.href='notidelete.jsp?nno=<%=nno%>'"/>삭제</button>
					 <button type="button" class="btn btn-primary" onclick="location.href='javascript:history.back();'">취소</button>
				 </div>
			 </form>
		 </div>
	 </div>

	 <%@ include file="/footer.jsp" %>

	 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

	 <script>

		 $('#summernote').summernote({
			 height: 300,
			 maximumImageFileSize: 5* 1024 *1024,
			 toolbar: [
				 ['style', ['style']],
				 ['font', ['bold', 'underline', 'clear']],
				 ['color', ['color']],
				 ['para', ['ul', 'ol', 'paragraph']],
				 ['table', ['table']],
				 ['insert', ['link', 'picture', 'video']],
				 ['view', ['fullscreen', 'codeview', 'help']]
			 ]
		 });
	 </script>
 </body>
</html>
      