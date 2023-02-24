<!--
최초작성자 : 강세빈 (qz6789.sk@gmail.com)
최초작성일 : 2023/02/17

버전  기록 : 0.1(시작 23/02/17)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.questionDAO" %>
<html>
<head>
    <title>내 문의</title>
</head>
<body>
    <%@ include file="/header.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <div class="container-xxl py-5 bg-dark hero-header mb-5">
        <div class="container text-center my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">문의하기</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center text-uppercase">
                    <li class="breadcrumb-item"><a href="/main.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Community</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">문의하기</li>
                </ol>
            </nav>
        </div>
    </div>
    </div>

    <div class="container-xxl py-5 px-5 wow fadeInUp" data-wow-delay="0.1s">
        <form id="requestForm" action="questionSend.jsp" method="post">
            <h3 class="text-center fw-bold">문의하기</h3>
            <hr>
            <div class="row mb-3">
                <strong class="col-sm-2 col-form-label text-center">
                    <label for="title">제목</label>
                </strong>
                <div class="col-sm-10">
                    <input type="text" id="title" name="qtitle" class="form-control" placeholder="제목을 입력해주세요">
                </div>
            </div>
            <div class="row mb-3">
                <strong  class="col-sm-2 col-form-label text-center">
                    <label for="summernote">문의 내용</label>
                </strong>
                <div class="col-sm-10">
                    <textarea id="summernote" name="qcontent" class="form-control"></textarea>
                </div>
            </div>
            <div class="row mb-3">
                <strong  class="col-sm-2 col-form-label text-center">
                    <label for="emailAddress">이메일 주소</label>
                </strong>
                <div class="col-sm-10">
                    <input type="text" id="emailAddress" name="mail" class="form-control" placeholder="예) example@example.com">
                    <span class="email_error text-danger"></span>
                </div>
            </div>
            <hr>
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary">문의접수</button>
            </div>
        </form>
    </div>
    <%@ include file="/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script>
    var emailForm = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/;

    var emailChkStat = false;

    $('#emailAddress').on('keyup', function() {

        var email = $("#emailAddress").val();

        if (!emailForm.test(email)) {
            emailChkStat = false;
            $(".email_error").html('<i class="fa-solid fa-triangle-exclamation"></i> 형식에 맞지 않는 e-mail 주소입니다.')
        } else {
            emailChkStat = true;
            $(".email_error").empty();
        }
    })


    $('#summernote').summernote({
        placeholder: '문의 사항을 작성해주세요.',
        height: 300,
        maximumImageFileSize: 5* 1024 *1024,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ]
    });
</script>
</body>
</html>