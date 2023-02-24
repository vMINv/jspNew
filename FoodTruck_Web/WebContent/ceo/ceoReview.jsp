<!--
    최초작성자 : 강세빈 (qz6789.sk@gmail.com)
    최초작성일 : 2023/02/16

    버전  기록 : 0.1(시작 23/02/16)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.foodDAO" %>
<%@ page import="jdbc.reviewDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>내 가게 리뷰</title>
    <style>
        .box {
            margin-top: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            width: 100%;
        }

        .date{
            float: right;
        }

        .review_header {
            margin-bottom: 20px;
        }
    </style>
    <script>
        <% int fno = Integer.parseInt(request.getParameter("fno")); %>

        var fno = <%= fno %>
        var page = 0;
        var maxPage = <%= reviewDAO.ceoPaging(fno) %>;

        function searchFunction() {

            $.ajax({
                type:'post',
                url:'ceoReviewSearch.jsp',
                data: { fno: fno,
                        page: page },
                success:function(data) {
                    var reviews = JSON.parse(data.trim());

                    var str = "";

                    for (var i = 0; i < reviews.length; i++) {
                        str += "<div class='box shadow'>";
                        str += "<div class='review_header'>";
                        str += "<div class='id fw-bold'>" + reviews[i].id + "</div>";
                        for (var j = 0; j < 5 - reviews[i].point; j++) {
                            str += "<i class='far fa-star'></i>";
                        }
                        for (var k = 0; k < reviews[i].point; k++) {
                            str += "<i style='color:gold' class='far fas fa-star'></i>";
                        }
                        str += reviews[i].point + "점"
                        if (reviews[i].rupdatetime == null) {
                            str += "<span class='date'>" + reviews[i].rregtime + "</span></div>";
                        } else {
                            str += "<span class='date'>" + reviews[i].rupdatetime + " (수정됨)</span></div>";
                        }
                        str += "<div>" + reviews[i].rcontent + "</div></div>";
                    }
                    str += "<div id='moreList' style='display: flex;'>";
                    str += "<div class='box shadow text-center' id='moreView' onclick='moreView()'>더보기 ∨</div></div>"

                    $("#review").html(str);

                    if (maxPage == page) {
                        $("#moreList").css('display', 'none');
                    } else {
                        $("#moreList").css('display', 'flex');
                    }
                },
                error:function(request, status, error){
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        }

        function moreView() {
            page = page + 1
            searchFunction()
        }

        window.onload = function() {
            moreView();
        }
    </script>
</head>
<body>
    <%@ include file="/header.jsp" %>
    <div class="container-xxl py-5 bg-dark hero-header mb-5">
        <div class="container text-center my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">내 가게 리뷰 목록</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center text-uppercase">
                    <li class="breadcrumb-item"><a href="/main.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="/ceo/ceoFoodList.jsp">MYPAGE</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">내 가게 리뷰 목록</li>
                </ol>
            </nav>
        </div>
    </div>
    </div>

    <div class="container-xxl py-5 px-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <h2 class="shadow py-3 text-center"><%= foodDAO.getName(Integer.parseInt(request.getParameter("fno"))) %></h2>
            <hr>
            <div class="fw-bold bs-3">전체 리뷰 <%= reviewDAO.totalReview(fno) %>건</div>
        </div>
        <div class="container" id="review">
        </div>
    </div>
    <%@ include file="/footer.jsp" %>
</body>
</html>