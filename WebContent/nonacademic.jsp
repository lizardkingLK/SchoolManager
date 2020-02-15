<%@ page import="com.user.NonAcademic" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sport.*" %>
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
	NonAcademic thisnonac = NonAcademic.getNonAcademicSingleton();
	thisnonac = thisnonac.loadAndSetInstance(name);
	
	String id,email,phone,address,birthdate,registereddate,userName,designation,password,bio,
	status,qualification,salary,priorityLevel,link;
	
	name = thisnonac.getName();
	id = thisnonac.getId();
	email = thisnonac.getEmail();
	phone = thisnonac.getPhone();
	address = thisnonac.getAddress();
	birthdate = thisnonac.getBirthdate();
	registereddate = thisnonac.getRegistereddate();
	userName = thisnonac.getUserName();
	designation = thisnonac.getDesignation();
	password = thisnonac.getPassword();
	bio = thisnonac.getBio();
	status = thisnonac.getStatus();
	qualification = thisnonac.getQualification();
	salary = thisnonac.getSalary();
	priorityLevel = thisnonac.getPriorityLevel();

	if(name == null || priorityLevel.equals("Admin"))
		response.sendRedirect("login.jsp");
	
	link = thisnonac.getLink();
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
<link rel="stylesheet" href="./CSS/nonacademicstyles.css">

<title>School Manager|NonAcademic</title>
</head>

<body>
	<div class="bg-primary shadow-primary-bottom" id="navi">
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
						<li><button type="button" class="btn btn-outline-primary btn-sm rounded-pill text-light" id="profilebtn">My Profile</button></li>
						<li><button type="button" class="btn btn-outline-primary btn-sm rounded-pill text-light" id="sportsbtn">Sports</button></li>
						<li><button type="button" class="btn btn-outline-primary btn-sm rounded-pill text-light" id="itemsbtn">Items</button></li>
					</ul>
				</div>
			</div>
			
			<div class="col-4">
				<p class="text-primary mt-3 radiocheckedlabel bg-light rounded-pill" id="radiocheckedlabel">${result}</p>
			</div>	
		</div>
	</div>
	
	<!-- User Profile -->
	<div class="container emp-profile" id="profilewindow">
		<div class="row">
               <div class="col-md-4">
                   <div class="profile-img">
                       <img id ="profilePicture" src="./images/link/a000000001.jpg" alt="your profile picture"/><div class="clearfix"></div>
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
                   <button class="btn btn-sm btn-outline-primary rounded-pill" id="editprofilebtn">Edit Profile</button>
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
	
	<!-- Sports window -->
		<div class="container" id="sportswindow">
			<div class="card">
				<div class="p-1">
					<h4 class="text-primary float-right p-2 mr-4 mt-3">Sports Menu</h4><div class="clearfix"></div>
				</div>
			</div>
			<div class="card" id="mainview">
				<div class="row">
					<div class="col-4">
						Sports that I coach
						<div class="table-responsive" id="mysporttable">
							<table class="table table-sm mx-auto" id="mysporttableactual">
								<thead>
							  		<tr>
							    		<th scope="col">SportID</th>
							    		<th scope="col">Sport</th>
							  		</tr>
							  	</thead>
							  	<tbody>
							  		<%
							  		List<Sport> mysportlist = SportDao.getRecordsforCoach(id);
									
							  		for(Sport sp:mysportlist) {
							  			out.print("<tr><th scope=\"row\"><p>"
							  						+sp.getSportID()+"</p></th><td><p>"
							  						+sp.getSportName()+"</p></td>");					  						
							  		}
							  		%>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="col-4">
						Students practice 
						<div class="table-responsive" id="practisetable">
							<table class="table table-sm mx-auto" id="practisetableactual">
								<thead>
							  		<tr>
							    		<th scope="col">StudentID</th>
							    		<th scope="col">StudentName</th>
							    		<th scope="col">StartedDate</th>
							  		</tr>
							  	</thead>
							  	<tbody>
							  		<%
							  		for(Sport sp:mysportlist) {
							  			List<Practise> mypractiselist = SportDao.getPractiseList(sp.getSportName());
							  			
								  		for(Practise pr:mypractiselist) {
								  			out.print("<tr><th scope=\"row\"><p>"
								  						+pr.getStudentID()+"</p></th><td><p>"
								  						+pr.getStudentName()+"</p></td><td><p>"
								  						+pr.getStartedDate()+"</p></td>");					  						
								  		}
							  		}
							  		%>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="col-4"></div>
				</div>
			</div>
		</div>
		
<script type="text/javascript">
$(document).ready(function() {
	console.log("SchoolManager v.10");
	
	$('#itemswindow').hide();
	$('#sportswindow').hide();
	
	$('#profilebtn').on('click',function() {
		$('#sportswindow').hide();
		$('#itemswindow').hide();
		$('#profilewindow').fadeToggle(250);
	});
	
	$('#sportsbtn').on('click',function() {
		$('#profilewindow').hide();
		$('#itemswindow').hide();
		$('#sportswindow').fadeToggle(250);
	});
	
	$('#itemsbtn').on('click',function() {
		$('#profilewindow').hide();
		$('#sportswindow').hide();
		$('#itemswindow').fadeIn(250);
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