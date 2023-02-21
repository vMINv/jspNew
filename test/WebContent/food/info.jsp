<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>제보하기</title>
</head>
<body>
<%@ include file="../header.jsp"%>
			<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">제보</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Service</li>
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
                <div id="info" class="row g-4">
                </div>
            </div>
        </div>
        <!-- Service End -->
        
        
<!-- 제보하기 -->
<div class="container">
	<input id="id" type="hidden" value="<%=sid %>">
	<div class="mb-3">
		<input type="text" class="form-control" name="ilocation" id="ilocation" placeholder="위치" required> 
	</div>
	<div class="mb-3">
		<input type="text" class="form-control" name="icontent" id="icontent" placeholder="내용" required> 
	</div>
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="btn btn-primary w-100 py-3" onclick="addInfo()">제보하기</button>
			</div>
			<div class="col">
				<button type="submit" class="btn btn-primary w-100 py-3" onclick="location.href='searchFoodtruck.jsp'">취소하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 함수 -->
<script>
	function addInfo() {
		
		$.ajax({
			type:"post",
			url: "infoAdd.jsp",
			data : {id:document.getElementById('id').value,
					ilocation:document.getElementById('ilocation').value,
					icontent:document.getElementById('icontent').value
				},
      
			dataType:"text",
			
			success:function(data) {
				var ilocation = document.getElementById('ilocation');
				var icontent = document.getElementById('icontent');
				ilocation.value = "";
				icontent.value = "";
				
				infoListFunction();
			}
		});
	}
	
	function infoListFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'infoAll.jsp',
 			success:function(data){
 				var infos = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < infos.length; i++){
 					
 					str += "<div class='col-lg-3 col-sm-6 wow fadeInUp' data-wow-delay='0.1s'>";
 					str += "<div class='service-item rounded pt-3'>";
 					str += "<a href='infoEdit.jsp?ino="+infos[i].ino+"&ilocation="+infos[i].ilocation+"&icontent="+infos[i].icontent+"'><div class='p-4'>";
 					str += "<i class='fa fa-3x fa-utensils text-primary mb-4'></i>";
 					str += "<h5>" + infos[i].ilocation + "</h5>";
					str += "<p>" + infos[i].icontent + "</p>";
					str += "<small>" + infos[i].iregtime + "</small>";
 					str += "</div></a>";
 					str += "</div>";
 					str += "</div>";
 				    
 				} $("#info").html(str);
 			}
 		});
 	}
	
	window.onload = function() {
		infoListFunction();
 	}
	
</script>
<%@ include file="../footer.jsp"%>        
</body>

</html>