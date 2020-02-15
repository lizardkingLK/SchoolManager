package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RemoveNonAcademicServlet")
public class RemoveNonAcademicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveNonAcademicServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String nonacid = request.getParameter("removenonacademicid");
		
		if(NonAcademicDao.removeNonAcademic(nonacid)) {
			System.out.println("remove NonAcademic SUccess");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Remove NonAcademic Successful";
			request.setAttribute("result", result);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
		else {
			System.out.println("remove NonAcademic FAiled");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Remove NonAcademic Failed";
			request.setAttribute("result", result);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
	}

}
