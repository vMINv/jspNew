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
<%@page import="java.util.ArrayList"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>푸드 트럭 등록</title>
</head>
<body>
<%@ include file="/header.jsp"%>
    <script>
	 	function addFood(fno) {
	 		$.ajax({
	 			type:"post",
	 			url: "foodAdd.jsp",
	 			data : {fno:fno
	 				   
	 			},
	 			dataType:"text",
	 			
	 			success:function(data) {
					searchFunction();
	 			}
	 		});
	 	}
 		
	 	function delFood(fno) {
	 		$.ajax({
	 			type:"post",
	 			url: "foodDel.jsp",
	 			data : {fno:fno
	 				
	 			},
	 			dataType:"text",
	 			
	 			success:function(data) {
	 				searchFunction();
	 			}
	 		});
	 	}
	 	
	 	function searchFunction(){
	 		$.ajax({
				type : 'post',
				url  : '../admin/foodListAll.jsp',
				success : function(data){
					var foods = JSON.parse(data.trim());
					
					var str = "";
					for(var i = 0; i < foods.length; i++) {
						if ("<%=sid %>" == foods[i].id) {
						str += "<tr><td>" + foods[i].fno + "&nbsp;</td>";
	 					str += "<td><a href='../common/foodUpdate.jsp?fno="+ foods[i].fno +"'><small>(" + foods[i].fname + ")</small></a></td>";		
	 					str += "<td><small>&nbsp;(" + foods[i].flocation + ")</small></td></tr>";		
	 					str += "<tr><td colspan=3 height=40><hr></td></tr>";
						}
					} $("#ajaxTable").html(str);
					
				}
			});	
	 	}
	 	
	 	window.onload = function(){
			searchFunction();
		}
 	</script>


			<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">푸드 트럭 목록</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">설정</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">푸드 트럭 목록</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Reservation Start -->
	<div class="container shadow mx-auto p-5 w-75">        
		<center><h2>푸드 트럭 목록</h2></center>
		<div>
			<div class="input-group justify-content-center" >
			
			</div>
			<hr>
			<table align="center" width="400">
				<thead>
				</thead>
				<tbody id="ajaxTable">
				
				</tbody>	
			</table>
		</div>
	</div>
	
        <!-- Reservation Start END-->	

<%@ include file="/footer.jsp"%>        
</body>

</html>