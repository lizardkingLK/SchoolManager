package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddAcademicServlet")
public class AddAcademicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddAcademicServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String addacademicid = request.getParameter("addacademicid");
		String addacademicname = request.getParameter("addacademicname");
		String addacademicbirthdate = request.getParameter("addacademicbirthdate");
		String addacademicphone = request.getParameter("addacademicphone");
		String addacademicaddress = request.getParameter("addacademicaddress");
		String addacademicsalary = request.getParameter("addacademicsalary");
		String addacademicemail = request.getParameter("addacademicemail");
		
		try {
			Academic newAcademicInstance = new Academic();
			
			newAcademicInstance.setId(addacademicid);
			newAcademicInstance.setName(addacademicname);
			newAcademicInstance.setBirthdate(addacademicbirthdate);
			newAcademicInstance.setPhone(addacademicphone);
			newAcademicInstance.setAddress(addacademicaddress);
			newAcademicInstance.setSalary(addacademicsalary);
			newAcademicInstance.setEmail(addacademicemail);
			
			if(AcademicDao.addNewAcademic(newAcademicInstance)) {
				System.out.println("add academic SUccess");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Add New Academic Successful";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
			else {
				System.out.println("add academic FAiled");
				response.sendRedirect("admin.jsp");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Add New Academic Failed";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
