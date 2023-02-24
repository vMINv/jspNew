<!--
    최초작성자 : 강세빈 (qz6789.sk@gmail.com)
    최초작성일 : 2023/02/17

    버전  기록 : 0.1(시작 23/02/17)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.questionDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>내 문의</title>
    <style>
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
        }
         .box {
             margin-top: 10px;
             margin-bottom: 10px;
             border: 1px solid #ddd;
             border-radius: 10px;
             padding: 15px 50px 5px;
             width: 100%;
         }
        .email{
            float: right;
        }
        .qcontent {
            border: 1px solid #ddd;
            border-radius: 10px;
            margin-top: 50px;
            padding-top: 20px;
            margin-bottom: 20px;
        }

    </style>
</head>
<body>
    <%@ include file="/header.jsp" %>
    <div class="container-xxl py-5 bg-dark hero-header mb-5">
        <div class="container text-center my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">내 문의</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center text-uppercase">
                    <li class="breadcrumb-item"><a href="/main.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Community</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">내 문의</li>
                </ol>
            </nav>
        </div>
    </div>
    </div>

    <div class="container-xxl py-5 px-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row mb-3 text-center">
                <div class="col-1 themed-grid-col">번호</div>
                <div class="col-8 themed-grid-col">제목</div>
                <div class="col-3 themed-grid-col">답변 메일</div>
            </div>
        </div>
        <hr>
        <div class="container" id="question">

        </div>
        <nav aria-label="...">
            <ul class="pagination">
                <li class="page-item prev" style="display: none;">
                    <a class="page-link" href="?page=1"><<</a>
                </li>
                <li class="page-item prev" style="display: none;">
                    <a class="page-link prev"><</a>
                </li>
                <li id="pageNumber"></li>
                <li class="page-item next" style="display: inline-block;">
                    <a class="page-link next" href="?page=">></a>
                </li>
                <li class="page-item next" style="display: inline-block;">
                    <a class="page-link" href="?page=<%= questionDAO.paging(sid) %>">>></a>
                </li>
            </ul>
        </nav>
    </div>

    <%@ include file="/footer.jsp" %>

    <script>

        var page = <%= Integer.parseInt(request.getParameter("page")) %>;
        var maxPage = <%= questionDAO.paging(sid) %>;

        function detailQuest(qno) {
            if( $("#qdetail"+qno).css('display') == 'none') {

                $("#qdetail"+qno).css('display', 'flex');
            } else {
                $("#qdetail"+qno).css('display', 'none');
            }
        }

        function searchFunction() {

            $.ajax({
                type:'post',
                url:'/user/questionSearch.jsp',
                data:{ page : page },
                success:function(data){
                    var questions = JSON.parse(data.trim());

                    var str = "";
                    var pageStr = "";
                    for(var i = 0; i < questions.length; i++){
                        str += "<div class='row mb-3 text-center'>"
                        str += "<div class='col-1 themed-grid-col'>" + questions[i].qno + "</div>"
                        str += "<div class='col-8 themed-grid-col' onclick='detailQuest(" + questions[i].qno +")'>" + questions[i].qtitle + "</div>"
                        str += "<div class='col-3 themed-grid-col'>" + questions[i].mail + "</div>";
                        str += "<div class='col-12 themed-grid-col text-center' id='qdetail" + questions[i].qno + "' style='display: none'>";
                        str += "<div class='box shadow'><div class='question_header'>";
                        str += "<div class='title fw-bold fs-3'>" + questions[i].qtitle + "</div>";
                        str += "<div class='email fs-6'>" + questions[i].mail + "</div></div>";
                        str += "<div class='qcontent'>" + questions[i].qcon + "</div></div></div></div>";
                    }
                    $("a.next").attr("href",'?page=' + (Math.floor((page-1)/5) * 5 + 6));
                    if (page > 5) {
                        $(".prev").css('display','inline-block');
                        $("a.prev").attr("href",'?page=' + (Math.floor((page-1)/5) * 5));
                    }
                    if (page > (Math.floor((maxPage-1)/5) * 5)){
                        $(".next").css('display','none');
                    }

                    for (var j = 1; j < 6; j++) {
                        if ((Math.floor((page-1)/5) * 5 + j) == page) {
                            pageStr += '<li class="page-item active" aria-current="page" style="display: inline-block"><a class="page-link" href="?page='+ (Math.floor((page-1)/5) * 5 + j) + '">' + (Math.floor((page-1)/5) * 5 + j) + '</a></li>'
                        } else if ((Math.floor((page-1)/5) * 5 + j) > maxPage) {
                            $(".next").css('display','none');
                            break;
                        } else {
                            pageStr += '<li class="page-item" aria-current="page" style="display: inline-block"><a class="page-link" href="?page='+ (Math.floor((page-1)/5) * 5 + j) + '">' + (Math.floor((page-1)/5) * 5 + j) + '</a></li>'
                        }
                    }
                    $("#question").html(str);
                    $("#pageNumber").html(pageStr);
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
</body>
</html>