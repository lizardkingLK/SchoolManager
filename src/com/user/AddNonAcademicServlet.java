package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddNonAcademicServlet")
public class AddNonAcademicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddNonAcademicServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String addnonacademicid = request.getParameter("addnonacademicid");
		String addnonacademicname = request.getParameter("addnonacademicname");
		String addnonacademicbirthdate = request.getParameter("addnonacademicbirthdate");
		String addnonacademicphone = request.getParameter("addnonacademicphone");
		String addnonacademicaddress = request.getParameter("addnonacademicaddress");
		String addnonacademicsalary = request.getParameter("addnonacademicsalary");
		String addnonacademicemail = request.getParameter("addnonacademicemail");
		
		try {
			NonAcademic newNonAcademicInstance = new NonAcademic();
			
			newNonAcademicInstance.setId(addnonacademicid);
			newNonAcademicInstance.setName(addnonacademicname);
			newNonAcademicInstance.setBirthdate(addnonacademicbirthdate);
			newNonAcademicInstance.setPhone(addnonacademicphone);
			newNonAcademicInstance.setAddress(addnonacademicaddress);
			newNonAcademicInstance.setSalary(addnonacademicsalary);
			newNonAcademicInstance.setEmail(addnonacademicemail);
			
			if(NonAcademicDao.addNewNonAcademic(newNonAcademicInstance)) {
				System.out.println("add nonacademic SUccess");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Add New NonAcademic Successful";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
			else {
				System.out.println("add nonacademic FAiled");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Add New NonAcademic Failed";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
