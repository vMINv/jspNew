<!-- 
최초작성자 : 강남욱 (redsky6301@naver.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) 
              0.5(기본작업 23/02/17) 
              1.0(작업 23/02/20)
              1.5(작업 23/02/21)
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>푸드트럭 맵 & 리스트</title>
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%@ include file ="/header.jsp" %>	
			<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">푸드트럭 메인</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                  
                        </ol>
                    </nav>
                </div>
            </div>
       
        <!— Navbar & Hero End —>
<%
	sid = (String) session.getAttribute("id");
	if(sid == null){
		%>
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 전용 메뉴</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		  로그인을 한 회원만 사용가능한 메뉴입니다.<br> 
		  로그인 화면으로 이동합니다.
		      </div>
		      <div class="modal-footer">
		      <button onclick="location.href='/user/login.jsp'" class="btn btn-secondary" data-bs-dismiss="modal">로그인 화면으로</button>
		      
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal").modal("show");
			});
		</script>
		
	<%	}else{
	session.setAttribute("id", sid);
	}
	%>
	
	
		 


	<div id="map" style="width:100%;height:400px;"></div>
	<div id="foodlist"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfa175e0609e89c7b2c0cd5f44c89a2f"></script>
	
	<script> 
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.558043, 126.919002),
			level: 7  // 지도의 크기를 설정 예) 10 이 서울 전체, 제주 전체
		};

		var map = new kakao.maps.Map(container, options);

	
		
	
		
		
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position, content) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition =  new kakao.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
		        	
		         
		            
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		            
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667)
		   		 message = 'geolocation을 사용할수 없어요..'
		
		   		 
		    displayMarker(locPosition, message);
		}
		
		
	    
		
		
		
		function displayMarker(locPosition, message) {		
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    		 
		    
		    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
		    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition); 

			
			   
			
	
			}
		
		
		
	function mapmaker(flat, flon, fname) {
		

		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(flat, flon); 

		
		
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		    
		    
		});
		
		
		
	    var infowindow = new kakao.maps.InfoWindow({
	        content: fname// 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
	    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    (function(marker, infowindow) {
	
	        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
	        kakao.maps.event.addListener(marker, 'mouseover', function() {
	          
	        	infowindow.open(map, marker);
	            
	        });
	
	        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
	        kakao.maps.event.addListener(marker, 'mouseout', function() {
	            infowindow.close();
	        });
	    })(marker, infowindow);
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
	}
		
	
	function searchFunction() {

 		$.ajax({
 			type:'post',
 			url:'foodtruckmainloc.jsp',
 			success:function(data){
 				console.log(data);
 				var loc = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < loc.length; i++){
 			
 					if(loc[i].fphoto != null && loc[i].fphoto != ""){
 						str += "<tr onclick='detailInfo("+loc[i].fno+")'><td><div><img src='../img/"+ loc[i].fphoto +"'></div></td>";
 					}
 					str += "<td>&nbsp;&nbsp;" + loc[i].fname + "&nbsp; : &nbsp;</td>";	
 					str += "<td>" + loc[i].flocation + "</td></tr>";
 				
 					

 					
 					mapmaker(loc[i].flat, loc[i].flon, loc[i].fname);
 				} 
 				
 				$("#foodlist").html(str);
 			}
 		});	
 	}
 	
 	window.onload = function() {
 		searchFunction();
 	}	
 	
 	function detailInfo(fno){
 		$("#fno").val(fno);
 		$("#infoButton").click();
 	}
 	</script>	
		
		
		

<form action="oneStoreInfo.jsp" method="POST">
<input id="fno" name="fno" type="hidden" value="">
<button id="infoButton" style="display:none" type="submit"></button>
</form>	
	
 <form action="/food/info.jsp">
 <div class="text-center">
  <button type="submit" class="btn btn-secondary btn-lg">제보하기</button>
  </div>
  </form>
  
  <%@include file="/footer.jsp" %>
</body>
</html>