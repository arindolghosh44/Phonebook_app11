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
import com.entity.Contact;

@WebServlet("/AddContact")
public class AddContact extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phno = request.getParameter("phno");
		String about = request.getParameter("about");

		
		
	
		Contact u = new Contact(name, email, phno, about, userid);

		ContactDAO dao = new ContactDAO(DBConnect.getConn());
		boolean f = dao.saveContact(u);

		if (f) {
			HttpSession session = request.getSession();
			session.setAttribute("succMsg", "Contact added Successfully");

			response.sendRedirect("add_contact.jsp");
		} else {

			HttpSession session = request.getSession();
			session.setAttribute("failedMsg", "Not added");
			response.sendRedirect("add_contact.jsp");
		}

	}
}
