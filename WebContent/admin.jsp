<%@ page import="com.user.*" %>
<%@ page import="com.subject.*" %>
<%@ page import="com.sport.*" %>
<%@ page import="com.exam.*" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List" %>
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
	NonAcademic thisAdmin = NonAcademic.getNonAcademicSingleton();
	thisAdmin = thisAdmin.loadAndSetInstance(name);
	
	String id,email,phone,address,birthdate,registereddate,userName,designation,password,bio,
	status,qualification,salary,priorityLevel,link;
	
	name = thisAdmin.getName();
	id = thisAdmin.getId();
	email = thisAdmin.getEmail();
	phone = thisAdmin.getPhone();
	address = thisAdmin.getAddress();
	birthdate = thisAdmin.getBirthdate();
	registereddate = thisAdmin.getRegistereddate();
	userName = thisAdmin.getUserName();
	designation = thisAdmin.getDesignation();
	password = thisAdmin.getPassword();
	bio = thisAdmin.getBio();
	status = thisAdmin.getStatus();
	qualification = thisAdmin.getQualification();
	salary = thisAdmin.getSalary();
	priorityLevel = thisAdmin.getPriorityLevel();
	link = thisAdmin.getLink();
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

<!-- dependencies for this page -->
<link rel="stylesheet" href="./CSS/adminstyles.css">

<title>School Manager|Administrator</title>
</head>

