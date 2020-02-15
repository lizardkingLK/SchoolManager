package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	public AddStudentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String addstudentid = request.getParameter("addstudentid");
		String addstudentname = request.getParameter("addstudentname");
		String addstudentgrade = request.getParameter("addstudentgrade");
		String addstudentbirthdate = request.getParameter("addstudentbirthdate");
		String addstudentphone = request.getParameter("addstudentphone");
		String addstudentaddress = request.getParameter("addstudentaddress");
		
		try {
			Student newStudentInstance = new Student();
			
			newStudentInstance.setId(addstudentid);
			newStudentInstance.setName(addstudentname);
			newStudentInstance.setEnteredGrade(addstudentgrade);
			newStudentInstance.setBirthdate(addstudentbirthdate);
			newStudentInstance.setPhone(addstudentphone);
			newStudentInstance.setAddress(addstudentaddress);
			
			if(StudentDao.addNewStudent(newStudentInstance)) {
				System.out.println("add student SUccess");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Add New Student Successful";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
			else {
				System.out.println("add student FAiled");
				String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Add New student Failed";
				request.setAttribute("result", result);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
