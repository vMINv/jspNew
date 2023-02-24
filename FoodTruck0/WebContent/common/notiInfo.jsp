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
	<title>상세 공지</title>
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
		 <h3 class="text-center fw-bold">공지사항</h3>
		 <hr>
		 <div class="row mb-3">
			 <strong  class="col-sm-2 col-form-label">
				 <label for="title">제목</label>
			 </strong>
			 <div class="col-sm-10" id="title"><%=noti.getNtitle()%></div>
		 </div>
		 <div class="row mb-3">
			 <strong  class="col-sm-2 col-form-label">
				 <label for="content">공지 내용</label>
			 </strong>
			 <div class="col-sm-10" id="content"><%= noti.getNcontent() %></div>
		 </div>
		 <hr>
		 <button type="button" class="btn btn-primary" onclick="location.href='javascript:history.back();'">뒤로가기</button>
	 </div>

	 <%@ include file="/footer.jsp" %>
 </body>
</html>
      