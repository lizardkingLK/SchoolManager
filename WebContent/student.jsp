<%@ page import="java.util.List" %>
<%@ page import="com.user.Student" %>
<%@ page import="com.subject.*" %>
<%@ page import="com.result.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	HttpSession sesschecker = request.getSession();
	if( sesschecker.getAttribute("name") == null ) {
		response.sendRedirect("login.jsp");
	}
%>
<% 
	String studentid = (String) session.getAttribute("name");
	String studentname = null;
	String username = null;
	String enteredegrade = null;
	String currentGrade = null;
	String birthdate = null;
	String registeredDate = null;
	String phone = null;
	String address = null;
	String bio = null;
	String email = null;
	String password = null;
	String status = null;
	String link = null;
%>
<%
	Student thisStudent = new Student();
	thisStudent = thisStudent.loadAndSetInstance(studentid);
	studentname = thisStudent.getName();
	
	if(studentname == null)
		response.sendRedirect("login.jsp");
	
	username = thisStudent.getUserName();
	enteredegrade = thisStudent.getEnteredGrade();
	currentGrade = thisStudent.getCurrentGrade();
	birthdate = thisStudent.getBirthdate();
	registeredDate = thisStudent.getRegistereddate();
	phone = thisStudent.getPhone();
	address = thisStudent.getAddress();
	bio = thisStudent.getBio();
	email = thisStudent.getEmail();
	password = thisStudent.getPassword();
	status = thisStudent.getStatus();
	link = thisStudent.getLink();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--dependencies-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="./CSS/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" 
href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"> 
<link rel="stylesheet" href="./CSS/schoolmanagerstyles.css">

<!--dependencies for this page-->
<link rel="stylesheet" href="./CSS/studentstyles.css">

<title>School Manager|Student</title>
</head>

