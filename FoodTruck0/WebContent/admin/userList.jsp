
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.userDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>회원관리</title>
    <style>
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <%@ include file="/header.jsp" %>
    <div class="container-xxl py-5 bg-dark hero-header mb-5">
        <div class="container text-center my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">회원 관리</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center text-uppercase">
                    <li class="breadcrumb-item"><a href="/main.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Settings</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">회원 관리</li>
                </ol>
            </nav>
        </div>
    </div>
    </div>

    <div class="container-xxl py-5 px-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row mb-3 text-center">
                <div class="col-4 themed-grid-col">아이디</div>
                <div class="col-4 themed-grid-col">이름</div>
                <div class="col-4 themed-grid-col">이메일</div>
            </div>
        </div>
        <hr>
        <div class="container" id="user">

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
                    <a class="page-link" href="?page=<%= userDAO.paging() %>">>></a>
                </li>
            </ul>
        </nav>
    </div>
    <%@ include file="/footer.jsp" %>

    <script>
        var page = <%= Integer.parseInt(request.getParameter("page")) %>;
        var maxPage = <%= userDAO.paging() %>

            function searchFunction() {

                $.ajax({
                    type:'post',
                    url:'/admin/userSearch.jsp',
                    data:{ page : page },
                    success:function(data){
                        var users = JSON.parse(data.trim());

                        var str = "";
                        var pageStr = "";
                        for(var i = 0; i < users.length; i++) {
                            str += "<div class='row mb-3 text-center'>"
                            str += "<div class='col-4 themed-grid-col'>" + users[i].id + "</div>"
                            str += "<div class='col-4 themed-grid-col'>"
                            str += "<a href='/admin/userEdit.jsp?id=" + users[i].id + "'>" + users[i].name + "</a></div>"
                            str += "<div class='col-4 themed-grid-col'>" + users[i].mail + "</div></div>"
                        } $("#user").html(str);

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