<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background:
		url("images/5aebb8dc-88b2-4c52-9062-bdc3564393e9c835993bd05329aec6_34800862940_f7f3a7e596_k.jpg");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="component/all_css.jsp"%>
</head>
<body>
<%@include file="component/navbar.jsp"%>

<div class="container-fluid back-img">
	<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-header text-center text-white bg-warning bg-striped" border="1px">
						<i class="fa fa-user-plus text-primary" aria-hidden="true"></i>
						<h4>Login</h4>

					</div>


				

					<%
					String FailedMsg = (String) session.getAttribute("msg-error");
					if (FailedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%= FailedMsg %></div>

					<%
					session.removeAttribute("msg-error");
					}
					%>

<%
					String regMsg1 = (String) session.getAttribute("logoutmsg");
					if (regMsg1 != null) {
					%>
					<div class="alert alert-warning" role="alert"><%=regMsg1%></div>

					<%
					session.removeAttribute("logoutmsg");

					}
					%>






					<div class="card-body bg-success bg-striped" border="2px">
						<form action="LoginServlet" method="post">
							
							
							
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
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	
	
	</div>
	
	<%@include file="component/footer.jsp"%>
</body>
</html>