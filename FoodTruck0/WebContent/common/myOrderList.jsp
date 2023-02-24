<!--  
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/2/16

버전 기록 : 0.1(시작 23/02/16) -데이터만 가져옴 디자인은 이후에 해야함.
		0.5(기초 디자인 작업 23/02/20)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.orderDAO" %> 
<%@ include file="/header.jsp" %>   
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<%request.setCharacterEncoding("utf-8"); %>
<% orderDAO oDAO = new orderDAO();
sid = (String) session.getAttribute("id");
 String id = sid; %>
<!-- 함수 -->


<title>내 주문 목록</title>
</head>
<body>

	<div class="container-xxl py-5 bg-dark hero-header mb-5">
        <div class="container text-center my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">주문 목록</h1>
           <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">HOME</a></li>
                            <li class="breadcrumb-item"><a href="#">SETTING</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">주문 목록</li>
                        </ol>
                    </nav>
        </div>
    </div>
<!-- 주문 목록 테이블  -->
<div class="container">
<table class="table table-hover">
    
	<tbody id="ajaxTable">
    </tbody>
</table>
</div>
			
<script>

$.ajax({
    type: 'post',
    url: 'myOrderAll.jsp?id=<%=id%>',
    success: function (data) {
        var orders = JSON.parse(data.trim());
        
        var str = "";

        for (var i = 0; i < orders.length; i++) {
            var total = orders[i].total; 
            var formattedTotal = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 숫자를 3자리마다 쉼표를 추가해 포맷팅

            str += "<tr>";
            str += "<td class='testimonial-item bg-transparent border rounded p-4'>";
            str += "<strong style='font:bold;'><i class='fas fa-truck'> </i> " + orders[i].fname + "</strong>";
            str += "<br>";
            str += "<div class='mb-1 text-muted'>";
            str += "<span style='color:white; background:black; float:right;' class='badge rounded-pill'>"+(orders[i].opro == 0 ? "주문 중" : "주문 완료")+"</span>" ;
            str += "<br>";
            str += "<ul>";

            var menuItems = JSON.parse(orders[i].menu);
            for (var j = 0; j < menuItems.length; j++) {
                str += "<li style='list-style: none;'>" + menuItems[j].menu + " (" + menuItems[j].cnt + "개)" + "</li>";
            }

            str += "합계:" + formattedTotal + "원";
            str += (orders[i].opro == 0 ? "<button type='button' style='float:right; background:red;' class='badge rounded-pill' data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='delOrder(" + orders[i].ono + ")'>주문 취소</button>" : "") ;
            str += "</ul>";
            str += "</div>";
            str += "</td>";
            str += "</tr>";
        }

        $("#ajaxTable").html(str);
    },
    error: function (request, status, error) {
        // 결과 에러 콜백함수
        console.log(error);
    }
});



	
	window.onload = function() {
		listFunction();
 	}
	
	
	function delOrder(ono) {
		  $('#exampleModal').show();
		  var modalFooter = $('#modal-footer');
		  modalFooter.html("<button class='btn btn-secondary' onclick=\"location.href='deleteMyOrder.jsp?ono=" + ono + "'\">삭제</button>");
		}

	
	
	
</script>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">주문 취소</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
  <p>정말 주문을 취소하시겠습니까?</p>
  
  	  </div>
  	  <div class="modal-footer" id="modal-footer">
  	  
  	  </div>
      
    </div>
  </div>
</div>

<%@ include file="/footer.jsp" %>
</body>

</html>