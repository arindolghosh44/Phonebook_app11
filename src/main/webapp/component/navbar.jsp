<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.servlet.*"%>
<%@page import="java.util.*"%>
<nav class="navbar navbar-expand-lg navbar-light bg-warning">
  <a class="navbar-brand text-primary" href="index.jsp"><i class="fa-brands fa-whatsapp  text-danger ml-2"></i>PhoneBook</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active ">
        <a class="nav-link text-primary" href="index.jsp"><i class="fa-solid fa-house-user text-danger"></i>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-primary" href="add_contact.jsp"><i class="fa-solid fa-file-circle-plus text-danger"></i>Add Contact</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link text-primary" href="view_contact.jsp"><i class="fa-solid fa-eye text-danger"></i>view contact</a>
      </li>
      
      
      
      
    </ul>
    
    <%
    User user=(User)session.getAttribute("user");
    if(user==null)
    {%>
    	
    	
     <form class="form-inline my-2 my-lg-0">
     <a href="login.jsp" class="btn btn-success bg-striped " border="1px"><i class="fa-solid fa-user text-warning"></i>Login</a>
    <a href="registration.jsp" class="btn btn-danger ml-2 bg-striped " border="1px" ><i class="fa-solid fa-user-plus text-success"></i>Register</a>
    
    </form>
    
    	
    	
    	
    	
    	
    	
    	
    	
   <%  }
    
    else
    {%>
     	
        <form class="form-inline my-2 my-lg-0">
     <button class="btn btn-danger bg-striped" border="1px"><i class="fa-solid fa-user-plus text-success"></i><%=user.getName()%></button>
       <a <button type="button" class="btn btn-primary ml-3" data-toggle="modal" data-target="#exampleModal">
 
</button>><i class="fa-solid fa-user-plus text-success"></i>Logout</a>
       </form>
       
   <%  }
    
    %>
    
  
 
</div>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <a href="Logout" class="btn btn-secondary" >Logout</a>
        <button data-dismiss="modal"  type="button" class="btn btn-primary">Close</button>
      </div>
    </div>
  </div>
</div>
</nav>