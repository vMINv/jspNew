<%@ page import="jdbc.notiDAO" %><%--
  Created by IntelliJ IDEA.
  User: qz678
  Date: 2023-02-22
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String ntitle = request.getParameter("ntitle");
  String ncontent = request.getParameter("ncontent");

  if (notiDAO.insert(ntitle, ncontent) == 1) {
%>

<script>
  alert("공지 등록이 성공하였습니다.");
  window.location.href = "/common/notice.jsp?page=1";
</script>
<%
}else {
%>
<script>
  alert("공지 등록이 실패하였습니다.");
  //window.location.href = "리다이렉트할 페이지 URL";
</script>
<%
  }

%>
