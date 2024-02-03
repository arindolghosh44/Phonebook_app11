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
	background:
		url("images/th (7).jfif");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>view Contact Page</title>
<%@include file="component/all_css.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	if(user==null)
	{
		session.setAttribute("msg-error", "Login please.........");
		response.sendRedirect("login.jsp");
	}
	
	
	%>
	
	
					<%
					String regMsg = (String) session.getAttribute("succMsg");
					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=regMsg%></div>

					<%
					session.removeAttribute("succMsg");

					}
					%>

					<%
					String FailedMsg = (String) session.getAttribute("failedMsg");
					if (FailedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%= FailedMsg %></div>

					<%
					session.removeAttribute("failedMsg");
					}
					%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<div class="container-fluid back-img">
	<h2 class="text-center text-warning">View Contact</h2>

		<div class="row p-2">
		
<%
ContactDAO dao=new ContactDAO(DBConnect.getConn());
List<Contact> contact=dao.getData(user.getId());

for(Contact c:contact){
	%>
		<div class="col-md-3">
		<div class="card mt-3">
					
					<div class="card-body p-4">
						<h5>Name:<%=c.getName() %></h5>
							<h5>Phone No:<%=c.getPhno() %></h5>
						
							<h5>Email:<%=c.getEmail() %></h5>
						
						
							<h5>About:<%=c.getAbout() %></h5>
						
						
						
							 <a href="edit.jsp?cid=<%=c.getId()%>"
								class="btn btn-primary">Edit</a>
								<a href="delete?cid=<%=c.getId()%>"
								class="btn btn-danger">Delete</a>
						</div>

					</div>
	
	</div>
	
	
<%}


%>





			
			
				</div>
				

			</div>
		
	
	
	
	
	
	
	<%@include file="component/footer.jsp"%>
</body>
</html>