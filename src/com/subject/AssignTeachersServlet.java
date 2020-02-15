package com.subject;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AssignTeachersServlet")
public class AssignTeachersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AssignTeachersServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String subjectID = request.getParameter("assignteacherssubjectselect");
		String teacherID = request.getParameter("assignteachersstaffselect");
		
		Subject thisSubject = Subject.getSubjectSingleton();
		thisSubject.setSubjectID(subjectID);
		thisSubject.setTeacherID(teacherID);
		
		if(SubjectDao.assignTeachers(thisSubject)) {
			System.out.println("update academic SUccess");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Teacher assigned to the subject";
			request.setAttribute("result", result);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
		else {
			System.out.println("update academic FAiled");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Teacher was not assigned to the subject";
			request.setAttribute("result", result);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
	}

}
