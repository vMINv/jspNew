<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>리뷰</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<% 
	String fno = request.getParameter("fno");
%>
			<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">리뷰</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Testimonial</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Testimonial Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="text-center">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Review</h5>
                    <h1 class="mb-5">Our Clients Say!!!</h1>
                </div>
                <div id="review" class="owl-carousel testimonial-carousel">
                    
                </div>
            </div>
        </div>
        <!-- Testimonial End -->
        
        
<!-- 리뷰등록 -->
<div class="container">
	<input id="id" type="hidden" value="<%=sid %>">
	<input id="fno" type="hidden" value="<%=fno %>">
	<div class="mb-3">
		<div></div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="1">
		  <label>1점</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="2">
		  <label>2점</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="3">
		  <label>3점</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="4">
		  <label>4점</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="5">
		  <label>5점</label>
		</div>
	</div>
	<div class="mb-3">
	<input type="text" class="form-control" name="rcontent" id="rcontent" required placeholder="내용"> 
	</div>
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="btn btn-primary w-100 py-3" onclick="addReview()">리뷰 등록하기</button>
			</div>
			<div class="col">
				<button type="submit" class="btn btn-primary w-100 py-3" onclick="location.href='searchFoodtruck.jsp'">취소하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 함수 -->
<script>
	function addReview() {
		var rates = document.getElementsByName('point');
		var rate_value;
		for(var i = 0; i < rates.length; i++){
		    if(rates[i].checked){
		        rate_value = rates[i].value;
		    }
		}
		$.ajax({
			type:"post",
			url: "reviewAdd.jsp",
			data : {fno:document.getElementById('fno').value,
					id:document.getElementById('id').value,
				    point:rate_value,
				    rcontent:document.getElementById('rcontent').value
				},
      
			dataType:"text",
			
			success:function(data) {
				var rcontent = document.getElementById('rcontent');
				rcontent.value = "";
				reviewListFunction();
			}
		});
	}

	function reviewListFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'reviewAll.jsp?fno='+document.getElementById('fno').value,
 			success:function(data){
 				var reviews = JSON.parse(data.trim());
 				var str = "";
 				for(var i = 0; i < reviews.length; i++){
 					
 					str += "<div class='testimonial-item bg-transparent border rounded p-4'>";
                    str += "<i class='fa fa-quote-left fa-2x text-primary mb-3'></i>";
                    str += "<p>" + reviews[i].rcontent + "</p>";
                    str += "<div class='d-flex align-items-center'>";
                    str += "<div class='ps-3'>";
                    str += "<h5 class='mb-1'>" + reviews[i].id + "</h5>";
                    for (var k = 0; k < reviews[i].point; k++) {
                        str += "<i style='color:gold' class='far fas fa-star'></i> ";
                    }
                    str += "</div>";
                    str += "</div>";
                    str += "</div>";
                    str += "<br>";
 				    
 				    
 				} $("#review").html(str);
 			}
 		});
 	}
	
	window.onload = function() {
		reviewListFunction();
 	}
	
</script>
<%@ include file="../footer.jsp"%>        
</body>

</html>