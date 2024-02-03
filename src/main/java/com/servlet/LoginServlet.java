package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.UserDAO;
import com.entity.User;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
		
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		
		
		
		
		UserDAO dao=new UserDAO(DBConnect.getConn());
		User f=dao.loginUser(email, password);
		
		if(f!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("updateMsg","Login Successfully");
			HttpSession session2=request.getSession();
			session2.setAttribute("user",f);
			response.sendRedirect("index.jsp");
		}
		else {
		
			HttpSession session=request.getSession();
			session.setAttribute("msg-error","Invalid email and password");
			response.sendRedirect("login.jsp");
		}
		

	}
	
	
	
}
