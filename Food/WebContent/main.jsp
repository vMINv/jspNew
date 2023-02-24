<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>메인</title>
</head>
<body>
<%@ include file="header.jsp" %>

        <div class="container-xxl py-5 bg-dark hero-header mb-5">
            <div class="container my-5 py-5">
                <div class="row align-items-center g-5">
                    <div class="col-lg-6 text-center text-lg-start">
                        <h1 class="display-3 text-white animated slideInLeft">오늘 오세요?</h1>
                        <p class="text-white animated slideInLeft mb-4 pb-2">당신 주변의 푸드 트럭을 찾아보세요</p>
                        <a href="/user/foodtruckmain.jsp" class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">검색</a>
                    </div>
                    <div class="col-lg-6 text-center text-lg-end overflow-hidden">
                        <img class="img-fluid" src="/resources/img/pizza.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Navbar & Hero End -->

<%@ include file="footer.jsp"%>  
</body>
</html>