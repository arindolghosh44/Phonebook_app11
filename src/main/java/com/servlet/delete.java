package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.ContactDAO;

@WebServlet("/delete")
public class delete extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Integer cid=Integer.parseInt(request.getParameter("cid"));
		
		ContactDAO dao=new ContactDAO(DBConnect.getConn());
		boolean f=dao.DeleteNotes(cid);
		
		if(f)
		{
			
			
			HttpSession session=request.getSession();
			session.setAttribute("succMsg","Contact Delete Successfully");
			response.sendRedirect("view_contact.jsp");
			
			
		}
		else {
			
			HttpSession session=request.getSession();
			session.setAttribute("failedMsg","Something went wrong in server");
			response.sendRedirect("view_contact.jsp");
			
			
		}
	
	
	
	
	}


}
