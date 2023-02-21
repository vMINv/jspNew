<!--  
최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
최초작성일 : 2023/2/20

버전 기록 : 0.1(시작 23/02/20)
		  0.1(수정 23/02/21)
		  0.1(종료 23/02/21)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<% 
	sid = (String) session.getAttribute("id");
%>
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
<input type='submit' class='form-control btn btn-outline-secondary' value='마커 감추기' onclick="hideMarkers()">
<br><br>
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">사진</th>
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
					
					str += "<tr><td>" + results[i].fphoto + "</td>";
					str += "<td><a href='oneStoreInfo.jsp?fno=" +results[i].fno+ "'>" + results[i].fname + "</a></td>";
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
</body>
</html>