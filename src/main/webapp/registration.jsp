<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background:
		url("images/18963844186_914b489d31_h-1024x683.jpg");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<%@include file="component/all_css.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
<div class="container-fluid back-img">
	<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-header text-center text-white bg-success bg-striped" border="1px">
						<i class="fa fa-user-plus text-primary" aria-hidden="true"></i>
						<h4>Registration</h4>

					</div>

 
					<%
					String regMsg = (String) session.getAttribute("updateMsg");
					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=regMsg%>Login<a href="login.jsp">Click Here</a></div>

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


					<div class="card-body bg-warning bg-striped" border="2px">
						<form action="RegisterServlet" method="post">
							
							<div class="form-group">
								<label>Enter Name</label> <input type="text"
									class="form-control" id="exampleInputEmail" name="uname" placeholder="Enter Name">
							</div>
							
							
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail" name="uemail" placeholder="Enter Email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									name="upassword" placeholder="Enter Password">
							</div>



							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="component/footer.jsp"%>
</body>
</html>