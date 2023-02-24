<!--  
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/2/16

버전 기록 : 0.1(시작 23/02/16) -데이터만 가져옴 디자인은 이후에 해야함.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/header.jsp" %>

<% String id =sid; 

%>

<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<title>내 리뷰 목록</title>
</head>
<body>

<div class="container-xxl py-5 bg-dark hero-header mb-5">
        <div class="container text-center my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">리뷰 목록</h1>
            <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">HOME</a></li>
                            <li class="breadcrumb-item"><a href="#">SETTING</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">리뷰 목록</li>
                        </ol>
                    </nav>
        </div>
    </div>


<!-- 주문 목록 -->
<div class="container">
<table class="table table-hover">
    
	<tbody id="ajaxTable">
    </tbody>
</table>
</div>

<!-- 함수 -->
<script>
function getOrderInfo(order) {
	  var modalBody = document.querySelector(".modal-body");
	  var modalTitle = document.querySelector(".modal-title");
	  modalTitle.innerHTML = 
		  				"주문 가게: " + order.fname
	  modalBody.innerHTML = 
	  					"" + order.rcontent + 
	  					"<div class='modal-footer'>" +
	  					"<span style='color:black;'>"+ (order.rupdatetime == null ? order.rregtime : order.rupdatetime )  +"</span>"+
	  					"<input type='button' class='btn btn-success' onclick=\"location.href='editMyReview.jsp?rno=" + order.rno + "'\" value='수정'/>" +
	  					"<input type='button' class='btn btn-danger'  onclick='deleteReview("+order.rno+")' value='삭제'/>";
	  
	}


	function listFunction() {
 		
		$.ajax({
 			type:'post',
 			url:'myReviewAll.jsp?id=<%=id%>',
 			success:function(data){
 				var myReviews = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < myReviews.length; i++){
 					
 					str += "<div class='testimonial-item bg-transparent border rounded p-4'>";
                    str += "<i class='fa fa-quote-left fa-2x text-primary mb-3'></i>";
                    str += "<p>" + myReviews[i].rcontent + "</p>";
                    str += "<div class='d-flex align-items-center'>";
                    str += "<div class='ps-3'>";
                    str += "<h5 class='mb-1'>" + myReviews[i].id + "</h5>";
                    for (var k = 0; k < myReviews[i].point; k++) {
                        str += "<i style='color:gold' class='far fas fa-star'></i> ";
                    }
					str += "<br><button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='getOrderInfo(" + JSON.stringify(myReviews[i]) + ")'>리뷰 상세보기</button>";
                    str += "</div>";
                    str += "</div>";
                    str += "</div>";
                    str += "<br>";
				    
 				} $("#ajaxTable").html(str);
 			},
 			 error : function(request, status, error) { // 결과 에러 콜백함수
 		        console.log(error)
 		    }
 		});
 	}
	
	function deleteReview(rno) {
		  $.ajax({
		    type: 'POST',
		    url: 'deleteMyReview.jsp',
		    data: {rno: rno},
		    success: function(response) {
		      $('#exampleModal').modal('hide');
		      location.reload(); // 페이지 새로고침
		    },
		    error: function(xhr, status, error) {
		    }
		  });
		}
	
	
	
	window.onload = function() {
		listFunction();
 	}

</script>

	
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 상세보기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
  "내용표시"
  	  </div>
      
    </div>
  </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>