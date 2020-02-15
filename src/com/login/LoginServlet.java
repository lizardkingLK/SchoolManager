package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.Academic;
import com.user.NonAcademic;
import com.user.Student;
import com.user.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String logintype = request.getParameter("logintype");
		String uid = request.getParameter("username").toUpperCase();
		String pwd = request.getParameter("password");
		
		System.out.println(logintype+" "+uid+" "+pwd);
		
		if(logintype.equals("Student")) {
			String usertype = "Student";
			User studentUser = new Student();
			if(studentUser.authenticateUser(uid, pwd, usertype)) {
				response.sendRedirect("student.jsp");
				String name = uid;
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
			}
			else {
				System.out.println("RTURNED FALSE");
				String error = "<i class=\"fas fa-exclamation-circle\"></i> Sorry username or password incorrect";
				request.setAttribute("error", error);
				request.setAttribute("logintype", logintype);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		if(logintype.equals("Academic")) {
			String usertype = "AcademicStaff";
			User academicUser = new Academic();
			if(academicUser.authenticateUser(uid, pwd, usertype)) {
				response.sendRedirect("academic.jsp");
				String name = uid;
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
			}
			else {
				System.out.println("RTURNED FALSE");
				String error = "<i class=\"fas fa-exclamation-circle\"></i> Sorry username or password incorrect";
				request.setAttribute("error", error);
				request.setAttribute("logintype", logintype);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		if(logintype.equals("NonAcademic")) {
			String usertype = "NonAcademicStaff";
			User nonAcademicUser = new NonAcademic();
			if(nonAcademicUser.authenticateUser(uid, pwd, usertype)) {
				if(nonAcademicUser.getAdmin()) {
					response.sendRedirect("admin.jsp");
					String name = uid;
					HttpSession session = request.getSession();
					session.setAttribute("name", name);
				}
				else {
					System.out.println("RTURNED nonac");
					response.sendRedirect("nonacademic.jsp");
					String name = uid;
					HttpSession session = request.getSession();
					session.setAttribute("name", name);
				}
			}
			else {
				System.out.println("RTURNED FALSE");
				String error = "<i class=\"fas fa-exclamation-circle\"></i> Sorry username or password incorrect";
				request.setAttribute("error", error);
				request.setAttribute("logintype", logintype);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		if(uid.equals(null)) {
			String error = "<i class=\"fas fa-exclamation-circle\"></i> Sorry username not available";
			request.setAttribute("error", error);
			request.setAttribute("logintype", logintype);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		out.close();
	}

}