<body>
	<div class="bg-dark shadow-primary-bottom" id="navi">
		<div class="p-1">
			<div class="container">
				<h2 class="d-inline-flex text-light">Welcome <% out.print(name); %></h2>
				<a href="./index.html"><small class="d-inline-flex text-light float-right">SchoolManager v1.0</small></a>
					<div class="spinner-border float-right text-light" id="loader" role="status">
					  <span class="sr-only">Loading...</span>
					</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-8">
				<div class="d-sm-flex p-2">
					<ul class="d-inline-flex row-flex text-light mx-auto">
						<li><a href="logout" class="btn btn-link btn-sm rounded-pill my-2">Logout</a></li>
						<li><button type="button" class="btn btn-sm btn-outline-secondary rounded-pill my-2" id="studentbtn">Student</button></li>
						<li><button type="button" class="btn btn-sm btn-outline-secondary rounded-pill my-2" id="academicbtn">Academic Staff</button></li>
						<li><button type="button" class="btn btn-sm btn-outline-secondary rounded-pill my-2" id="nonacademicbtn">NonAcademic Staff</button></li>
						<li><button type="button" class="btn btn-sm btn-outline-secondary rounded-pill my-2" id="morebtn">Manage</button></li>
					</ul>
				</div>
			</div>
			
			<div class="col-4">
				<p class="text-info mt-3 radiocheckedlabel" id="radiocheckedlabel">${result}</p>
			</div>
		</div>
	</div>
	
	<!-- STUDENT'S -->
	<div class="container" id="viewAllStudent">
		<div class="card">	
			<div class="row p-1">
				<div class="col-4">
					<button class="roundbtn-student text-center" id="addstudentbtn"><i class="fas fa-user-plus"></i><br>Add</button>
					<button class="roundbtn-student text-center" id="searchstudentbtn"><i class="fa fa-search"></i><br>Search</button>
					<button class="roundbtn-student text-center" id="updatestudentbtn"><i class="fa fa-window-restore"></i><br>Update</button>
					<button class="roundbtn-student text-center" id="removestudentbtn"><i class="fa fa-user-times"></i><br>Remove</button>
				</div>
				
				<div class="col-1"></div>
				
				<div class="col-4">
					<div class="my-3" id="searchstudentlayout">
						<div class="col-3 d-sm-flex" id="searchstudent">
							<div class="form-inline">
							  <div class="form-group mx-sm-3 mb-2">
							    <input type="text" class="form-control rounded-pill text-success" id="studentsearch" name="studentsearchbox" placeholder="Search Student" onkeyup="searchStudent()">
							  </div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-1"></div>
				
				<div class="col-2">
					<h4 class="text-success float-right p-2 mr-4 mt-3">Student</h4><div class="clearfix"></div>
				</div>
			</div><div class="clearfix"></div>
		</div>
		
		<div class="card" id="mainview">
			<div class="row">
				<div class="col-1">
					<button class="btn btn-success btn-sm m-1" id="studenttablebtn">Table</button>
				</div>
				
				<div class="col-11" id="studenttablelayout">
					<div class="table-responsive" id="studenttable">
						<table class="table table-sm" id="studenttableactual">
							<thead>
						  		<tr>
						    		<th scope="col">ID</th>
						    		<th scope="col">Name</th>
						    		<th scope="col">EnteredTo</th>
						    		<th scope="col">NowIn</th>
						    		<th scope="col">BirthDate</th>
						    		<th scope="col">EntryDate</th>
						    		<th scope="col">PhoneNo</th>
						    		<th scope="col">Address</th>
						    		<th scope="col">Email</th>
						    		<th scope="col">Status</th>
						    		<th scope="col" class="text-danger">select</th>
						  		</tr>
						  	</thead>
						  	<tbody>
						  		<%
						  		List<Student> studentlist = StudentDao.getRecords();
								
						  		for(Student s:studentlist) {
						  			out.print("<tr><th scope=\"row\">"
						  						+s.getId()+"</th><td>"
						  						+s.getName()+"</td><td>"
						  						+s.getEnteredGrade()+"</td><td>"
						  						+s.getCurrentGrade()+"</td><td>"
						  						+s.getBirthdate()+"</td><td>"
						  						+s.getRegistereddate()+"</td><td>"
						  						+s.getPhone()+"</td><td>"
						  						+s.getAddress()+"</td><td>"
						  						+s.getEmail()+"</td><td>"
						  						+s.getStatus()+"</td>"
						  						+"</td><td>"
				  									+"<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"studentidradio\" id=\"studentidradio\" value="+s.getId()+"></div>"
				  								+"</td><tr>");
						  		}	
						  		%>	
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Add Student -->
	<div class="container">
		<div class="modal" id="addstudentwindow">
			<!-- Modal Content -->
			<div class="modal-content">
				<div class="card-header">
					<h4 class="text-success float-left p-1">Add New Student</h4>
					<button class="btn btn-link float-right Vbtn"><span class="close">&times;</span></button><div class="clearfix"></div>
				</div>
				<div class="card-body p-3">
					<form action="addStudent" method="POST" id="addstudentform">
						<div class="row">
							<div class="col-1"></div>
							
							<div class="col-5">
								<div class="form-group row">
							    	<label for="inputName" class="col-sm-2 col-form-label">Name</label>
							    	<div class="col-sm-10">
							    		<input name="addstudentname" type="text" class="form-control" id="addstudentnametxt" placeholder="Enter Name">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputGrade" class="col-sm-2 col-form-label">Grade</label>
							    	<div class="col-sm-5">
							      		<select name="addstudentgrade" class="form-control form-control-sm" id="addstudentgradeselect">
										  <option value="">(Select)</option>
										  <option value="Grade 1">Grade 1</option>
										  <option value="Grade 2">Grade 2</option>
										  <option value="Grade 3">Grade 3</option>
										  <option value="Grade 4">Grade 4</option>
										  <option value="Grade 5">Grade 5</option>
										  <option value="Grade 6">Grade 6</option>
										  <option value="Grade 7">Grade 7</option>
										  <option value="Grade 8">Grade 8</option>
										  <option value="Grade 9">Grade 9</option>
										  <option value="Grade 10">Grade 10</option>
										  <option value="Grade 11">Grade 11</option>
										  <option value="Grade 12">Grade 12</option>
										</select>
							    	</div>
							  	</div>
							  	
							 	<div class="form-group row">
							    	<label for="inputBirthdate" class="col-sm-2 col-form-label">BirthDate</label>
							    	<div class="col-sm-4">
							    		<input name="addstudentbirthdate" type="text" class="form-control" id="addstudentbirthdatetxt" placeholder="yyyy-mm-dd">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputPhone" class="col-sm-2 col-form-label">Phone</label>
							    	<div class="col-sm-4">
							    		<input name="addstudentphone" type="text" class="form-control" id="addstudentphonetxt" placeholder="xxxxxxxxxx">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
							    	<div class="col-sm-10">
							    		<input name="addstudentaddress" type="text" class="form-control" id="addstudentaddresstxt" placeholder="Enter address">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputStudentID" class="col-sm-2 col-form-label">StudentID</label>	<% String newStudentID = StudentDao.getNewStudentID(); %>	
							    	<div class="col-sm-5">
							    		<input name="addstudentid" type="text" class="form-control-plaintext" id="addstudentidtxt" placeholder="Student ID" value="<% out.print(newStudentID); %>" readonly>
							    	</div>
							  	</div>
								
								<div class="form-group row">
									<div class="col-sm-10">
								    	<input name="addstudent" type="submit" class="btn btn-success" id="addstudentsubmit" value="ADD">
								    </div>
								</div>
							</div>
							
							<div class="col-5">
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageName"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageGrade"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageBirthdate"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messagePhone"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageAddress"></small></div>
								</div>
							</div>
							
							<div class="col-1"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Update Student -->
	<div class="container">
		<div class="modal" id="updatestudentwindow">
			<!-- Modal Content -->
			<div class="modal-content">
				<div class="card-header">
					<h4 class="text-success float-left p-1">Update Student Details</h4>
					<button class="btn btn-link float-right Vbtn"><span class="close">&times;</span></button><div class="clearfix"></div>
				</div>
				<div class="card-body p-3">
					<form action="updateStudent" method="POST" id="updatestudentform">
						<div class="row">
							<div class="col-1"></div>
							
							<div class="col-5">
								<div class="form-group row">
							    	<label for="inputStudentID" class="col-sm-2 col-form-label">StudentID</label>	
							    	<div class="col-sm-5">
							    		<input name="updatestudentid" type="text" class="form-control-plaintext" id="updatestudentidtxt" placeholder="Student ID" value="" readonly>
							    	</div>
							  	</div>
							  	
								<div class="form-group row">
							    	<label for="inputName" class="col-sm-2 col-form-label">Name</label>
							    	<div class="col-sm-10">
							    		<input name="updatestudentname" type="text" class="form-control" id="updatestudentnametxt" placeholder="Enter Name" value="">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputGrade" class="col-sm-2 col-form-label">Current Grade</label>
							    	<div class="col-sm-5">
							    		<select name="updatestudentgrade" class="form-control form-control-sm" id="updatestudentgradeselect"><option value="">(Select)</option><option value="Grade 1">Grade 1</option><option value="Grade 2">Grade 2</option><option value="Grade 3">Grade 3</option><option value="Grade 4">Grade 4</option><option value="Grade 5">Grade 5</option><option value="Grade 6">Grade 6</option><option value="Grade 7">Grade 7</option><option value="Grade 8">Grade 8</option><option value="Grade 9">Grade 9</option><option value="Grade 10">Grade 10</option><option value="Grade 11">Grade 11</option><option value="Grade 12">Grade 12</option><option value="Grade 12">Grade 13</option></select>
							    	</div>
							  	</div>
							  
							 	<div class="form-group row">
							    	<label for="inputBirthdate" class="col-sm-2 col-form-label">BirthDate</label>
							    	<div class="col-sm-4">
							    		<input name="updatestudentbirthdate" type="text" class="form-control" id="updatestudentbirthdatetxt" placeholder="yyyy-mm-dd" value="">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputPhone" class="col-sm-2 col-form-label">Phone</label>
							    	<div class="col-sm-4">
							    		<input name="updatestudentphone" type="text" class="form-control" id="updatestudentphonetxt" placeholder="xxxxxxxxxx" value="">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
							    	<div class="col-sm-10">
							    		<input name="updatestudentaddress" type="text" class="form-control" id="updatestudentaddresstxt" placeholder="Enter address" value="">
							    	</div>
							  	</div>
								
								<div class="form-group row">
									<div class="col-sm-10">
								    	<input name="updatestudent" type="submit" class="btn btn-success" id="updatestudentsubmit" value="UPDATE">
								    </div>
								</div>
							</div>
							
							<div class="col-5">
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageupdateName"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageupdateGrade"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageupdateBirthdate"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageupdatePhone"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageupdateAddress"></small></div>
								</div>
							</div>
							
							<div class="col-1"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Remove Student -->
	<div class="container">
		<div class="modal removestudentwindow" id="removewindow">
			<!-- Modal Content -->
			<div class="modal-content" id="removewindowbody">
				<div class="card-header">
					<h4 class="text-success float-left p-1">Remove Student</h4>
					<button class="btn btn-link float-right Vbtn"><span class="close">&times;</span></button><div class="clearfix"></div>
				</div>
				<div class="card-body">
					<div class="row" style="margin-top: 1%;">
						<div class="col-4">
							<h4>Do you want to remove this Student from the System?</h4>
							<label id="removestudentdisplay"></label>
						</div>
						
						<div class="col-4">
							<form action="removeStudent" method="POST" id="removestudentform">
								<input type="hidden" name="removestudentid" id="removestudentidinput" value="">
								<button class="btn btn-sm btn-outline-success rounded-pill" id="yesoptionstudent">YES</button>
							</form>
						</div>
					
						<div class="col-4">
							<button class="btn btn-sm btn-outline-secondary rounded-pill Vbtn" id="nooptionstudent">NO</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ACADEMIC'S -->
	<div class="container" id="viewAllAcademic">
		<div class="card">
			<div class="row p-1">
				<div class="col-4">
					<button class="roundbtn-academic text-center" id="addacademicbtn"><i class="fas fa-user-plus"></i><br>Add</button>
					<button class="roundbtn-academic text-center" id="searchacademicbtn"><i class="fa fa-search"></i><br>Search</button>
					<button class="roundbtn-academic text-center" id="updateacademicbtn"><i class="fa fa-window-restore"></i><br>Update</button>
					<button class="roundbtn-academic text-center" id="removeacademicbtn"><i class="fa fa-user-times"></i><br>Remove</button>
				</div>
			
				<div class="col-1"></div>
				
				<div class="col-4">
					<div class="my-3" id="searchacademiclayout">
						<div class="col-3 d-sm-flex" id="searchacademic">
							<div class="form-inline">
							  <div class="form-group mx-sm-3 mb-2">
							    <input type="text" class="form-control rounded-pill" id="academicsearch" name="academicsearchbox" placeholder="Search Academic" onkeyup="searchAcademic()">
							  </div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-1"></div>
				
				<div class="col-2">
					<h4 class="text-danger float-right p-2 mr-4 mt-3">AcademicStaff</h4><div class="clearfix"></div>
				</div>
			</div>
		</div>
		
		<div class="card" id="mainview">
			<div class="row">
				<div class="col-1">
					<button class="btn btn-danger btn-sm m-1" id="academictablebtn">Table</button>
				</div>
				
				<div class="col-11" id="academictablelayout">
					<div class="table-responsive" id="academictable">
						<table class="table table-sm" id="academictableactual">
							<thead>
						  		<tr>
						    		<th scope="col">ID</th>
						    		<th scope="col">Name</th>
						    		<th scope="col">Designation</th>
						    		<th scope="col">BirthDate</th>
						    		<th scope="col">EntryDate</th>
						    		<th scope="col">PhoneNo</th>
						    		<th scope="col">Address</th>
						    		<th scope="col">Salary</th>
						    		<th scope="col">Email</th>
						    		<th scope="col">Status</th>
						    		<th scope="col" class="text-danger">select</th>
						  		</tr>
						  	</thead>
						  	<tbody>
						  		<%
						  		List<Academic> academiclist = AcademicDao.getRecords();
								
						  		for(Academic a:academiclist) {
						  			out.print("<tr><th scope=\"row\">"
						  						+a.getId()+"</th><td>"
						  						+a.getName()+"</td><td>"
						  						+a.getDesignation()+"</td><td>"
						  						+a.getBirthdate()+"</td><td>"
						  						+a.getRegistereddate()+"</td><td>"
						  						+a.getPhone()+"</td><td>"
						  						+a.getAddress()+"</td><td>"
						  						+a.getSalary()+"</td><td>"
						  						+a.getEmail()+"</td><td>"
						  						+a.getStatus()+"</td>"
						  						+"</td><th>"
					  								+"<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"academicidradio\" id=\"academicidradio\" value="+a.getId()+"></div>"
					  							+"</th><tr>");
						  		}
						  		%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Add Academic -->
	<div class="container">
		<div class="modal" id="addacademicwindow">
			<!-- Modal Content -->
			<div class="modal-content">
				<div class="card-header">
					<h4 class="text-danger float-left p-1">Add New Academic Member</h4>
					<button class="btn btn-link float-right Vbtn"><span class="close">&times;</span></button><div class="clearfix"></div>
				</div>
				<div class="card-body p-3">
					<form action="addAcademic" method="POST" id="addacademicform">
						<div class="row">
							<div class="col-1"></div>
							
							<div class="col-5">
								<div class="form-group row">
							    	<label for="inputName" class="col-sm-2 col-form-label">Name</label>
							    	<div class="col-sm-10">
							    		<input name="addacademicname" type="text" class="form-control" id="addacademicnametxt" placeholder="Enter Name">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputBirthdate" class="col-sm-2 col-form-label">BirthDate</label>
							    	<div class="col-sm-4">
							    		<input name="addacademicbirthdate" type="text" class="form-control" id="addacademicbirthdatetxt" placeholder="yyyy-mm-dd">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputPhone" class="col-sm-2 col-form-label">Phone</label>
							    	<div class="col-sm-4">
							    		<input name="addacademicphone" type="text" class="form-control" id="addacademicphonetxt" placeholder="xxxxxxxxxx">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
							    	<div class="col-sm-10">
							    		<input name="addacademicaddress" type="text" class="form-control" id="addacademicaddresstxt" placeholder="Enter address">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputSalary" class="col-sm-2 col-form-label">Salary</label>
							    	<div class="col-sm-6">
							    		<input name="addacademicsalary" type="text" class="form-control" id="addacademicsalarytxt" placeholder="Enter basic salary">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
							    	<div class="col-sm-10">
							    		<input name="addacademicemail" type="text" class="form-control" id="addacademicemailtxt" placeholder="Enter valid Email">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputAcademicID" class="col-sm-2 col-form-label">Staff ID</label>	<% String newAcademicID = AcademicDao.getNewAcademicID(); %>	
							    	<div class="col-sm-5">
							    		<input name="addacademicid" type="text" class="form-control-plaintext" id="addacademicidtxt" placeholder="Staff ID" value="<% out.print(newAcademicID); %>" readonly>
							    	</div>
							  	</div>
								
								<div class="form-group row">
									<div class="col-sm-10">
								    	<input name="addacademic" type="submit" class="btn btn-danger" id="addacademicsubmit" value="ADD">
								    </div>
								</div>
							</div>
							
							<div class="col-5">
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageName"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageBirthdate"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messagePhone"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageAddress"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageSalary"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageEmail"></small></div>
								</div>
							</div>
							
							<div class="col-1"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Update Academic -->
	<div class="container">
		<div class="modal" id="updateacademicwindow">
			<!-- Modal Content -->
			<div class="modal-content">
				<div class="card-header">
					<h4 class="text-danger float-left p-1">Update Academic Details</h4>
					<button class="btn btn-link float-right Vbtn"><span class="close">&times;</span></button><div class="clearfix"></div>
				</div>
				<div class="card-body p-3">
					<form action="updateAcademic" method="POST" id="updateacdemicform">
						<div class="row">
							<div class="col-1"></div>
							
							<div class="col-5">
								<div class="form-group row">
							    	<label for="inputAcademicID" class="col-sm-2 col-form-label">StaffID</label>	
							    	<div class="col-sm-5">
							    		<input name="updateacademicid" type="text" class="form-control-plaintext" id="updateacademicidtxt" placeholder="Staff ID" value="" readonly>
							    	</div>
							  	</div>
							  	
								<div class="form-group row">
							    	<label for="inputName" class="col-sm-2 col-form-label">Name</label>
							    	<div class="col-sm-10">
							    		<input name="updateacademicname" type="text" class="form-control" id="updateacademicnametxt" placeholder="Enter Name" value="">
							    	</div>
							  	</div>
							  	
							 	<div class="form-group row">
							    	<label for="inputBirthdate" class="col-sm-2 col-form-label">BirthDate</label>
							    	<div class="col-sm-4">
							    		<input name="updateacademicbirthdate" type="text" class="form-control" id="updateacademicbirthdatetxt" placeholder="yyyy-mm-dd" value="">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputPhone" class="col-sm-2 col-form-label">Phone</label>
							    	<div class="col-sm-4">
							    		<input name="updateacademicphone" type="text" class="form-control" id="updateacademicphonetxt" placeholder="xxxxxxxxxx" value="">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
							    	<div class="col-sm-10">
							    		<input name="updateacademicaddress" type="text" class="form-control" id="updateacademicaddresstxt" placeholder="Enter address" value="">
							    	</div>
							  	</div>
								
								<div class="form-group row">
							    	<label for="inputSalary" class="col-sm-2 col-form-label">Salary</label>
							    	<div class="col-sm-6">
							    		<input name="updateacademicsalary" type="text" class="form-control" id="updateacademicsalarytxt" placeholder="Enter basic salary" value="">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
							    	<div class="col-sm-10">
							    		<input name="updateacademicemail" type="text" class="form-control" id="updateacademicemailtxt" placeholder="Enter valid Email" value="">
							    	</div>
							  	</div>
								
								<div class="form-group row">
									<div class="col-sm-10">
								    	<input name="updateacademic" type="submit" class="btn btn-danger" id="updateacademicsubmit" value="UPDATE">
								    </div>
								</div>
							</div>
							
							<div class="col-5">
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageupdateName"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageupdateBirthdate"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageupdatePhone"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-success text-center" id="messageupdateAddress"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageupdateSalary"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageupdateEmail"></small></div>
								</div>
							</div>
							
							<div class="col-1"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Remove Academic -->
	<div class="container">
		<div class="modal removeacademicwindow" id="removewindow">
			<!-- Modal Content -->
			<div class="modal-content" id="removewindowbody">
				<div class="card-header">
					<h4 class="text-danger float-left p-1">Remove AcademicStaff</h4>
					<button class="btn btn-link float-right Vbtn"><span class="close">&times;</span></button><div class="clearfix"></div>
				</div>
				<div class="card-body">
					<div class="row" style="margin-top: 1%;">
						<div class="col-4">
							<h4>Do you want to remove this AcademicStaff member from the System?</h4>
							<label id="removeacademicdisplay"></label>
						</div>
						
						<div class="col-4">
							<form action="removeAcademic" method="POST" id="removeacademicform">
								<input type="hidden" name="removeacademicid" id="removeacademicidinput" value="">
								<button class="btn btn-sm btn-outline-danger rounded-pill" id="yesoptionacademic">YES</button>
							</form>
						</div>
					
						<div class="col-4">
							<button class="btn btn-sm btn-outline-secondary rounded-pill Vbtn" id="nooptionacademic">NO</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- NONACADEMIC'S -->
	<div class="container" id="viewAllNonAcademic">
		<div class="card">
			<div class="row p-1">
				<div class="col-4">
					<button class="roundbtn-nonacademic text-center" id="addnonacademicbtn"><i class="fas fa-user-plus"></i><br>Add</button>
					<button class="roundbtn-nonacademic text-center" id="searchnonacademicbtn"><i class="fa fa-search"></i><br>Search</button>
					<button class="roundbtn-nonacademic text-center" id="updatenonacademicbtn"><i class="fa fa-window-restore"></i><br>Update</button>
					<button class="roundbtn-nonacademic text-center" id="removenonacademicbtn"><i class="fa fa-user-times"></i><br>Remove</button>
				</div>
				
				<div class="col-1"></div>
				
				<div class="col-4">
					<div class="my-3" id="searchnonacademiclayout">
						<div class="col-3 d-sm-flex" id="searchnonacademic">
							<div class="form-inline">
								  <div class="form-group mx-sm-3 mb-2">
								    <input type="text" class="form-control rounded-pill" id="nonacademicsearch" name="nonacademicsearchbox" placeholder="Search NonAcademic" onkeyup="searchNonAcademic()">
								  </div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-1"></div>
				
				<div class="col-2">
					<h4 class="text-primary float-right p-2 mr-4 mt-3">NonAcademicStaff</h4><div class="clearfix"></div>	
				</div>
			</div>
		</div>
		
		<div class="card" id="mainview">
			<div class="row">
				<div class="col-1">
					<button class="btn btn-primary btn-sm m-1" id="nonacademictablebtn">Table</button>
				</div>
				
				<div class="col-11" id="nonacademictablelayout">
					<div class="table-responsive" id="nonacademictable">
						<table class="table table-sm" id="nonacademictableactual">
							<thead>
						  		<tr>
						    		<th scope="col">ID</th>
						    		<th scope="col">Name</th>
						    		<th scope="col">Designation</th>
						    		<th scope="col">PriorityLevel</th>
						    		<th scope="col">BirthDate</th>
						    		<th scope="col">EntryDate</th>
						    		<th scope="col">PhoneNo</th>
						    		<th scope="col">Address</th>
						    		<th scope="col">Salary</th>
						    		<th scope="col">Email</th>
						    		<th scope="col">Status</th>
						    		<th scope="col" class="text-danger">select</th>
						  		</tr>
						  	</thead>
						  	<tbody>
						  		<%
						  		List<NonAcademic> nonacademiclist = NonAcademicDao.getRecords();
								
						  		for(NonAcademic na:nonacademiclist) {
						  			out.print("<tr><th scope=\"row\">"+na.getId()
						  						+"</th><td>"+na.getName()
						  						+"</td><td>"+na.getDesignation()
						  						+"</td><td>"+na.getPriorityLevel()
						  						+"</td><td>"+na.getBirthdate()
						  						+"</td><td>"+na.getRegistereddate()
						  						+"</td><td>"+na.getPhone()
						  						+"</td><td>"+na.getAddress()
						  						+"</td><td>"+na.getSalary()
						  						+"</td><td>"+na.getEmail()
						  						+"</td><td>"+na.getStatus()
						  						+"</td><th>"
						  							+"<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"nonacademicidradio\" id=\"nonacademicidradio\" value="+na.getId()+"></div>"
						  						+"</th><tr>");
						  		}
						  		%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Add Non Academic -->
	<div class="container">
		<div class="modal" id="addnonacademicwindow">
			<!-- Modal Content -->
			<div class="modal-content">
				<div class="card-header">
					<h4 class="text-primary float-left p-1">Add New NonAcademic Member</h4>
					<button class="btn btn-link float-right Vbtn"><span class="close">&times;</span></button><div class="clearfix"></div>
				</div>
				<div class="card-body p-3">
					<form action="addNonAcademic" method="POST" id="addnonacademicform">
						<div class="row">
							<div class="col-1"></div>
							
							<div class="col-5">
								<div class="form-group row">
							    	<label for="inputName" class="col-sm-2 col-form-label">Name</label>
							    	<div class="col-sm-10">
							    		<input name="addnonacademicname" type="text" class="form-control" id="addnonacademicnametxt" placeholder="Enter Name">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputBirthdate" class="col-sm-2 col-form-label">BirthDate</label>
							    	<div class="col-sm-4">
							    		<input name="addnonacademicbirthdate" type="text" class="form-control" id="addnonacademicbirthdatetxt" placeholder="yyyy-mm-dd">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputPhone" class="col-sm-2 col-form-label">Phone</label>
							    	<div class="col-sm-4">
							    		<input name="addnonacademicphone" type="text" class="form-control" id="addnonacademicphonetxt" placeholder="xxxxxxxxxx">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
							    	<div class="col-sm-10">
							    		<input name="addnonacademicaddress" type="text" class="form-control" id="addnonacademicaddresstxt" placeholder="Enter address">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputSalary" class="col-sm-2 col-form-label">Salary</label>
							    	<div class="col-sm-6">
							    		<input name="addnonacademicsalary" type="text" class="form-control" id="addnonacademicsalarytxt" placeholder="Enter basic salary">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
							    	<div class="col-sm-10">
							    		<input name="addnonacademicemail" type="text" class="form-control" id="addnonacademicemailtxt" placeholder="Enter valid Email">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputNonAcademicID" class="col-sm-2 col-form-label">Staff ID</label>	<% String newNonAcademicID = NonAcademicDao.getNewNonAcademicID(); %>	
							    	<div class="col-sm-5">
							    		<input name="addnonacademicid" type="text" class="form-control-plaintext" id="addnonacademicidtxt" placeholder="Staff ID" value="<% out.print(newNonAcademicID); %>" readonly>
							    	</div>
							  	</div>
								
								<div class="form-group row">
									<div class="col-sm-10">
								    	<input name="addnonacademic" type="submit" class="btn btn-primary" id="addnonacademicsubmit" value="ADD">
								    </div>
								</div>
							</div>
							
							<div class="col-5">
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageName"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageBirthdate"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messagePhone"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageAddress"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageSalary"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-danger text-center" id="messageEmail"></small></div>
								</div>
							</div>
							
							<div class="col-1"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Update Non Academic -->
	<div class="container">
		<div class="modal" id="updatenonacademicwindow">
			<!-- Modal Content -->
			<div class="modal-content">
				<div class="card-header">
					<h4 class="text-primary float-left p-1">Update NonAcademic Details</h4>
					<button class="btn btn-link float-right Vbtn"><span class="close">&times;</span></button><div class="clearfix"></div>
				</div>
				<div class="card-body p-3">
					<form action="updateNonAcademic" method="POST" id="updatenonacdemicform">
						<div class="row">
							<div class="col-1"></div>
							
							<div class="col-5">
								<div class="form-group row">
							    	<label for="inputNonAcademicID" class="col-sm-2 col-form-label">StaffID</label>	
							    	<div class="col-sm-5">
							    		<input name="updatenonacademicid" type="text" class="form-control-plaintext" id="updatenonacademicidtxt" placeholder="Staff ID" value="" readonly>
							    	</div>
							  	</div>
							  	
								<div class="form-group row">
							    	<label for="inputName" class="col-sm-2 col-form-label">Name</label>
							    	<div class="col-sm-10">
							    		<input name="updatenonacademicname" type="text" class="form-control" id="updatenonacademicnametxt" placeholder="Enter Name" value="">
							    	</div>
							  	</div>
							  	
							 	<div class="form-group row">
							    	<label for="inputBirthdate" class="col-sm-2 col-form-label">BirthDate</label>
							    	<div class="col-sm-4">
							    		<input name="updatenonacademicbirthdate" type="text" class="form-control" id="updatenonacademicbirthdatetxt" placeholder="yyyy-mm-dd" value="">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputPhone" class="col-sm-2 col-form-label">Phone</label>
							    	<div class="col-sm-4">
							    		<input name="updatenonacademicphone" type="text" class="form-control" id="updatenonacademicphonetxt" placeholder="xxxxxxxxxx" value="">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
							    	<div class="col-sm-10">
							    		<input name="updatenonacademicaddress" type="text" class="form-control" id="updatenonacademicaddresstxt" placeholder="Enter address" value="">
							    	</div>
							  	</div>
								
								<div class="form-group row">
							    	<label for="inputSalary" class="col-sm-2 col-form-label">Salary</label>
							    	<div class="col-sm-6">
							    		<input name="updatenonacademicsalary" type="text" class="form-control" id="updatenonacademicsalarytxt" placeholder="Enter basic salary" value="">
							    	</div>
							  	</div>
							  	
							  	<div class="form-group row">
							    	<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
							    	<div class="col-sm-10">
							    		<input name="updatenonacademicemail" type="text" class="form-control" id="updatenonacademicemailtxt" placeholder="Enter valid Email" value="">
							    	</div>
							  	</div>
								
								<div class="form-group row">
									<div class="col-sm-10">
								    	<input name="updateanoncademic" type="submit" class="btn btn-primary" id="updatenonacademicsubmit" value="UPDATE">
								    </div>
								</div>
							</div>
							
							<div class="col-5">
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-primary text-center" id="messageupdateName"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-primary text-center" id="messageupdateBirthdate"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-primary text-center" id="messageupdatePhone"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-primary text-center" id="messageupdateAddress"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-primary text-center" id="messageupdateSalary"></small></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12"><small class="col-sm-2 text-primary text-center" id="messageupdateEmail"></small></div>
								</div>
							</div>
							
							<div class="col-1"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Remove NonAcademic -->
	<div class="container">
		<div class="modal removenonacademicwindow" id="removewindow">
			<!-- Modal Content -->
			<div class="modal-content" id="removewindowbody">
				<div class="card-header">
					<h4 class="text-primary float-left p-1">Remove NonAcademicStaff</h4>
					<button class="btn btn-link float-right Vbtn"><span class="close">&times;</span></button><div class="clearfix"></div>
				</div>
				<div class="card-body">
					<div class="row" style="margin-top: 1%;">
						<div class="col-4">
							<h4>Do you want to remove this NonAcademicStaff member from the System?</h4>
							<label id="removenonacademicdisplay"></label>
						</div>
						
						<div class="col-4">
							<form action="removeNonAcademic" method="POST" id="removenonacademicform">
								<input type="hidden" name="removenonacademicid" id="removenonacademicidinput" value="">
								<button class="btn btn-sm btn-outline-primary rounded-pill" id="yesoptionnonacademic">YES</button>
							</form>
						</div>
					
						<div class="col-4">
							<button class="btn btn-sm btn-outline-secondary rounded-pill Vbtn" id="nooptionnonacademic">NO</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Manage(options) -->
	<div class="container" id="viewmore">
		<div class="card bg-warning">
			<div class="row">
				<div class="col-4">
					<h3 class="text-light p-1">Options</h3>
				</div>
				
				<div class="col-4"></div>
				
				<div class="col-4">
					<button class="btn btn-outline-dark rounded-pill float-right my-1 mx-2" id="profilebtn">Profile</button><div class="clearfix"></div>
				</div>
			</div>
		</div>
		
		<div class="card bg-light bgchange" id="mainview">
			<div class="row">
				<div class="col-4 text-center my-4" style="height: 250px; position: relative; top: 10%;">
					<button class="btn btn-outline-warning text-dark" id="sportsbtn">Sports</button>
				</div>
				
				<div class="col-4 text-center my-4" style="height: 250px; position: relative; top: 50%;">
					<button class="btn btn-outline-warning text-dark" id="studentsubjectsbtn">Student Subjects</button>
				</div>
				
				<div class="col-4 text-center my-4" style="height: 250px; position: relative; top: 90%;">
					<button class="btn btn-outline-warning text-dark" id="examsandresultsbtn">Exams and Results</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Profile -->
	<div class="container">	
		<div id="profilewindow">
			<div id="mainview">
				<div class="row">
					<div class="container emp-profile" id="profilewindow">
						<div class="row">
	                		<div class="col-md-4">
		                    	<div class="profile-img">
		                        	<img id="profilePicture" src="<%//=link %>./images/link/n000000001.png" alt="your profile picture"/><div class="clearfix"></div>
		                    	</div>
	                		</div>
                    
	                		<div class="col-md-6">
	                    		<div class="profile-head">
		                     		<h5><%=name %></h5>
		                     		<h6>Admin</h6>
		                     		<p class="proile-rating"><%=designation %></p>
		               				
		               				<ul class="nav nav-tabs" id="myTab" role="tablist">
		                   				<li class="nav-item">
		                       				<a class="nav-link active" id="home-tab" data-toggle="tab" href="#more" role="tab" aria-controls="home" aria-selected="true">About</a>
		                   				</li>
		               				</ul>
                  				</div>
	                		</div>
	                    
			                <div class="col-md-2">
			                    <button class="btn btn-sm btn-outline-dark rounded-pill mt-2" id="editprofilebtn">Edit Profile</button>
			                    <button class="btn btn-link float-right Vbtnspecial"><span class="close">&times;</span></button><div class="clearfix"></div>
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
							
							<div class="col-md-4">
								<div class="tab-content profile-tab" id="myTabContent">
                            		<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
										<div class="row">
		                               		<div class="col-md-6">
		                                   		<label>Bio</label>
		                               		</div>
			                                <div class="col-md-6">
			                                    <p><%=bio %></p>
			                                </div>
				                		</div>
		                		
				                		<div class="row">
		                               		<div class="col-md-6">
		                                   		<label>Qualifications</label>
		                               		</div>
			                                <div class="col-md-6">
			                                    <p><%=qualification %></p>
			                                </div>
				                		</div>
		                			</div>
	                			</div>
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
					<form action="editprofileNonAcademic" method="POST" id="editprofileform">
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
							    	<label for="inputQualification" class="col-sm-2 col-form-label">Qualifications</label>
							    	<div class="col-sm-10">
							    		<input name="editqualifications" type="text" class="form-control" id="editqualificationstxt" placeholder="Update qualifications" value="<%=qualification %>">
							    	</div><br>
							    	<div class="col-sm-12">
							    		<small class="col-sm-2 text-primary text-center" id="messageeditQualifications"></small>
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
	
	<!-- Sports -->
	<div class="container">	
		<div id="sportswindow">
			<div class="card">
				<div class="row">
					<div class="col-4"></div>
					
					<div class="col-4">
						<h3 class="text-center p-2">Sports</h3>
					</div>
					
					<div class="col-4">
						<button class="btn btn-link float-right Vbtnspecial"><span class="close">&times;</span></button><div class="clearfix"></div>
					</div>
				</div>
			</div>
			
			<!-- SPORTS TABLE -->
			<div class="card bg-light" id="mainview">
				<div id="sporttablewindow">
					<div class="row">
						<div class="col-4">
							<div class="row">
								<div class="col-sm-2"></div>
								
								<div class="col-sm-8">
									<div class="my-4" id="searchsportlayout">
										<div class="col-3 d-sm-flex" id="searchsport">
											<div class="form-inline">
											  <div class="form-group mx-sm-3 mb-2">
											    <input type="text" class="form-control rounded-pill text-dark" id="sportsearch" name="sportsearchbox" placeholder="Search Sport" onkeyup="searchSport()">
											  </div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-sm-2"></div>
							</div>
						</div>
						
						<div class="col-8">
							<div class="table-responsive" id="sporttable">
								<table class="table table-sm text-center" id="sporttableactual">
									<thead>
								  		<tr>
								    		<th scope="col">SportID</th>
								    		<th scope="col">Sport</th>
								    		<th scope="col">CoachPersonID</th>
								    		<th scope="col">CoachPerson</th>
								    		<th scope="col" class="text-danger">select</th>
								  		</tr>
								  	</thead>
								  	<tbody>
								  		<%
								  		List<Sport> sportlist = SportDao.getRecords();
										
								  		for(Sport sp:sportlist) {
								  			out.print("<tr><th scope=\"row\"><p>"
								  						+sp.getSportID()+"</p></th><td><p>"
								  						+sp.getSportName()+"</p></td><td><p>"
								  						+sp.getCoachPersonID()+"</p></td><td><p>"
								  						+sp.getCoachPersonName()+"</p></td><td><p>"
								  						+"</td><th><p>"
						  									+"<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"sportidradio\" id=\"sportidradio\" value="+sp.getSportID()+"></div>"
						  								+"</p></th><tr>");
								  		}	
								  		%>	
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Student Subjects -->
	<div class="container">
		<div id="studentsubjectswindow">
			<div class="card">
				<div class="row">
					<div class="col-4 mt-2">
						<button class="btn btn-sm btn-outline-warning rounded-pill text-dark" id="subjecttablebtn">Subjects Table</button>
						<button class="btn btn-sm btn-outline-warning rounded-pill text-dark" id="assignteachersbtn">Assign Staff</button>
						<button class="btn btn-sm btn-outline-warning rounded-pill text-dark" id="changesubjectsbtn">Change Subjects</button>
					</div>
					
					<div class="col-4">
						<h3 class="text-center p-2">Student Subjects</h3>
					</div>
					
					<div class="col-4">
						<button class="btn btn-link float-right Vbtnspecial"><span class="close">&times;</span></button><div class="clearfix"></div>
					</div>
				</div>
			</div>
			
			<div class="card bg-light" id="mainview">
				<!-- SUBJECTS TABLE -->
				<div id="subjecttablewindow">
					<div class="row">
						<div class="col-4">
							<div class="row">
								<div class="col-2"></div>
								
								<div class="col-8">
									<div class="my-4" id="searchsubjectlayout">
										<div class="col-3 d-sm-flex" id="searchsubject">
											<div class="form-inline">
											  <div class="form-group mx-sm-3 mb-2">
											    <input type="text" class="form-control rounded-pill text-dark" id="subjectsearch" name="subjectsearchbox" placeholder="Search Subject" onkeyup="searchSubject()">
											  </div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-2"></div>
							</div>
						</div>
						
						<div class="col-8">
							<div class="table-responsive" id="subjecttable">
								<table class="table table-sm" id="subjecttableactual">
									<thead>
								  		<tr>
								    		<th scope="col">SubjectID</th>
								    		<th scope="col">Subject</th>
								    		<th scope="col">Medium</th>
								    		<th scope="col">Grade</th>
								    		<th scope="col">TeacherID</th>
								    		<th scope="col">Teacher</th>
								  		</tr>
								  	</thead>
								  	<tbody>
								  		<%
								  		List<Subject> subjectlist = SubjectDao.getRecords();
										
								  		for(Subject su:subjectlist) {
								  			out.print("<tr><th scope=\"row\"><p>"
								  						+su.getSubjectID()+"</p></th><td><p>"
								  						+su.getSubjectName()+"</p></td><td><p>"
								  						+su.getMedium()+"</p></td><td><p>"
								  						+su.getGrade()+"</p></td><td><p>"
								  						+su.getTeacherID()+"</p></td><td><p>"
								  						+su.getTeacherName()+"</p></td><td>");
								  		}	
								  		%>	
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Assign Teachers -->
				<div class="container">
					<div class="modal" id="assignteacherswindow">
						<!-- Modal Content -->
						<div class="modal-content" id="assignteacherswindowbody">
							<div class="card-header">
								<h4 class="text-warning float-left p-1">Assign Teachers</h4>
								<button class="btn btn-link float-right Vbtn"><span class="close">&times;</span></button><div class="clearfix"></div>
							</div>
							<div class="card-body p-3">
								<form action="assignTeachers" method="POST" id="assignteachersform">
									
										
											<div class="form-group row">
										    	<div class="col-sm-1"></div>
										    	
										    	<label for="inputSubject" class="col-md-4 col-form-label">Subject</label>
										    	<div class="col-sm-6">
										      		<select name="assignteacherssubjectselect" class="form-control form-control-md" id="assignteacherssubjectselect">
													  <option value="">(Select Subject)</option>
													  <%
													  	for(Subject su:subjectlist)
													  		out.print("<option value="+su.getSubjectID()+">"+su.getGrade()+" "+su.getMedium()+" medium "+su.getSubjectName()+"</option>");
													  %>
													</select>
										    	</div>
										    	
										    	<div class="col-sm-1"></div>
										  	</div>
										
										
										
											<div class="form-group row">
												<div class="col-sm-1"></div>
												
										    	<label for="inputStaff" class="col-md-4 col-form-label">Teacher</label>
										    	<div class="col-sm-6">
										      		<select name="assignteachersstaffselect" class="form-control form-control-md" id="assignteachersstaffselect">
													  <option value="">(Select Teacher)</option>
													  <%
										    			for(Academic a:academiclist) {
													  		if(a.getStatus().equals("1"))
										    					out.print("<option value="+a.getId()+">"+a.getId()+"   "+a.getName()+"</option>");
										    			}
													  %>
													</select>
										    	</div>
										    	
										    	<div class="col-sm-1"></div>
										  	</div>		
										
										
										
											<div class="form-group row">
												<div class="col-sm-4"></div>
												
												<div class="col-sm-4">
											    	<input name="assignteacherssubmit" type="submit" class="btn btn-md btn-outline-warning text-dark rounded-pill" id="assignteacherssubmit" value="ASSIGN">
											    </div>
											    
											    <div class="col-sm-4"></div>
											</div>			
										
									
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Change Subjects -->
				<div id="changesubjectswindow">
					<div class="row">
						<div class="col-4">
							<div class="row">
								<div class="col-2">
									<button class="btn btn-sm btn-outline-warning rounded-pill">change</button>
								</div>
								
								<div class="col-8">
									<div class="my-3" id="searchstudentsubjectlayout">
										<div class="col-3 d-sm-flex" id="searchstudentsubject">
											<div class="form-inline">
											  <div class="form-group mx-sm-3 mb-2">
											    <input type="text" class="form-control rounded-pill text-success" id="studentsubjectsearch" name="studentsubjectsearchbox" placeholder="Search StudentID" onkeyup="searchStudentSubject()">
											  </div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-2"></div>
							</div>
						</div>
						
						<div class="col-8">
							<div class="col-11" id="studentsubjecttablelayout">
								<div class="table-responsive" id="studentsubjecttable">
									<table class="table table-sm" id="studentsubjecttableactual">
										<thead>
									  		<tr>
									    		<th scope="col">StudentID</th>
									    		<th scope="col">StudentName</th>
									    		<th scope="col">SubjectID</th>
									    		<th scope="col">Subject</th>
									    		<th scope="col">Grade</th>
									    		<th scope="col">Medium</th>
									    		<th scope="col" class="text-danger">select</th>
									  		</tr>
									  	</thead>
									  	<tbody>
									  		<%
									  		List<StudentSubject> studentsubjectlist = SubjectDao.getStudentSubjects();
											
									  		for(StudentSubject stusu:studentsubjectlist) {
									  			out.print("<tr><th scope=\"row\">"
									  						+stusu.getStudentID()+"</th><td>"
									  						+stusu.getStudentName()+"</td><td>"
									  						+stusu.getSubjectID()+"</td><td>"
									  						+stusu.getSubjectName()+"</td><td>"
									  						+stusu.getGrade()+"</td><td>"
									  						+stusu.getMedium()+"</td><td>"
									  						+"</td><td>"
							  									+"<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"studentsubjectidradio\" id=\"studentsubjectidradio\" value="+stusu.getStudentID()+"></div>"
							  								+"</td><tr>");
									  		}	
									  		%>	
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Exams and Results -->
	<div class="container">
		<div id="examsandresultswindow">
			<div class="card">
				<div class="row">
					<div class="col-4"></div>
					
					<div class="col-4">
						<h3 class="text-center p-2">Exams and Results</h3>
					</div>
					
					<div class="col-4">
						<button class="btn btn-link float-right Vbtnspecial"><span class="close">&times;</span></button><div class="clearfix"></div>
					</div>
				</div>
			</div>
			
			<div class="card bg-light" id="mainview">
				<div class="row">
					<div class="col-4"></div>
					
					<div class="col-8" id="examtablelayout">
						<div class="table-responsive" id="examtable">
							<table class="table table-sm" id="examtableactual">
								<thead>
							  		<tr>
							    		<th scope="col">ExamID</th>
							    		<th scope="col">ExamDescription</th>
							    		<th scope="col">Subject</th>
							    		<th scope="col">Term</th>
							    		<th scope="col" class="text-danger">select</th>
							  		</tr>
							  	</thead>
							  	<tbody>
							  		<%
							  		List<Exam> examlist = ExamDao.getRecords();
									
							  		for(Exam e:examlist) {
							  			out.print("<tr><th scope=\"row\">"
							  						+e.getExamID()+"</th><td>"
							  						+e.getExamDescription()+"</td><td>"
							  						+e.getSubject()+"</td><td>"
							  						+e.getTerm()+"</td><td>"
							  						+"</td><td>"
					  									+"<div class=\"form-check\"><input class=\"form-check-input\" type=\"radio\" name=\"examidradio\" id=\"examidradio\" value="+e.getExamID()+"></div>"
					  								+"</td><tr>");
							  		}	
							  		%>	
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function() {
		console.log("SchoolManager v.10");
		
		$('#profilewindow').hide();

		$('#sportswindow').hide();

		$('#studentsubjectswindow').hide();
			$('#assignteacherswindow').hide();
			$('#changesubjectswindow').hide();

		$('#examsandresultswindow').hide();

		$('#viewAllStudent').hide();
		$('#addstudentwindow').hide();
		$('#searchstudentlayout').hide();
		$('#viewAllAcademic').hide();
		$('#addacademicwindow').hide();
		$('#searchacademiclayout').hide();
		$('#viewAllNonAcademic').hide();
		$('#addnonacademicwindow').hide();
		$('#searchnonacademiclayout').hide();
		
		$('#studentbtn').on('click',function() {
			$('#viewAllAcademic').hide();
			$('#viewAllNonAcademic').hide();
			$('#viewmore').hide();
			$('#profilewindow').hide();
			$('#sportswindow').hide();
			$('#studentsubjectswindow').hide();
			$('#examsandresultswindow').hide();
			$('#viewAllStudent').fadeToggle(500);
		});
		
		$('#academicbtn').on('click',function() {
			$('#viewAllStudent').hide();
			$('#viewAllNonAcademic').hide();
			$('#viewmore').hide();
			$('#profilewindow').hide();
			$('#sportswindow').hide();
			$('#studentsubjectswindow').hide();
			$('#examsandresultswindow').hide();
			$('#viewAllAcademic').fadeToggle(500);
		});
		
		$('#nonacademicbtn').on('click',function() {
			$('#viewAllStudent').hide();
			$('#viewAllAcademic').hide();
			$('#viewmore').hide();
			$('#profilewindow').hide();
			$('#sportswindow').hide();
			$('#studentsubjectswindow').hide();
			$('#examsandresultswindow').hide();
			$('#viewAllNonAcademic').fadeToggle(250);
		});
		
		$('#morebtn').on('click',function() {
			$('#viewAllStudent').hide();
			$('#viewAllAcademic').hide();
			$('#viewAllNonAcademic').hide();
			$('#viewmore').fadeToggle(500);
		});
		
		$('#addstudentbtn').on('click',function() {
			$('#addstudentwindow').fadeIn(250);		
		});
		
		$('#addacademicbtn').on('click',function() {
			$('#addacademicwindow').fadeIn(250);
		});
		
		$('#addnonacademicbtn').on('click',function() {
			$('#addnonacademicwindow').fadeIn(250);
		});
		
		$('#updatestudentbtn').on('click',function() {
			var studentidradio = $("input[name='studentidradio']:checked").val();
			$('#updatestudentwindow').fadeIn(250);
			$('#updatestudentidtxt').val(studentidradio);
			
    	});
		
		$('#updateacademicbtn').on('click',function() {
			var academicidradio = $("input[name='academicidradio']:checked").val();
			$('#thisacademicid').val(academicidradio);
			$('#updateacademicwindow').fadeIn(250);
		});
		
		$('#updatenonacademicbtn').on('click',function() {
			var nonacademicidradio = $("input[name='nonacademicidradio']:checked").val();
			$('#thisnonacademicid').val(nonacademicidradio);
			$('#updatenonacademicwindow').fadeIn(250);
		});
		
		$("input[name='studentidradio']").on('click',function() {
			var rad = $("input[name='studentidradio']:checked").val();
			console.log(rad);
		});
		
		$('#studenttablebtn').on('click',function() {
			$('#searchstudentlayout').hide();
			$('#studenttable').fadeToggle(250);
		});
		
		$('#searchstudentbtn').on('click',function() {
			$('#searchstudentlayout').fadeToggle(250);
		});
		
		$('#academictablebtn').on('click',function() {
			$('#searchacademiclayout').hide();
			$('#academictable').fadeToggle(250);
		});
		
		$('#searchacademicbtn').on('click',function() {
			$('#searchacademiclayout').fadeToggle(250);
		});
		
		$('#nonacademictablebtn').on('click',function() {
			$('#searchnonacademiclayout').hide();
			$('#nonacademictable').fadeToggle(250);
		});
		
		$('#searchnonacademicbtn').on('click',function() {
			$('#searchnonacademiclayout').fadeToggle(250);
		});
		
		$('#removestudentbtn').on('click',function() {
			$('.removestudentwindow').fadeIn(250);
		});
		
		$('#removeacademicbtn').on('click',function() {
			$('.removeacademicwindow').fadeIn(250);
		});
		
		$('#removenonacademicbtn').on('click',function() {
			$('.removenonacademicwindow').fadeIn(250);
		});
		
		$('.Vbtn').on('click',function() {
			$('.modal').fadeOut(250);
		});
		
		$('.Vbtnspecial').on('click',function() {
			$('#profilewindow').hide();
			$('#sportswindow').hide();
			$('#studentsubjectswindow').hide();
			$('#examsandresultswindow').hide();
			$('#viewmore').fadeIn(250);
		});
		
		$('input[type="radio"]').on('click',function() {
			$('.radiocheckedlabel').fadeOut(250);
		});
		
		$('#profilebtn').on('click',function() {
			$('#viewmore').hide();
			$('#sportswindow').hide();
			$('#studentsubjectswindow').hide();
			$('#examsandresultswindow').hide();
			$('#profilewindow').fadeToggle(250);
		});
		
		$('#sportsbtn').on('click',function() {
			$('#viewmore').hide();
			$('#profilewindow').hide();
			$('#studentsubjectswindow').hide();
			$('#examsandresultswindow').hide();
			$('#sportswindow').fadeToggle(250);
		});
		
		$('#studentsubjectsbtn').on('click',function() {
			$('#viewmore').hide();
			$('#sportswindow').hide();
			$('#profilewindow').hide();
			$('#examsandresultswindow').hide();
			$('#studentsubjectswindow').fadeToggle(250);
		});
		
		$('#examsandresultsbtn').on('click',function() {
			$('#viewmore').hide();
			$('#sportswindow').hide();
			$('#profilewindow').hide();
			$('#studentsubjectswindow').hide();
			$('#examsandresultswindow').fadeToggle(250);
		});
		
		$('#morebtn').on('click',function() {
			$('#profilewindow').hide();
			$('#sportswindow').hide();
			$('#studentsubjectswindow').hide();
			$('#examsandresultswindow').hide();
			$('#viewmore').show();
		});
		
		$('#subjecttablebtn').on('click',function() {
			$('#assignteacherswindow').hide();
			$('#changesubjectswindow').hide();
			$('#subjecttablewindow').fadeToggle(250);
		});
		
		$('#assignteachersbtn').on('click',function() {
			$('#changesubjectswindow').hide();
			$('#assignteacherswindow').fadeToggle(250);
		});
		
		$('#changesubjectsbtn').on('click',function() {
			$('#subjecttablewindow').hide();
			$('#assignteacherswindow').hide();
			$('#changesubjectswindow').fadeToggle(250);
		});
		
		$('#editprofilebtn').on('click',function() {
			$('#editprofilewindow').fadeIn(250);
		});
		
		$('#radiocheckedlabel').mouseover(function() {
			$('#radiocheckedlabel').fadeOut(250);
		});
	});
