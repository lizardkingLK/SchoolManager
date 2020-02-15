package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditProfileAcademicServlet")
public class EditProfileAcademicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditProfileAcademicServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String editusername = request.getParameter("editusername");
		String editdesignation = request.getParameter("editdesignation");
		String editphone = request.getParameter("editphone");
		String editaddress = request.getParameter("editaddress");
		String editqualifications = request.getParameter("editqualifications");
		String editbio = request.getParameter("editbio");
		String editemail = request.getParameter("editemail");
		String editpassword = request.getParameter("editpassword");
		String editlink = request.getParameter("editlink");
		String editprofileidtxt = request.getParameter("editprofileidtxt");
		
		System.out.println(editusername+" "+editdesignation+" "+editphone+" "+editaddress+" "+editqualifications+" "+editbio+" "+editemail+" "+editpassword+" "+editlink+" "+editprofileidtxt+" ");
		
		Academic acprofile = new Academic();
		
		acprofile.setId(editprofileidtxt);
		acprofile.setUserName(editusername);
		acprofile.setDesignation(editdesignation);
		acprofile.setPhone(editphone);
		acprofile.setAddress(editaddress);
		acprofile.setQualification(editqualifications);
		acprofile.setBio(editbio);
		acprofile.setEmail(editemail);
		acprofile.setPassword(editpassword);
		acprofile.setLink(editlink);
		
		if(AcademicDao.editProfile(acprofile)) {
			System.out.println("edit profile SUccess");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Edit Profile Successful";
			request.setAttribute("result", result);
			request.getRequestDispatcher("academic.jsp").forward(request, response);
		}
		else {
			System.out.println("edit profile FAiled");
			String result = "<i class=\"fas fa-exclamation-circle\"></i> Sorry Edit Profile Failed";
			request.setAttribute("result", result);
			request.getRequestDispatcher("academic.jsp").forward(request, response);
		}
	}

}