<body>
	<div class="bg-success shadow-primary-bottom" id="navi">
		<div class="p-1">
			<div class="container">
					<h2 class="d-inline-flex text-light">Welcome <% out.print(studentname); %></h2>				
					<a href="./index.html"><small class="d-inline-flex text-light float-right">SchoolManager v1.0</small></a>
					<div class="spinner-border float-right" id="loader" role="status">
					  <span class="sr-only">Loading...</span>
					</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
	<!-- Start  -->
	<div class="container">
		<div class="row">
			<div class="col-8">
				<div class="d-sm-flex p-2">
					<ul class="d-inline-flex row-flex text-light mx-auto">
						<li><a href="logout" class="btn btn-link btn-sm rounded-pill text-light">Logout</a></li>
						<li><button type="button" class="btn btn-outline-success btn-sm rounded-pill text-light" id="profilebtn">My Profile</button></li>
						<li><button type="button" class="btn btn-outline-success btn-sm rounded-pill text-light" id="subjectsbtn">Subjects</button></li>
						<li><button type="button" class="btn btn-outline-success btn-sm rounded-pill text-light" id="examsresultsbtn">Student Report</button></li>
					</ul>
				</div>
			</div>
			
			<div class="col-4">
				<p class="text-success mt-3 radiocheckedlabel bg-light" id="radiocheckedlabel">${result}</p>
			</div>	
		</div>
	</div>
	
	<!-- User Profile -->
	<div class="container emp-profile" id="profilewindow">
		<div class="row">
               <div class="col-md-4">
                   <div class="profile-img">
                       <img id ="profilePicture" src="./images/link/s000000001.jpg" alt="your profile picture"/><div class="clearfix"></div>
                   </div>
               </div>
                  
               <div class="col-md-6">
                   <div class="profile-head">
                    <h5><%=studentname %></h5>
                    <h6>Student</h6>
                    <p class="proile-rating"> <%=currentGrade %> </p>
              			<ul class="nav nav-tabs" id="myTab" role="tablist">
                  			<li class="nav-item">
                      			<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                  			</li>
              			</ul>
                 </div>
               </div>
                   
               <div class="col-md-2">
                   <button class="btn btn-sm btn-outline-success rounded-pill" id="editprofilebtn">Edit Profile</button>
               </div>
        </div>
              
        <div class="row">
                <div class="col-md-8">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        	<div class="row">
                             <div class="col-md-6">
                                 <label>User ID</label>
                             </div>
                             <div class="col-md-6">
                                 <p><%=studentid %></p>
                             </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>BirthDate</label>
                                </div>
                                <div class="col-md-6">
                                    <p><%=birthdate %></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Email</label>
                                </div>
                                <div class="col-md-6">
                                    <p><%=email %></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Phone</label>
                                </div>
                                <div class="col-md-6">
                                    <p><%=phone %></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Address</label>
                                </div>
                                <div class="col-md-6">
                                    <p><%=address %></p>
                                </div>
                            </div>
                  		</div>
				</div>
			</div>
		</div>
	</div>    

	<!-- EDIT PROFILE MODAL -->
	<div class="container">
		<div class="modal" id="editprofilewindow">
			<!-- Modal Content -->
			<div class="modal-content">
				<div class="card-header">
					<h4 class="text-primary float-left p-1">Edit Profile Details</h4>
					<button class="btn btn-link float-right Vbtn"><span class="close">&times;</span></button><div class="clearfix"></div>
				</div>
				<div class="card-body">
					<form action="editprofileStudent" method="POST" id="editprofileform">
						<div class="row">
							<div class="col-6">
								<div class="form-group row">
							    	<label for="inputUsername" class="col-sm-2 col-form-label">Username</label>	
							    	<div class="col-sm-5">
							    		<input name="editusername" type="text" class="form-control" id="editusernametxt" placeholder="Enter username" value="<%=username %>">
							    	</div>
							    	<div class="col-sm-5">
							    		<small class="col-sm-2 text-primary text-center" id="messageeditUsername"></small>
							    	</div>
							  	</div>
						
							  	<div class="form-group row">
							    	<label for="inputPhone" class="col-sm-2 col-form-label">Phone</label>
							    	<div class="col-sm-5">
							    		<input name="editphone" type="text" class="form-control" id="editphonetxt" placeholder="xxxxxxxxxx" value="<%=phone %>">
							    	</div>
							    	<div class="col-sm-5">
							    		<small class="col-sm-2 text-primary text-center" id="messageeditPhone"></small>
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
							    	<div class="col-sm-10">
							    		<input name="editaddress" type="text" class="form-control" id="editaddresstxt" placeholder="Enter address" value="<%=address %>">
							    	</div><br>
							    	<div class="col-sm-12">
							    		<small class="col-sm-2 text-primary text-center" id="messageeditAddress"></small>
							    	</div>
							  	</div>
							  
							  	<div class="form-group row">
									<div class="col-sm-10">
										<input name="editprofileidtxt" type="hidden" class="btn btn-outline-primary rounded-pill" id="editidtxt" value="<%=studentid %>">
								    	<input name="editprofilesubmit" type="submit" class="btn btn-outline-primary rounded-pill" id="editsubmit" value="DONE">
								    </div>
								</div>
							</div>
							
							<div class="col-6">
								<div class="form-group row">
							    	<label for="inputBio" class="col-sm-2 col-form-label">Bio</label>
							    	<div class="col-sm-10">
							    		<input name="editbio" type="text" class="form-control" id="editbiotxt" placeholder="Enter Bio" value="<%=bio %>">
							    	</div><br>
							    	<div class="col-sm-12">
							    		<small class="col-sm-2 text-primary text-center" id="messageeditBio"></small>
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
							    	<div class="col-sm-10">
							    		<input name="editemail" type="text" class="form-control" id="editemailtxt" placeholder="Enter valid Email" value="<%=email %>">
							    	</div><br>
							    	<div class="col-sm-12">
							    		<small class="col-sm-2 text-primary text-center" id="messageeditEmail"></small>
							    	</div>
							  	</div>
								
								<div class="form-group row">
							    	<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
							    	<div class="col-sm-5">
							    		<input name="editpassword" type="password" class="form-control" id="editpasswordtxt_A" placeholder="Change password" value="<%=password %>">
							    		<input type="password" class="form-control" id="editpasswordtxt_B" placeholder="ReEnter password" value="">
							    	</div>
							    	<div class="col-sm-5">
							    		<small class="col-sm-2 text-primary text-center" id="messageeditPassword"></small>
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputLink" class="col-sm-2 col-form-label">Link</label>
							    	<div class="col-sm-10">
							    		<input name="editlink" type="text" class="form-control" id="editlinktxt" placeholder="Change profile picture" value="<%=link %>">
							    	</div><br>
							    	<div class="col-sm-12">
							    		<small class="col-sm-2 text-primary text-center" id="messageeditLink"></small>
							    	</div>
							  	</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Subjects window -->
	<div class="container" id="subjectswindow">
			<div class="card">	
				<div class="p-1">
					<h4 class="text-warning float-right p-2 mr-4 mt-3">My Subjects</h4><div class="clearfix"></div>
				</div>
			</div>
			<div class="card" id="mainview">
				<div class="row">
					<div class="col-1"></div>
					
					<div class="col-11">
						<div class="table-responsive" id="mysubjecttable">
							<table class="table table-sm" id="mysubjecttableactual">
								<thead>
							  		<tr>
							    		<th scope="col">SubjectID</th>
							    		<th scope="col">Subject Name</th>
							    		<th scope="col">Medium</th>
							    		<th scope="col">Teacher</th>
							  		</tr>
							  	</thead>
							  	<tbody>
							  		<%
							  		List<Subject> subjectlist = SubjectDao.getRecordsforStudent(studentid);
									
							  		for(Subject su:subjectlist) {
							  			out.print("<tr><th scope=\"row\"><p>"
							  						+su.getSubjectID()+"</p></th><td><p>"
							  						+su.getSubjectName()+"</p></td><td><p>"
							  						+su.getMedium()+"</p></td><td><p>"
							  						+su.getTeacherName()+"</p></td>");					  						
							  		}
							  		%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