</script>
<script type="text/javascript">
	var tablestd = document.getElementById('studenttableactual');
	var tableac = document.getElementById('academictableactual');
	var tablenonac = document.getElementById('nonacademictableactual');
	
	for(var i=1;i<tablestd.rows.length;i++) {
		tablestd.rows[i].onclick = function() {
			document.getElementById("updatestudentnametxt").value = this.cells[1].innerHTML;
			document.getElementById("updatestudentgradeselect").value = this.cells[3].innerHTML;
			document.getElementById("updatestudentbirthdatetxt").value = this.cells[4].innerHTML;
			document.getElementById("updatestudentphonetxt").value = this.cells[6].innerHTML;
			document.getElementById("updatestudentaddresstxt").value = this.cells[7].innerHTML;
			document.getElementById("updatestudentidtxt").value = this.cells[0].innerHTML;
			
			document.getElementById("removestudentidinput").value = this.cells[0].innerHTML;
			document.getElementById("removestudentdisplay").innerHTML = this.cells[0].innerHTML+"\n"+this.cells[1].innerHTML;
		}
	}
	//StaffID  Name BirthDate Phone Address Salary Email
	for(var i=1;i<tableac.rows.length;i++) {
		tableac.rows[i].onclick = function() {
			document.getElementById("updateacademicnametxt").value = this.cells[1].innerHTML;
			document.getElementById("updateacademicbirthdatetxt").value = this.cells[3].innerHTML;
			document.getElementById("updateacademicphonetxt").value = this.cells[5].innerHTML;
			document.getElementById("updateacademicaddresstxt").value = this.cells[6].innerHTML;
			document.getElementById("updateacademicsalarytxt").value = this.cells[7].innerHTML;
			document.getElementById("updateacademicemailtxt").value = this.cells[8].innerHTML;
			document.getElementById("updateacademicidtxt").value = this.cells[0].innerHTML;
			
			document.getElementById("removeacademicidinput").value = this.cells[0].innerHTML;
			document.getElementById("removeacademicdisplay").innerHTML = this.cells[0].innerHTML+"\n"+this.cells[1].innerHTML;
		}
	}
	
	for(var i=1;i<tablenonac.rows.length;i++) {
		tablenonac.rows[i].onclick = function() {
			document.getElementById("updatenonacademicnametxt").value = this.cells[1].innerHTML;
			document.getElementById("updatenonacademicbirthdatetxt").value = this.cells[4].innerHTML;
			document.getElementById("updatenonacademicphonetxt").value = this.cells[6].innerHTML;
			document.getElementById("updatenonacademicaddresstxt").value = this.cells[7].innerHTML;
			document.getElementById("updatenonacademicsalarytxt").value = this.cells[8].innerHTML;
			document.getElementById("updatenonacademicemailtxt").value = this.cells[9].innerHTML;
			document.getElementById("updatenonacademicidtxt").value = this.cells[0].innerHTML;
			
			document.getElementById("removenonacademicidinput").value = this.cells[0].innerHTML;
			document.getElementById("removenonacademicdisplay").innerHTML = this.cells[0].innerHTML+"\n"+this.cells[1].innerHTML;
		}
	}
