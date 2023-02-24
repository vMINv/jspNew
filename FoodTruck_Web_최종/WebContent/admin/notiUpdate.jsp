<!-- 
	최초작성자 : 김형준(bright32123@mail.com)
	최초작성일 : 2023/02/15
	버전 기록   : 0.1(시작 23/02/15) 
	
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.questionDAO" %>
<html>
<head>
    <title>공지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ include file="/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<div class="p-5 mb-4 bg-light rounded-3">
    <div class="container-fluid">
        <h1 class="display-5 fw-bold">공지 사항</h1>
    </div>
</div>
<div class="container">
 <!--    <form id="requestForm" action="../common.notice.jsp" method="post"> -->
        <h3 class="text-center fw-bold">공지사항</h3>
        <hr>
        <div class="row mb-3">
            <strong  class="col-sm-2 col-form-label">
                <label for="title">제목</label>
            </strong>
            <div class="col-sm-10">
                <input type="text" id="title" name="qtitle" class="form-control" placeholder="제목을 입력해주세요">
            </div>
        </div>
        <div class="row mb-3">
            <strong  class="col-sm-2 col-form-label">
                <label for="summernote">공지 내용</label>
            </strong>
            <div class="col-sm-10">
                <textarea id="summernote" name="qcontent" class="form-control"></textarea>
            </div>
        </div>
        <hr>
        <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary">등록</button>
            <button type="delete" class="btn btn-primary">삭제</button>
        </div>
    </form>
</div>

<script>
    
    $('#summernote').summernote({
        placeholder: '공지 사항을 작성해주세요.',
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