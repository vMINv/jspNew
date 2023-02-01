<%@page import="jdbc.*, java.util.*, smtp.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link href="/etc/sign-in.css" rel="stylesheet">
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String to = request.getParameter("to");
	
	//중복 아이디 체크
	if(UserDAO.exsist(id)){//존재, 아이디 사용불가능%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원가입 실패</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       이미 존재하는 아이디입니다. 다시 시도해주세요.
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='signup.jsp'" class="btn btn-primary">회원가입</button>
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal1").modal("show");
			});
		</script>
<%		
	}else{
	//디비에 넣기
	int result = UserDAO.insert(id, password, name);
	
	if(result==1){//가입 성공
	
		Map<String, String> emailInfo = new HashMap<String, String>();
		emailInfo.put("from", "hyunmin04050@gmail.com");
		emailInfo.put("to", request.getParameter("to"));
		emailInfo.put("subject", "[구글] 회원가입을 환영합니다.");
	
		String htmlContent = "";
		
		String templatePath = application.getRealPath("Welcome.html");
		BufferedReader br = new BufferedReader(new FileReader(templatePath));
		
		String oneLine;
		while((oneLine = br.readLine()) != null ){
			htmlContent += oneLine + "\n";
		}
		br.close();
		
		htmlContent = htmlContent.replace("__NAME__", name);
		htmlContent = htmlContent.replace("__TO__", to);
		htmlContent = htmlContent.replace("__PASS__", password);
		
		emailInfo.put("content", htmlContent);//내용
		emailInfo.put("format", "text/html;charset=UTF-8");//메일의 형식
		
		Mail smtpServer = new Mail();//메일 전송 객체 생성 
		smtpServer.emailSending(emailInfo);
	%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 가입 성공 </h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       환영합니다. 로그인 페이지로 이동합니다.
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='login.jsp'" class="btn btn-primary">로그인 페이지</button>
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal2").modal("show");
			});
		</script>
<%	}
	}
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>