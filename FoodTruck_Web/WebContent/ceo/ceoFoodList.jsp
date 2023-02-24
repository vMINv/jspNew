<!--
최초작성자 : 강세빈 (qz6789.sk@gmail.com)
최초작성일 : 2023/02/22

버전  기록 : 0.1(시작 23/02/22)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.orderDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>주문 사항</title>
    <style>
        .orderInfo {
            margin-right: 5px;
        }
    </style>

    <script>

        function cancelOrder(ono) {

        }

        function successOrder(ono) {

        }

        function searchFunction() {

            $.ajax({
                type:'post',
                url:'/ceo/ceoFoodSearch.jsp',
                success:function(data){
                    var foods = JSON.parse(data.trim());

                    var str = "";

                    for(var i = 0; i < foods.length; i++){
                        str += "<div class='row mb-3 text-center'>";
                        str += "<div class='col-3 themed-grid-col'>" + foods[i].fname + "</div>";
                        str += "<div class='col-4 themed-grid-col'>" + foods[i].flocation + "</div>";
                        str += "<a class='col-2 themed-grid-col btn btn-info rounded-pill orderInfo' href='/ceo/ceoOrder.jsp?page=1&fno=" + foods[i].fno + "'>주문 내역</a>";
                        str += "<a class='col-2 themed-grid-col btn btn-warning rounded-pill' href='/ceo/ceoReview.jsp?fno=" + foods[i].fno + "'>리뷰</a></div>";
                    }
                    $("#foods").html(str);
                },
                error:function(request, status, error){
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        }

        window.onload = function() {
            searchFunction();
        }
    </script>
</head>
<body>
    <%@ include file="/header.jsp" %>
        <div class="container-xxl py-5 bg-dark hero-header mb-5">
            <div class="container text-center my-5 pt-5 pb-4">
                <h1 class="display-3 text-white mb-3 animated slideInDown">가게 목록</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center text-uppercase">
                        <li class="breadcrumb-item"><a href="/main.jsp">Home</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">MYPAGE</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>

    <div class="container-xxl py-5 px-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="row mb-3 text-center">
            <div class="col-3 themed-grid-col">이름</div>
            <div class="col-4 themed-grid-col">위치</div>
            <div class="col-4 themed-grid-col">주문 내역/리뷰 목록</div>
        </div>
        <hr>
        <div class="container" id="foods">

        </div>
    </div>

    <%@ include file="/footer.jsp" %>
</body>
</html>