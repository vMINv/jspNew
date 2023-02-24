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
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<title>내 리뷰 목록</title>
</head>
<body>



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
	  modalBody.innerHTML = "주문가게명: " + order.fname + "<br>별점: " + order.point + 
	  					"<br>주문확인: " + order.opro + "<br>리뷰 내용: " + order.rcontent + 
	  					"<br>합계: " + order.total +
	  					"<div class='modal-footer'>" +
	  					"<input type='button' class='btn btn-success' onclick='editReview("+order.rno +")' value='수정'/>" +
	  					"<input type='button' class='btn btn-danger'  onclick='deleteReview("+order.rno+")' value='삭제'/>";
	  
	}


	function listFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'myReviewAll.jsp',
 			success:function(data){
 				var myReviews = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < myReviews.length; i++){
 					
 					str += "<tr><td><div><img src='../img/bookmark-heart-fill.svg' style='width:70px; height:40px; float:right;' class='rounded'>"; // 음식점 이미지
					str += "<strong>"+myReviews[i].fname+"</strong>"; //음식점 이름
					str += "<br>주문한 메뉴:" +myReviews[i].menu+""; 
					str += "<br>작성일자:" +(myReviews[i].rupdatetime == null ? myReviews[i].rregtime : myReviews[i].rupdatetime) ; 
					str += "<br>합계:" +myReviews[i].total+""; //total.
					str += "<br><button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='getOrderInfo(" + JSON.stringify(myReviews[i]) + ")'>리뷰 상세보기</button>";
				//	str += (orders[i].opro == 0 ? "<button style='float:right' class='badge text-bg-danger' onclick='delOrder("+orders[i].ono+")'>주문 취소</button></span>" : " ");
				    str += "</div><td></tr></div>";
				    
 				} $("#ajaxTable").html(str);
 			},
 			 error : function(request, status, error) { // 결과 에러 콜백함수
 		        console.log(error)
 		    }
 		});
 	}
	
	function deleteReview(rno) {
	  $.ajax({
	    type: 'get',
	    url: 'deleteMyReview.jsp',
	    data: {rno: rno},
	    success: function(response) {
	    	 $('#exampleModal').modal('hide');
	    	 listFunction();
	    },
	    error: function(xhr, status, error) {
	    }
	  });
	}
	function editReview(rno) {
		  $.ajax({
		    type: 'POST',
		    url: 'editMyReview.jsp',
		    data: { rno: rno },
		    success: function(response) {
		      window.location.href = 'editMyReview.jsp?rno=' + rno;
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

</body>
</html>