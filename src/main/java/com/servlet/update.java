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

@WebServlet("/update")
public class update extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int cid=Integer.parseInt(request.getParameter("cid"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phno = request.getParameter("phno");
		String about = request.getParameter("about");

		
		
	
		Contact u = new Contact();
		u.setId(cid);
		u.setName(name);
		u.setEmail(email);
		u.setPhno(phno);
u.setAbout(about);
		ContactDAO dao = new ContactDAO(DBConnect.getConn());
		boolean f = dao.updateContact(u);

		if (f) {
			HttpSession session = request.getSession();
			session.setAttribute("succMsg-ty", "Contact update Successfully");

			response.sendRedirect("edit.jsp?cid="+cid);
		} else {

			HttpSession session = request.getSession();
			session.setAttribute("failedMsg-ty", "Not updated");
			response.sendRedirect("edit.jsp?cid="+cid);
		}

		
		
		
		
		
	}

	

}
