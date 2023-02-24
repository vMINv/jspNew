<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/20

버전  기록 : 0.1(시작 23/02/20) 
          0.5(기본작업 23/02/20) 
          0.7(추가 디자인 23/02/20)
          1.0(1차 완성 23/02/20)
          2.0(2차 완성 23/02/22)
 -->
<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>푸드 트럭 상세 보기</title>
</head>
<body>
<%@ include file="/header.jsp"%>
<% 
	String fno = request.getParameter("fno");

	ArrayList<foodDTO> foods = foodDAO.getDetail(fno);
	
	for (foodDTO food : foods) {
		
		
	
%>

			<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">푸드 트럭 상세 보기</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">설정</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">푸드 트럭 상세 보기</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Reservation Start -->
<div class="container">
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="row">상호명</th>
        <th scope="row">위치</th>
        <th scope="row">영업시간</th>
      </tr>
    </thead>
		<tbody id="ajaxTable1">
	    </tbody>
    <thead>
      <tr>
        <th scope="row">메뉴</th>
        <th scope="row">가격</th>
      </tr>
    </thead>
	<tbody id="ajaxTable2">
    </tbody>
</table>
</div>

<input id="fno" type="hidden" value="<%=fno %>">
<div class="container">
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="form-control btn btn-danger" onclick="location.href='foodOneDel.jsp?fno='+<%=fno %>">승인 거절</button>
			</div>
			<div class="col">
				<button type="submit" class="form-control btn btn-primary" onclick="location.href='foodOneAdd.jsp?fno='+<%=fno %>">승인 허락</button>
			</div>
		</div>
	</div>
</div>
        <!-- Reservation Start -->
<script>
	function foodDetail() {
 		
 		$.ajax({
 			type:'post',
 			url:'foodOne.jsp?fno=' + '<%=fno%>',
 			success:function(data){
 				var foods = JSON.parse(data.trim());
 				var str = "";
 				
 				for(var i = 0; i < foods.length; i++){
 					var time = foods[i].ftime.split("&");
 					
 					str += "<tr><td>" + foods[i].fname + "</td>";
 					str += "<td>" + foods[i].flocation + "</td>";
					str += "<td>" + time[0] + " ~ " + time[1] + "</td></tr>";
 				} 
 				$("#ajaxTable1").html(str);
 				
 				var infos = JSON.parse(data.trim());
 				var str = "";
 				
 				for(var i = 0; i < foods.length; i++){
 					var fmenu = foods[i].fmenu.replace("[","").replace("]","");
 					var fprice = foods[i].fprice.replace("[","").replace("]","");
 					var menu = fmenu.split(",");
 					var price = fprice.split(",");
 					var keys1 = Object.keys(menu);
 					for (var i=0; i<keys1.length; i++) {
 				    	var key = keys1[i];
 						str += "<tr><td>" + menu[key] + "</td>";
 						str += "<td>" + price[key] + "</td></tr>";
 				    }
 				}
 				$("#ajaxTable2").html(str);
 			}
 		});
 	}
	
	window.onload = function() {
		foodDetail();
 	}
	
</script>
<%
	}
%>  

<%@ include file="/footer.jsp"%>        
</body>

</html>