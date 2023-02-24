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
<% orderDAO oDAO = new orderDAO(); %>
<% String id =request.getParameter("id"); %>
<!-- 함수 -->


<title>내 주문 목록</title>
</head>
<body>

	<div class="container-xxl py-5 bg-dark hero-header mb-5">
        <div class="container text-center my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">주문 목록</h1>
           
        </div>
    </div>
<!-- 주문 목록 테이블  -->
	<div class="container">
	
	<table class="table table-hover">
	    
		<tbody id="ajaxTable" >
		
	    </tbody>
	    
	</table>
	</div>
			
<script>

function listFunction() {
    $.ajax({
        type: 'post',
        url: 'myOrderAll.jsp?id=<%=id%>',
        success: function (data) {
            var orders = JSON.parse(data.trim());
            var str = "";

            for (var i = 0; i < orders.length; i++) {
                str += "<tr>";
                str += "<td>";
                str += "<img src='../img/bookmark-heart-fill.svg' style='width:70px; height:40px; float:right;' class='rounded'>";
                str += "<strong>" + orders[i].fname + "</strong>";
                str += "<br>";
                str += "<div class='mb-1 text-muted'>";
                str += "주문확인: " + (orders[i].opro == 0 ? "주문 중" : "주문 완료");
                str += "<br>";
                str += "주문한 메뉴:" + orders[i].menu;
                str += "<br>";
                str += "합계:" + orders[i].total;
                str += (orders[i].opro == 0 ? "<button style='float:right; background:red;' class='badge rounded-pill' onclick='delOrder(" + orders[i].ono + ")'>주문 취소</button></span>" : "");
                str += "</div>";
                str += "<td>";
                str += "</tr>";
            }

            $("#ajaxTable").html(str);
        },
        error: function (request, status, error) {
            // 결과 에러 콜백함수
            console.log(error);
        }
    });
}

	
	window.onload = function() {
		listFunction();
 	}
	
	
	function delOrder(ono) {
		if (confirm("정말 주문을 취소하시겠습니까?")) {
		    location.href = "deleteMyOrder.jsp?ono=" + ono;
		  }
	}
	
</script>

<%@ include file="/footer.jsp" %>
</body>

</html>