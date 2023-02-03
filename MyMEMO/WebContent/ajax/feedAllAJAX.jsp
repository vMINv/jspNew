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
<script>

function searchFunction() {
	
	$.ajax({
		type:'post',
		url:'feedAllCheckAJAX.jsp',
		success:function(data){
			var feeds = JSON.parse(data.trim());
			
			var str = "";
			for(var i = 0; i < feeds.length; i++){
				str += "<tr><th>"+feeds[i].no+"</th>";
				str +="<td>"+feeds[i].id+"</td>";
				str +="<td>"+feeds[i].content+"</td>";
				str +="<td>"+feeds[i].ts+"</td></tr>";	
			} $("#ajaxTable").html(str);
		}
	});
}



window.onload = function() {
	searchFunction();
}

</script>

<br>
	<div class="container">
	<table class="table table-striped">
	  <thead>
	    <tr>
	      <th scope="col">No</th>
	      <th scope="col">ID</th>
	      <th scope="col">Content</th>
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