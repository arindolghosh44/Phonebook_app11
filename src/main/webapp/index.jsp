<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.servlet.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("images/4542378138_48f40e6bc9_o-1.jpg");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="component/all_css.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	
	
	<div class="container-fluid back-img text-center text-warning">
	
	<h1>Welcome to Phonebook</h1>
		
	
	
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>