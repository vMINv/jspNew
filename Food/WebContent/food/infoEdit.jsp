<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>제보하기</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	String ino = request.getParameter("ino");
	String ilocation = request.getParameter("ilocation");
	String icontent = request.getParameter("icontent");

%>
<% sid = (String) session.getAttribute("id");
if (sid == null){
%>		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-bs-backdrop="static" data-bs-keyboard="false" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 전용 메뉴</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='/user/login.jsp'"></button>
		      </div>
		      <div class="modal-body">
		        로그인을 한 회원만 사용 가능한 메뉴입니다.<br>
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='/user/login.jsp'" class="btn btn-primary">로그인 이동</button>

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
	session.setAttribute("id", sid);
}%>
			<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">제보</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Report</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">제보</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Service Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Your report</h5>
                    <h1 class="mb-5">Tell Us Your Reports</h1>
                </div>
            </div>
        </div>
        <!-- Service End -->
        
        
<!-- 제보하기 -->
<div class="container">
	<input id="id" type="hidden" value="<%=sid %>">
	<input id="ino" type="hidden" value="<%=ino %>">
	<div class="mb-3">
		<input type="text" class="form-control" name="ilocation" id="ilocation" required value="<%=ilocation%>">
	</div>
	<div class="mb-3">
		<input type="text" class="form-control" name="icontent" id="icontent" required value="<%=icontent%>">
	</div>
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="btn btn-primary w-100 py-3" onclick="editInfo()">제보 수정하기</button>
			</div>
			<div class="col">
				<button type="button" class="btn btn-primary w-100 py-3" onclick="delInfo(<%=ino %>)">제보 삭제하기</button>
			</div>
			<div class="col">
				<button type="submit" class="btn btn-primary w-100 py-3" onclick="location.href='info.jsp'">취소하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 함수 -->
<script>
	function editInfo() {
		
		$.ajax({
			type:"post",
			url: "infoEditProc.jsp",
			data : {ino:document.getElementById('ino').value,
					ilocation:document.getElementById('ilocation').value,
					icontent:document.getElementById('icontent').value
				},
	  
			dataType:"text",
			
			success:function(data) {
				window.location.href = 'info.jsp';
			}
		});
	}
	
	function delInfo(ino) {
 		$.ajax({
 			type:"post",
 			url: "infoDel.jsp",
 			data : {ino:ino},
 			dataType:"text",
 			
 			success:function(data) {
 				window.location.href = 'info.jsp';
 			}
 		});
 	}
	
</script>
<%@ include file="../footer.jsp"%>        
</body>

</html>