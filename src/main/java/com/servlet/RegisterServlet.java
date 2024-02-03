package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.*;
import com.entity.User;
import com.conn.DBConnect;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
		String name=request.getParameter("uname");
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		
		User u=new User(name,email,password);
		
		
		UserDAO dao=new UserDAO(DBConnect.getConn());
		boolean f=dao.userRegister(u);
		
		if(f)
		{
			HttpSession session=request.getSession();
			session.setAttribute("updateMsg","data insert Successfully");
			
			response.sendRedirect("registration.jsp");
		}
		else {
		
			HttpSession session=request.getSession();
			session.setAttribute("msg-error","Something went wrong in server");
			response.sendRedirect("registration.jsp");
		}
		

	}
}
