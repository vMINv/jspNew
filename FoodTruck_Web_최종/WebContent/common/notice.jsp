<!--
    최초작성자 : 강세빈 (qz6789.sk@gmail.com)
    최초작성일 : 2023/02/15

    버전  기록 : 0.1(시작 23/02/15)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.notiDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>공지사항</title>
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">공지사항</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center text-uppercase">
                    <li class="breadcrumb-item"><a href="/main.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Community</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">공지사항</li>
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
                <div class="col-3 themed-grid-col">작성일</div>
            </div>
        </div>
        <hr>
        <div class="container" id="notice">

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
                    <a class="page-link" href="?page=<%= notiDAO.paging() %>">>></a>
                </li>
            </ul>
        </nav>
    </div>
    <%@ include file="/footer.jsp" %>

    <script>
        var page = <%= Integer.parseInt(request.getParameter("page")) %>;
        var maxPage = <%= notiDAO.paging() %>

            function searchFunction() {

                $.ajax({
                    type:'post',
                    url:'/common/noticeSearch.jsp',
                    data:{ page : page },
                    success:function(data){
                        var notices = JSON.parse(data.trim());

                        var str = "";
                        var pageStr = "";
                        for(var i = 0; i < notices.length; i++){
                            str += "<div class='row mb-3 text-center'>"
                            str += "<div class='col-1 themed-grid-col'>" + notices[i].nno + "</div>"
                            str += "<div class='col-8 themed-grid-col'>"
                            <%
                                if (userDAO.perCheck(sid) == 2) {
                            %>
                            str += "<a href='/admin/notiUpdate.jsp?nno=" + notices[i].nno + "'>" + notices[i].ntitle + "</a></div>"
                            <%
                                } else {
                            %>
                            str += notices[i].ntitle + "</div>"
                            <%
                                }
                            %>

                            if (notices[i].nupdatetime == null) {
                                str += "<div class='col-3 themed-grid-col'>" + notices[i].nregtime + "</div>";
                            } else {
                                str += "<div class='col-3 themed-grid-col'>" + notices[i].nupdatetime + " (수정됨)</div>";
                            }
                            str += "</div>"
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
                        $("#notice").html(str);
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