</script>
<script type="text/javascript">
function searchStudent() {
	// Declare variables
	var input,filter,table,tr,td,i,txtValue;
	input = document.getElementById("studentsearch");
	filter = input.value.toUpperCase();
	table = document.getElementById("studenttableactual");
	tr = table.getElementsByTagName("tr");
	
	// Loop through all table rows, and hide those who don't 
	//match the search query
	for(i=0;i<tr.length;i++) {
		td = tr[i].getElementsByTagName("td")[0];
		if(td) {
			txtValue = td.textContent || td.innerText;
			if(txtValue.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			}
			else {
				tr[i].style.display = "none";
			}
		}
	}
}

function searchAcademic() {
	// Declare variables
	var input,filter,table,tr,td,i,txtValue;
	input = document.getElementById("academicsearch");
	filter = input.value.toUpperCase();
	table = document.getElementById("academictableactual");
	tr = table.getElementsByTagName("tr");
	
	// Loop through all table rows, and hide those who don't 
	//match the search query
	for(i=0;i<tr.length;i++) {
		td = tr[i].getElementsByTagName("td")[0];
		if(td) {
			txtValue = td.textContent || td.innerText;
			if(txtValue.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			}
			else {
				tr[i].style.display = "none";
			}
		}
	}
}

function searchNonAcademic() {
	// Declare variables
	var input,filter,table,tr,td,i,txtValue;
	input = document.getElementById("nonacademicsearch");
	filter = input.value.toUpperCase();
	table = document.getElementById("nonacademictableactual");
	tr = table.getElementsByTagName("tr");
	
	// Loop through all table rows, and hide those who don't 
	//match the search query
	for(i=0;i<tr.length;i++) {
		td = tr[i].getElementsByTagName("td")[0];
		if(td) {
			txtValue = td.textContent || td.innerText;
			if(txtValue.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			}
			else {
				tr[i].style.display = "none";
			}
		}
	}
}

