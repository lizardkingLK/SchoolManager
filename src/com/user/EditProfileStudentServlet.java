package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditProfileStudentServlet")
public class EditProfileStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditProfileStudentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String editusername = request.getParameter("editusername");
		String editphone = request.getParameter("editphone");
		String editaddress = request.getParameter("editaddress");
		String editbio = request.getParameter("editbio");
		String editemail = request.getParameter("editemail");
		String editpassword = request.getParameter("editpassword");
		String editlink = request.getParameter("editlink");
		String editprofileidtxt = request.getParameter("editprofileidtxt");
		
		System.out.println(editusername+" "+editphone+" "+editaddress+" "+editbio+" "+editemail+" "+editpassword+" "+editlink+" "+editprofileidtxt+" ");
		
		Student studprofile = new Student();
		
		studprofile.setId(editprofileidtxt);
		studprofile.setUserName(editusername);
		studprofile.setPhone(editphone);
		studprofile.setAddress(editaddress);
		studprofile.setBio(editbio);
		studprofile.setEmail(editemail);
		studprofile.setPassword(editpassword);
		studprofile.setLink(editlink);
		
		if(StudentDao.editProfile(studprofile)) {
			System.out.println("edit profile SUccess");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Edit Profile Successful";
			request.setAttribute("result", result);
			request.getRequestDispatcher("student.jsp").forward(request, response);
		}
		else {
			System.out.println("edit profile FAiled");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Edit Profile Failed";
			request.setAttribute("result", result);
			request.getRequestDispatcher("student.jsp").forward(request, response);
		}
	}

}
