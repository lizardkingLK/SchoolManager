package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateAcademicServlet")
public class UpdateAcademicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateAcademicServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String updateacademicid = request.getParameter("updateacademicid");
		String updateacademicname = request.getParameter("updateacademicname");
		String updateacademicbirthdate = request.getParameter("updateacademicbirthdate");
		String updateacademicphone = request.getParameter("updateacademicphone");
		String updateacademicaddress = request.getParameter("updateacademicaddress");
		String updateacademicsalary = request.getParameter("updateacademicsalary");
		String updateacademicemail = request.getParameter("updateacademicemail");
		
		Academic updatedAcademic = new Academic();
		
		try {	
			updatedAcademic.setId(updateacademicid);
			updatedAcademic.setName(updateacademicname);
			updatedAcademic.setBirthdate(updateacademicbirthdate);
			updatedAcademic.setPhone(updateacademicphone);
			updatedAcademic.setAddress(updateacademicaddress);
			updatedAcademic.setSalary(updateacademicsalary);
			updatedAcademic.setEmail(updateacademicemail);
			
			if(AcademicDao.updateAcademic(updatedAcademic)) {
				System.out.println("update academic SUccess");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Update academic Successful";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
			else {
				System.out.println("update academic FAiled");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Update academic Failed";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
