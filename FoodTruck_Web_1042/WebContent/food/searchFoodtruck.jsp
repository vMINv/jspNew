<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>검색</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<% sid = (String) session.getAttribute("id");
if (sid == null){
%>		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" >
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
                    <h1 class="display-3 text-white mb-3 animated slideInDown">검색</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Search</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">검색</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        
        
<!-- 검색창 -->
<div class="container">
	<br>
	<input class="form-control me-2" type="search" placeholder="가게명 혹은 위치를 검색해주세요" id="search" name="search" onkeyup="searchFunction()">
</div>

<!-- 지도 -->
<br>
<div class="container">
<div id="map" style="width:100%;height:350px;"></div>
</div>

<!-- 가게목록 띄우기 -->
<br>
<div class="container">
<button class="btn btn-primary w-100 py-3" type="submit" onclick="hideMarkers()">마커 감추기</button>
<br><br>
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">가게명</th>
        <th scope="col">위치</th>
      </tr>
    </thead>
	<tbody id="ajaxTable">
    </tbody>
</table>
</div>

<!-- 함수 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fc7abe9b9479ffa297474094a4964dcf"></script>
<script>
	var container = document.getElementById('map');
	
	var options = {
		center: new kakao.maps.LatLng(37.556449, 126.923224),
		level: 12
	};
	
	var map = new kakao.maps.Map(container, options);
	
	//지도의 형태를 바꾸는 컨트롤러 올리기 
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	//지도의 크기를 확대 / 축소하는 컨트롤러 올리기 
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
	var markers = [];
	var infowindows = [];
	
	function searchFunction() {
		$.ajax({
			type:"post",
			url: "searchProc.jsp",
			data : {search:document.getElementById('search').value},
			dataType:"text",
			success:function(data) {
				var results = JSON.parse(data.trim());
				var str = "";

				for(var i = 0; i < results.length; i++){
					str += "<tr><td><a href='oneStoreInfo.jsp?fno=" +results[i].fno+ "'>" + results[i].fname + "</a></td>";
					str += "<td>" + results[i].flocation + "</td></tr>";

					//마커
					//마커 위치
					var	positions = 
						{
							title:results[i].fname,
							latlng: new kakao.maps.LatLng(parseFloat(results[i].flat), parseFloat(results[i].flon))
						};
					
					//마커 생성
					var marker = new kakao.maps.Marker({
						map: map,
						position:positions.latlng,
						title:positions.title
					});
					
					// 생성된 마커를 배열에 추가합니다
				    markers.push(marker);
					
					//정보창 올리기 
					//창에 나타낼 정보 작성
					var iwContent = '<p>'+results[i].fname+'</p>'
						iwPosition = new kakao.maps.LatLng(parseFloat(results[i].flat), parseFloat(results[i].flon));
					
					//창 생성
					var infowindow = new kakao.maps.InfoWindow({
						position: iwPosition,
						content: iwContent
					});
					
					infowindows.push(infowindow);
					 
					//정보창 지도에 올리기
					infowindow.open(map, marker);
				}
					
				$("#ajaxTable").html(str);
			}
		});
	}
	
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	        infowindows[i].setMap(map);
	    }            
	}
	
	function hideMarkers() {
	    setMarkers(null);    
	}
	
</script>
<%@ include file="../footer.jsp"%>        
</body>

</html>