function searchSubject() {
	// Declare variables
	var input,filter,table,tr,td,i,txtValue;
	input = document.getElementById("subjectsearch");
	filter = input.value.toUpperCase();
	table = document.getElementById("subjecttableactual");
	tr = table.getElementsByTagName("tr");
	
	// Loop through all table rows, and hide those who don't 
	//match the search query
	for(i=0;i<tr.length;i++) {
		td = tr[i].getElementsByTagName("td")[0];
		if(td) {
			txtValue = td.textContent || td.innerText;
			if(txtValue.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			}
			else {
				tr[i].style.display = "none";
			}
		}
	}
}

function searchSport() {
	// Declare variables
	var input,filter,table,tr,td,i,txtValue;
	input = document.getElementById("sportsearch");
	filter = input.value.toUpperCase();
	table = document.getElementById("sporttableactual");
	tr = table.getElementsByTagName("tr");
	
	// Loop through all table rows, and hide those who don't 
	//match the search query
	for(i=0;i<tr.length;i++) {
		td = tr[i].getElementsByTagName("td")[0];
		if(td) {
			txtValue = td.textContent || td.innerText;
			if(txtValue.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			}
			else {
				tr[i].style.display = "none";
			}
		}
	}
}

function searchStudentSubject() {
	// Declare variables
	var input,filter,table,tr,td,i,txtValue;
	input = document.getElementById("studentsubjectsearch");
	filter = input.value.toUpperCase();
	table = document.getElementById("studentsubjecttableactual");
	tr = table.getElementsByTagName("tr");
	
	// Loop through all table rows, and hide those who don't 
	//match the search query
	for(i=1;i<tr.length;i++) {
		td = tr[i].getElementsByTagName("th")[0];
		if(td) {
			txtValue = td.textContent || td.innerText;
			if(txtValue.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			}
			else {
				tr[i].style.display = "none";
			}
		}
	}
}
</script>
<script type="text/javascript">
function checkradioupdate(value) {
	var updatestudentbtn = document.getElementById("updatestudentbtn");
	var updateacademicbtn = document.getElementById("updateacademicbtn");
	var updatenonacademicbtn = document.getElementById("updatenonacademicbtn");
	var radiocheckedlabel = document.getElementById("radiocheckedlabel");
	var updatestudentsubmit = document.getElementById("updatestudentsubmit");
	var updateacademicsubmit = document.getElementById("updateacademicsubmit");
	var updatenonacademicsubmit = document.getElementById("updatenonacademicsubmit");
	
	if(value == null) {
		radiocheckedlabel.innerText = "Select a row first!";
		return false;
	}
	else {
		if(value.toString().charAt[0]=="S") {
			updatestudentsubmit.disabled = false;
			return true;
		}
		else if(value.toString().charAt[0]=="A") {
			updateacademicsubmit.disabled = false;
			return true;
		}
		else if(value.toString().charAt[0]=="N") {
			updatenonacademicsubmit.disabled = false;
			return true;
		}
	}
}

function getStudent() {
	var x = $('input[name="studentidradio"]:checked').val();
	
	var xhr = new XMLHttpRequest();
	
	xhr.open('GET','getStudent?studentidradio='+x, true);
	
	xhr.send();
}
</script>
<script type="text/javascript" src="./JS/loader.js"></script>
<script type="text/javascript" src="./JS/addstudentvalidation.js"></script>
<script type="text/javascript" src="./JS/updatestudentvalidation.js"></script>
</body>
</html>