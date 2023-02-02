<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Step 1 Import SQL Packages -->
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//Step 2 Load JDBC Driver
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch(ClassNotFoundException err) {
		out.print("JDBC Driver loading error<br>" + err.getMessage());
	}

	//Step 3 Creare Connection Object
	Connection conn = null;
	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tlagusals","tlagusals","Newnew11@");
	} catch(SQLException err) {
		out.print("Connection Object error<br>" + err.getMessage());
	}
	
	//Step 4 Create Statement Object
	String sql = "CREATE TABLE student("
			+ "hakbun 	varchar(10),"
			+ "name 	varchar(10),"
			+ "dept 	varchar(20),"
			+ "addr 	varchar(30),"
			+ "primary 	key(hakbun))";
			
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//Step 5 Execute SQL Query
	pstmt.executeUpdate();
	
	//Step 6 Close Connection
	pstmt.close();
	conn.close();
%>
</body>
</html>