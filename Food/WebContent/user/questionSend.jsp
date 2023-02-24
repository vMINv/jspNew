<%--
    최초작성자 : 강세빈 (qz6789.sk@gmail.com)
    최초작성일 : 2023/02/17

    버전  기록 : 0.1(시작 23/02/17)
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.questionDAO" %>
<%@ include file="/header.jsp" %>
<%
    request.setCharacterEncoding("UTF-8"); //한글 처리

    String mail = request.getParameter("mail");
    String qtitle = request.getParameter("qtitle");
    String qcontent = request.getParameter("qcontent");

    if (questionDAO.sendQuestion(mail, qtitle, qcontent)) {
        questionDAO.addQuestion(sid, qtitle, mail, qcontent);
%>

<!-- Modal -->
<div class="modal fade" id="sendQuestion" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="emailKeySuccessLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="sendQuestionLabel">문의 전송 성공</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                문의 사항이 전송되었습니다.
            </div>
            <div class="modal-footer">
                <button type="button" onclick="location.href='myQuestion.jsp?page=1'" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function() {
        $("#sendQuestion").modal("show");
    });
</script>

<%
    } else {
%>

<!-- Modal -->
<div class="modal fade" id="failQuestion" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="emailKeySuccessLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="failQuestionLabel">문의 전송 실패</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                문의 사항이 실패하였습니다. 다시 확인 후 전송해주세요.
            </div>
            <div class="modal-footer">
                <button type="button" onclick="location.href='questionAdd.jsp'" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function() {
        $("#failQuestion").modal("show");
    });
</script>

<%
    }
%>