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
<title>Add Contact Page</title>
<%@include file="component/all_css.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<!-- In navbar we get the user so here we use only the user -->
	
	<%
	if(user==null)
	{
		session.setAttribute("msg-error", "Login please......");
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


					<div class="card-body bg-primary bg-striped" border="2px">
						<form action="AddContact" method="post">
						<%
						if(user!=null)
						{%>
						<input type="hidden" value="<%=user.getId()%>" name="userid">	
					<% 	}
						
						
						
						%>
						
						
						
						
							
							<div class="form-group">
								<label>Enter Name</label> <input type="text"
									class="form-control" id="exampleInputEmail" name="name" placeholder="Enter Name">
							</div>
							
							
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail" name="email" placeholder="Enter Email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Phone Number</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									name="phno" placeholder="Enter Phone number">
							</div>

<div class="form-group">
																<textarea rows="3" cols="" placeholder="Enter about" name="about" class="form-control">ENTER About</textarea>
							</div>



							<button type="submit"
								class="btn btn-success badge-pill btn-block">Add Contact</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="component/footer.jsp"%>
</body>
</html>