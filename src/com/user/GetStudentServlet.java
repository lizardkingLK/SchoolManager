package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetStudentServlet")
public class GetStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetStudentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String thisstudentid = request.getParameter("studentidradio");
		Student thisStudent = StudentDao.getStudent(thisstudentid);
		
		try {
			request.setAttribute("gotname",thisStudent.getName());
	        request.setAttribute("gotcurrentgrade",thisStudent.getCurrentGrade());
	        request.setAttribute("gotbirthday",thisStudent.getBirthdate());
	        request.setAttribute("gotphone",thisStudent.getPhone());
	        request.setAttribute("gotaddress",thisStudent.getAddress());
	        
	        request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

}
