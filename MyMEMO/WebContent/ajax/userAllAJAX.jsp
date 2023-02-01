<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jdbc.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<script type="text/javascript">
function searchFunction() {
	
	$.ajax({
		type:'post',
		url:'userAllCheckAJAX.jsp',
		success:function(data){
			var users = JSON.parse(data.trim());
			
			var str = "";
			for(var i = 0; i < users.length; i++){
				str += "<tr><th>"+users[i].id+"</th>";
				str +="<td>"+users[i].password+"</td>";
				str +="<td>"+users[i].name+"</td>";
				str +="<td>"+users[i].ts+"</td></tr>";	
			} $("#ajaxTable").html(str);
		}
	});
}

window.onload = function(){
	searchFunction();
}
</script>

	<br>
	<div class="container">
	<table class="table table-striped">
	  <thead>
	    <tr>
	      <th scope="col">ID</th>
	      <th scope="col">Password</th>
	      <th scope="col">Name</th>
	      <th scope="col">Date</th>
	    </tr>
	  </thead>
	  <tbody id="ajaxTable">
	  </tbody>
	</table>
	</div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>