<%@ page import="com.user.Academic" %>
<%@ page import="java.util.List" %>
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

<% String name = (String) session.getAttribute("name"); %>

<%
	Academic thisAcademic = new Academic();
	thisAcademic = thisAcademic.loadAndSetInstance(name);
	
	String id,email,phone,address,birthdate,registereddate,userName,designation,password,bio,
	status,qualification,salary,priorityLevel,link;
	
	name = thisAcademic.getName();

	if(name == null)
		response.sendRedirect("login.jsp");
	
	id = thisAcademic.getId();
	email = thisAcademic.getEmail();
	phone = thisAcademic.getPhone();
	address = thisAcademic.getAddress();
	birthdate = thisAcademic.getBirthdate();
	registereddate = thisAcademic.getRegistereddate();
	userName = thisAcademic.getUserName();
	designation = thisAcademic.getDesignation();
	password = thisAcademic.getPassword();
	bio = thisAcademic.getBio();
	status = thisAcademic.getStatus();
	qualification = thisAcademic.getQualification();
	salary = thisAcademic.getSalary();
	link = thisAcademic.getLink();
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
<link rel="stylesheet" href="./CSS/academicstyles.css">

<title>School Manager|Academic</title>
</head>

<body>
	<div class="bg-danger shadow-primary-bottom" id="navi">
		<div class="p-1">
			<div class="container">
				<h2 class="d-inline-flex text-light">Welcome <% out.print(name); %></h2>
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
						<li><button type="button" class="btn btn-outline-danger btn-sm rounded-pill text-light" id="profilebtn">My Profile</button></li>
						<li><button type="button" class="btn btn-outline-danger btn-sm rounded-pill text-light" id="subjectsbtn">Subjects</button></li>
						<li><button type="button" class="btn btn-outline-danger btn-sm rounded-pill text-light" id="updateresultsbtn">Update Results</button></li>
					</ul>
				</div>
			</div>
			
			<div class="col-4">
				<p class="text-danger mt-3 radiocheckedlabel bg-light rounded-pill" id="radiocheckedlabel">${result}</p>
			</div>	
		</div>
	</div>
	
	<!-- User Profile -->
	<div class="container emp-profile" id="profilewindow">
		<div class="row">
               <div class="col-md-4">
                   <div class="profile-img">
                       <img id ="profilePicture" src="./images/building-ceiling-classroom-373488.jpg" alt="your profile picture"/><div class="clearfix"></div>
                   </div>
               </div>
                  
               <div class="col-md-6">
                   <div class="profile-head">
                    <h5><%=name %></h5>
                    <h6>Teacher</h6>
                    <p class="proile-rating"> <%=designation %> </p>
              			<ul class="nav nav-tabs" id="myTab" role="tablist">
                  			<li class="nav-item">
                      			<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                  			</li>
              			</ul>
                 </div>
               </div>
                   
               <div class="col-md-2">
                   <button class="btn btn-sm btn-outline-danger rounded-pill" id="editprofilebtn">Edit Profile</button>
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
                                 <p><%=id %></p>
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
					<form action="editprofileAcademic" method="POST" id="editprofileform">
						<div class="row">
							<div class="col-6">
								<div class="form-group row">
							    	<label for="inputUsername" class="col-sm-2 col-form-label">Username</label>	
							    	<div class="col-sm-5">
							    		<input name="editusername" type="text" class="form-control" id="editusernametxt" placeholder="Enter username" value="<%=userName %>">
							    	</div>
							    	<div class="col-sm-5">
							    		<small class="col-sm-2 text-primary text-center" id="messageeditUsername"></small>
							    	</div>
							  	</div>
								
								<div class="form-group row">
							    	<label for="inputDesignation" class="col-sm-2 col-form-label">Designation</label>
							    	<div class="col-sm-5">
							    		<input name="editdesignation" type="text" class="form-control" id="editdesignationtxt" placeholder="Enter designation" value="<%=designation %>">
							    	</div>
							    	<div class="col-sm-5">
							    		<small class="col-sm-2 text-primary text-center" id="messageeditDesignation"></small>
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
										<input name="editprofileidtxt" type="hidden" class="btn btn-outline-primary rounded-pill" id="editidtxt" value="<%=id %>">
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
					<div class="col-3"></div>
					
					<div class="col-6">
						<div class="table-responsive" id="mysubjecttable">
							<table class="table table-sm mx-auto" id="mysubjecttableactual">
								<thead>
							  		<tr>
							    		<th scope="col">SubjectID</th>
							    		<th scope="col">Subject Name</th>
							    		<th scope="col">Medium</th>
							    		<th scope="col">Grade</th>
							  		</tr>
							  	</thead>
							  	<tbody>
							  		<%
							  		List<Subject> mysubjectlist = SubjectDao.getAcademicSubjects(id);
									
							  		for(Subject su:mysubjectlist) {
							  			out.print("<tr><th scope=\"row\"><p>"
							  						+su.getSubjectID()+"</p></th><td><p>"
							  						+su.getSubjectName()+"</p></td><td><p>"
							  						+su.getMedium()+"</p></td><td><p>"
							  						+su.getGrade()+"</p></td>");					  						
							  		}
							  		%>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="col-3"></div>
				</div>
			</div>
		</div>
	
	<!-- Results window -->
	<div class="container" id="updateresultswindow"><!-- #e83e8c -->
		<div class="card">	
			<div class="row p-1">
				<div class="col-4">
					<button class="roundbtn-result text-center" id="addresultbtn"><i class="fas fa-user-plus"></i><br>Add</button>
					<button class="roundbtn-result text-center" id="updateresultbtn"><i class="fas fa-user-plus"></i><br>Update</button>
					<button class="roundbtn-result text-center" id="searchstudentbtn"><i class="fa fa-search"></i><br>Search</button>
				</div>
				
				<div class="col-1"></div>
				
				<div class="col-4">
					<div class="my-3" id="searchresultlayout">
						<div class="col-3 d-sm-flex" id="searchresult">
							<div class="form-inline">
							  <div class="form-group mx-sm-3 mb-2">
							    <input type="text" class="form-control rounded-pill text-danger" id="resultsearch" name="resultsearchbox" placeholder="Search Result" onkeyup="searchResult()">
							  </div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-1"></div>
				
				<div class="col-2">
					<h4 class="text-danger float-right p-2 mr-4 mt-3">Results</h4><div class="clearfix"></div>
				</div>
			</div><div class="clearfix"></div>
		</div>
		
		<div class="card" id="mainview">
			<div class="row">
				<div class="col-1">
					<button class="btn btn-danger btn-sm m-1" id="resulttablebtn">Table</button>
				</div>
				
				<div class="col-11" id="resulttablelayout">
					<div class="table-responsive" id="resulttable">
						<table class="table table-sm" id="resulttableactual">
							<thead>
						  		<tr>
						    		<th scope="col">ResultID</th>
						    		<th scope="col">StudentID</th>
						    		<th scope="col">StudentName</th>
						    		<th scope="col">Grade</th>
						    		<th scope="col">SubjectName</th>
						    		<th scope="col">Medium</th>
						    		<th scope="col">Term</th>
						    		<th scope="col">Marks</th>
						    		<th scope="col" class="text-danger">select</th>
						  		</tr>
						  	</thead>
						  	<tbody>
						  		<%
						  		for(Subject su:mysubjectlist) {
						  			List<Result> resultlist = ResultDao.getResultsByTeacher(su.getSubjectID());
						  			
						  			for(Result r:resultlist) {
						  				out.print("<tr><th scope=\"row\">"
						  						+r.getResultID()+"</th><td>"
						  						+r.getStudentID()+"</td><td>"
						  						+r.getStudentName()+"</td><td>"
						  						+r.getGrade()+"</td><td>"
						  						+r.getSubjectName()+"</td><td>"
						  						+r.getMedium()+"</td><td>"
						  						+r.getTerm()+"</td><td>"
						  						+r.getResultDescription()+"</td><td>"
						  						+"</td><td>"
				  									+"<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"resultidradio\" id=\"resultidradio\" value="+r.getResultDescription()+"></div>"
				  								+"</td><tr>");
						  			}
						  		}
						  		%>	
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
		
<script type="text/javascript">
$(document).ready(function() {
	console.log("SchoolManager v.10");
	
	$('#subjectswindow').hide();
	$('#updateresultswindow').hide();
	
	$('#profilebtn').on('click',function() {
		$('#subjectswindow').hide();
		$('#updateresultswindow').hide();
		$('#profilewindow').fadeToggle(250);
	});
	
	$('#subjectsbtn').on('click',function() {
		$('#profilewindow').hide();
		$('#updateresultswindow').hide();
		$('#subjectswindow').fadeToggle(250);
	});
	
	$('#updateresultsbtn').on('click',function() {
		$('#profilewindow').hide();
		$('#subjectswindow').hide();
		$('#updateresultswindow').fadeToggle(250);
	});
	
	$('#editprofilebtn').on('click',function() {
		$('#editprofilewindow').fadeIn(250);
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