<!-- Exams and Results window -->
<div class="container" id=examsresultswindow>
		<div class="card">	
			<div class="p-1">
				<h4 class="text-success float-right p-2 mr-4 mt-3">My Student Report</h4><div class="clearfix"></div>
			</div>
		</div>
		<div class="card" id="mainview">
			<div class="row">
				<div class="col-1"></div>
				
				<div class="col-11">
					<div class="table-responsive" id="myreport">
						<table class="table table-sm" id="myreporttableactual">
							<thead>
						  		<tr>
						    		<th scope="col">Subject Name</th>
						    		<th scope="col">Medium</th>
						    		<th scope="col">Term</th>
						    		<th scope="col">Marks</th>
						  		</tr>
						  	</thead>
						  	<tbody>
						  		<%
						  		List<Result> resultlist = ResultDao.getResults(studentid);
								
						  		for(Result r:resultlist) {
						  			out.print("<tr><th scope=\"row\"><p>"
						  						+r.getSubjectID()+"</p></th><td><p>"
						  						+r.getMedium()+"</p></td><td><p>"
						  						+r.getTerm()+"</p></td><td><p>"
						  						+r.getResultDescription()+"</p></td>");					  						
						  		}
						  		%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- End -->
<script type="text/javascript">
$(document).ready(function() {
	console.log("SchoolManager v.10");
	
	$('#subjectswindow').hide();
	$('#examsresultswindow').hide();
	
	$('#editprofilebtn').on('click',function() {
		$('#editprofilewindow').fadeIn(250);
	});	
	
	$('#subjectsbtn').on('click',function() {
		$('#profilewindow').hide();
		$('#examsresultswindow').hide();
		$('#subjectswindow').fadeToggle(250);
	});
	
	$('#profilebtn').on('click',function() {
		$('#subjectswindow').hide();
		$('#examsresultswindow').hide();
		$('#profilewindow').fadeToggle(250);
	});
	
	$('#examsresultsbtn').on('click',function() {
		$('#profilewindow').hide();
		$('#subjectswindow').hide();
		$('#examsresultswindow').fadeToggle(250);
	});
	
	$('.Vbtn').on('click',function() {
		$('.modal').fadeOut(250);
	});
	
	$('#radiocheckedlabel').mouseover(function() {
		$('#radiocheckedlabel').fadeOut(250);
	});
});
</script>
<script type="text/javascript" src="./JS/loader.js"></script>
</body>
</html>