package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RemoveStudentServlet")
public class RemoveStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveStudentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String stuid = request.getParameter("removestudentid").toString();
		
		if(StudentDao.removeStudent(stuid)) {
			System.out.println("remove Student SUccess");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Remove Student Successful";
			request.setAttribute("result", result);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
		else {
			System.out.println("remove Student FAiled");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Remove Student Failed";
			request.setAttribute("result", result);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
	}

}
