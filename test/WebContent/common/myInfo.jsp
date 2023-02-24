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

sid="t3"; // 로그인 처리 시 필요없음.

userDTO uDTO = userDAO.info(sid);


String id = sid;
String name = uDTO.getName();
String mail = uDTO.getMail();
String password = uDTO.getPassword();
%>
<!-- 헤더 아래 표시 구역 -->
<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">푸드트럭에 오신걸 환영합니다</h1>
                   
                </div>
            </div>
 
 <!-- 유저 프로필 표시 구역 -->          
 <form action="edit.jsp" method="post">    
        
 	<div class="container-xxl  bg-dark d-flex align-items-center">
         <div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
             <h5 class="section-title ff-secondary text-start text-primary fw-normal">Welcome FoodTruck</h5>
             <h1 class="text-white mb-4">내 정보 보기</h1>
         
                 <div class="row g-3">
                     <div class="col-md-12">
                         <div class="form-floating">
                             <input type="text" class="form-control" id="id" name="id" value="<%=id %>" readonly>
                             <label for="id">Your Id</label>
                         </div>
                     </div>
                     
                     <div class="col-md-12">
                         <div class="form-floating">
                             <input type="text" class="form-control" id="name"name="name"  value="<%=name %>" readonly>
                             <label for="name">Your Name</label>
                         </div>
                     </div>
                     
                     <div class="col-md-12">
                         <div class="form-floating">
                             <input type="email" class="form-control" id="mail" name="mail" value="<%=mail %>" readonly>
                             <label for="mail">Your Email</label>
                         </div>
                     </div>
                     
                     <div class="col-md-12">
                         <div class="form-floating">
                             <input type="hidden" class="form-control" id="password" name="password" value="<%=password %>" readonly>
                         </div>
                     </div>
                    
                     
<!-- END OF 유저 프로필 표시 구역 -->    
                  
<!-- 버튼 구역 -->                     
                     
						  <button class="btn btn-primary w-90 py-2" type="submit" formaction="myReviewList.jsp?id=<%=id %>" >내 리뷰보기</button>
						  <button class="btn btn-primary w-90 py-2" type="submit" formaction="myOrderList.jsp" >내 주문내역</button>
						  <button class="btn btn-success w-90 py-2" type="submit">정보 수정</button>
						  <button class="btn btn-danger w-90 py-2"  type="submit" formaction="delete.jsp" >회원 탈퇴</button>
<!-- END OF 버튼 구역 -->                      
                     
                 </div>
        	 </div>
    	 </div>
    </form>
    
<%@ include file="/footer.jsp"%>
</body>
</html>