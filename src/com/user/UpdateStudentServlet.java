package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   public UpdateStudentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String updatestudentid = request.getParameter("updatestudentid");
		String updatestudentname = request.getParameter("updatestudentname");
		String updatestudentgrade = request.getParameter("updatestudentgrade");
		String updatestudentbirthdate = request.getParameter("updatestudentbirthdate");
		String updatestudentphone = request.getParameter("updatestudentphone");
		String updatestudentaddress = request.getParameter("updatestudentaddress");
		
		Student updatedStudent = new Student();
		
		try {	
			updatedStudent.setId(updatestudentid);
			updatedStudent.setName(updatestudentname);
			updatedStudent.setCurrentGrade(updatestudentgrade);
			updatedStudent.setBirthdate(updatestudentbirthdate);
			updatedStudent.setPhone(updatestudentphone);
			updatedStudent.setAddress(updatestudentaddress);
			
			if(StudentDao.updateStudent(updatedStudent)) {
				System.out.println("update student SUccess");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Update Student Successful";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
			else {
				System.out.println("update student FAiled");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Update student Failed";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
