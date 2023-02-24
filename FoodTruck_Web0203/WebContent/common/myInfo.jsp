<!-- 
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 	  0.1(시작 23/02/15) 
              0.5(기본작업 23/02/16) 
              1.0(1차 완성 23/02/22)
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.userDAO" %>
<%@ page import="jdbc.userDTO" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>


<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<title>프로필</title>
</head>
<body>


<%                   
request.setCharacterEncoding("utf-8");
sid = (String) session.getAttribute("id");

userDTO uDTO = userDAO.info(sid);


String id = sid;
String name = uDTO.getName();
String mail = uDTO.getMail();
String password = uDTO.getPassword();
%>
<!-- 헤더 아래 표시 구역 -->
<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">프로필</h1>
                  <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">HOME</a></li>
                            <li class="breadcrumb-item"><a href="#">SETTING</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">프로필</li>
                        </ol>
                    </nav>
                </div>
            </div>
 
 <!-- 유저 프로필 표시 구역 -->    
 <div class="container">      
 	<form action="edit.jsp" method="post">    
        
	 	<div class="mb-3 row">
		<div class="mb-3" style="margin-top:5%">
		  <label for="id" class="form-label">회원 아이디</label>
		  <input type="text" class="form-control" id="id" name="id" value="<%=id%>" readonly>
		</div>
		<div class="mb-3">
		  <label for="name" class="form-label">회원 이름</label>
		  <input type="text" class="form-control" id="name" name="name" value="<%=name%>"readonly >
		</div>
		<div class="mb-3">
		  <label for="mail" class="form-label">회원 메일</label>
		  <input type="email" class="form-control" id="mail" name="mail" value="<%=mail%>" readonly>
		</div>
		<div class="mb-3">
		  
		  <input type="hidden" class="form-control" id="password" name="password" value="<%=password%>" readonly>
		</div>
	 </div>
<!-- END OF 유저 프로필 표시 구역 -->    
                  
<!-- 버튼 구역 -->                     
     <div class="d-grid gap-2">             
	  <button class="btn btn-primary w-90 py-2" type="submit" formaction="myOrderList.jsp">주문 목록</button>
	  <button class="btn btn-primary w-90 py-2" type="submit" formaction="myReviewList.jsp">리뷰 목록</button>
	  <button class="btn btn-secondary w-90 py-2" type="submit">정보 수정</button>
	  <button class="btn btn-danger w-90 py-2"  type="submit" formaction="delete.jsp" >회원 탈퇴</button>
	</div>
<!-- END OF 버튼 구역 -->                      
                     
	 </form>	
 </div>
    
<%@ include file="/footer.jsp"%>
</body>
</html>