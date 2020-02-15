package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RemoveAcademicServlet")
public class RemoveAcademicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveAcademicServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String acid = request.getParameter("removeacademicid").toString();
		
		if(AcademicDao.removeAcademic(acid)) {
			System.out.println("remove academic SUccess");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Remove Academic Successful";
			request.setAttribute("result", result);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
		else {
			System.out.println("remove Academic FAiled");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Remove Academic Failed";
			request.setAttribute("result", result);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
	}

}
