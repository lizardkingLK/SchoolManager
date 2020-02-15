package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateNonAcademicServlet")
public class UpdateNonAcademicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateNonAcademicServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String updatenonacademicid = request.getParameter("updatenonacademicid");
		String updatenonacademicname = request.getParameter("updatenonacademicname");
		String updatenonacademicbirthdate = request.getParameter("updatenonacademicbirthdate");
		String updatenonacademicphone = request.getParameter("updatenonacademicphone");
		String updatenonacademicaddress = request.getParameter("updatenonacademicaddress");
		String updatenonacademicsalary = request.getParameter("updatenonacademicsalary");
		String updatenonacademicemail = request.getParameter("updatenonacademicemail");
		
		NonAcademic updatedNonAcademic = new NonAcademic();
		
		try {	
			updatedNonAcademic.setId(updatenonacademicid);
			updatedNonAcademic.setName(updatenonacademicname);
			updatedNonAcademic.setBirthdate(updatenonacademicbirthdate);
			updatedNonAcademic.setPhone(updatenonacademicphone);
			updatedNonAcademic.setAddress(updatenonacademicaddress);
			updatedNonAcademic.setSalary(updatenonacademicsalary);
			updatedNonAcademic.setEmail(updatenonacademicemail);
			
			if(NonAcademicDao.updateNonAcademic(updatedNonAcademic)) {
				System.out.println("update nonacademic SUccess");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Update nonacademic Successful";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
			else {
				System.out.println("update nonacademic FAiled");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Update nonacademic Failed";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
