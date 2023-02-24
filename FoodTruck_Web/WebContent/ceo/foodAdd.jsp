<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) 
          0.5(기본작업 23/02/16) 
          0.7(추가 디자인 23/02/16)
          1.0(1차 완성 23/02/20)
          2.0(2차 완성 23/02/22)
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>푸드 트럭 등록</title>
</head>
<body>
<%@ include file="/header.jsp"%>
			<div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">푸드 트럭 등록</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">설정</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">푸드 트럭 등록</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Reservation Start -->
<div class="container"> 
  <main>        
      <div class="row g-5 justify-content-center">
      <div class="col-md-7 col-lg-8">
        <form class="needs-validation" action="foodAddCheckTest.jsp" method="post" enctype="multipart/form-data">
          <div class="row g-3">
            <div class="col-12">
              <label class="form-label">가게명</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="fname" required>
              </div>
            </div>
            
            <div class="col-12">
              <label class="form-label">사진</label>
              <div class="input-group has-validation">
                <input type="file" class="form-control" name="fphoto" required>
              </div>
            </div>
            
            <div class="col-12">
              <label class="form-label">위치</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="flocation" required>
              </div>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="col-12">
              <label class="form-label">영업 시간</label>
              <div class="row">
	              <div class="col-md-2">
		              <select class="form-select" name="time1">
		              	<option value="오전">오전</option>
		              	<option value="오후">오후</option>
		              </select>
		          </div>    
		          <div class="col-md-2">    
		              <select class="form-select" name="time2">
		              	<option value="1시">1시</option>
		              	<option value="2시">2시</option>
		              	<option value="3시">3시</option>
		              	<option value="4시">4시</option>
		              	<option value="5시">5시</option>
		              	<option value="6시">6시</option>
		              	<option value="7시">7시</option>
		              	<option value="8시">8시</option>
		              	<option value="9시">9시</option>
		              	<option value="10시">10시</option>
		              	<option value="11시">11시</option>
		              	<option value="12시">12시</option>
		              </select>
		          </div>    
	              <div class="col-md-1">
		              <span class="input-group-text">&nbsp~</span>
		          </div>    
	              <div class="col-md-2">
		              <select class="form-select" name="time3">
		              	<option value="오전">오전</option>
		              	<option value="오후" selected>오후</option>
		              </select>
		          </div>    
		          <div class="col-md-2">    
		              <select class="form-select" name="time4">
		              	<option value="1시">1시</option>
		              	<option value="2시">2시</option>
		              	<option value="3시">3시</option>
		              	<option value="4시">4시</option>
		              	<option value="5시">5시</option>
		              	<option value="6시">6시</option>
		              	<option value="7시">7시</option>
		              	<option value="8시">8시</option>
		              	<option value="9시">9시</option>
		              	<option value="10시">10시</option>
		              	<option value="11시">11시</option>
		              	<option value="12시">12시</option>
		              </select>
		          </div>    
              </div>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="col-8 addInput" >
              <label class="form-label">메뉴 & 가격</label> 
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="fmenu" id="fmenu" placeholder="메뉴" required>
                <input type="text" class="form-control" name="fprice" id="fprice" placeholder="가격" required>
                <button type="button" class="btn btn-info btnAdd" onclick="add();">추가</button>
              </div>
              <div class="input-group has-validation ">
              
              </div>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

          <hr class="my-4"> 
		  <input type="hidden" name="id" value="<%=sid%>">
          <button class="w-100 btn btn-primary btn-lg" onclick="addFood();" type="button">등록</button>
        </form>
      </div>
    </div>
  </main>
</div>
        <!-- Reservation Start -->
  
<script>
	function add(){
		let tmp = '';
		tmp += '<div class="input-group has-validation">';
		tmp += '<input type="text" class="form-control" name="fmenu" id="fmenu" placeholder="메뉴">';
		tmp += '<input type="text" class="form-control" name="fprice" id="fprice" placeholder="가격">';
		tmp += '<button type="button" class="btn btn-secondary btnRemove">삭제</button></div>';
		$('.addInput').append(
				tmp
				
			);
			$('.btnRemove').on('click', function(){
				$(this).prev().remove();
				$(this).prev().remove();
				$(this).next().remove();
				$(this).remove();
			});
	}
	
	function addFood(){
		let fnameArr = $('input[name=fname]');
		let fprice = $('input[name=fprice]');
		let saveData = $(fnameArr).map((idx,data)=> {
		    return{
		        fname : data.value,
		        fprice : fprice[idx]
		    }
		});
		let tmp = JSON.stringify(saveData.get());
		console.log(tmp);
	}
	

</script>          

<%@ include file="/footer.jsp"%>        
</body>

</html>