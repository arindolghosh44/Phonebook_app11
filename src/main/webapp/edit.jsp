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
	background: url("images/books-1204029_1280.jpg");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
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
<div class="container-fluid back-img">
	<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-header text-center text-white bg-success bg-striped" border="1px">
						<i class="fa fa-user-plus text-primary" aria-hidden="true"></i>
						<h4>AddContact</h4>

					</div>

 
					<%
					String regMsg = (String) session.getAttribute("updateMsg");
					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=regMsg%></div>

					<%
					session.removeAttribute("updateMsg");

					}
					%>

					<%
					String FailedMsg = (String) session.getAttribute("msg-error");
					if (FailedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%= FailedMsg %></div>

					<%
					session.removeAttribute("msg-error");
					}
					%>


					<div class="card-body bg-primary bg-striped" border="2px">
						<form action="update" method="post">
						<%
					int cid=Integer.parseInt(request.getParameter("cid"));
						ContactDAO dao=new ContactDAO(DBConnect.getConn());
						Contact c=dao.getDataById(cid);
						
						%>
						
						<input type="hidden" value="<%=cid%>" name="cid">
						
						
							
							<div class="form-group">
								<label>Enter Name</label> <input type="text"
									class="form-control" id="exampleInputEmail" name="name" value="<%=c.getName()%>">
							</div>
							
							
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail" name="email" value="<%=c.getEmail()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Phone Number</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									name="phno" value="<%=c.getPhno()%>">
							</div>

<div class="form-group">
								<textarea rows="3" cols=""  name="about" class="form-control"><%=c.getAbout() %></textarea>
							</div>



							<button type="submit"
								class="btn btn-success badge-pill btn-block">update Contact</button>
						</form>

					</div>
				</div>
			</div>
		</div>
		</div>

<%@include file="component/footer.jsp"%>


</body>
</html>